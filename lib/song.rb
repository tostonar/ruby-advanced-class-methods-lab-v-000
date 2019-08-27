class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    self.all.find{|song|song.name == name}
  end

  def self.find_or_create_by_name(name)
     song = self.find_by_name(name) || self.create_by_name(name)
     song
  end

  def self.alphabetical
    self.all.sort_by{|song| [song.name] }
  end

  # "Thundercat - For Love I Come.mp3"
  def self.new_from_filename(filename)
    filename = filename.delete_suffix(".mp3")
    filename = filename.split(" - ")
    artist_name = filename[0]
    name = filename[1]
    song = self.new
    song.name = name
    song.artist_name = artist_name
    song

  end

  def self.create_from_filename(filename)
    @@all << self.new_from_filename(filename)
  end

  def self.destroy_all
    @@all.clear
  end

end
