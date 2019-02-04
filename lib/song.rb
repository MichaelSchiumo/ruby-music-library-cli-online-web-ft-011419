class Song 
  
  attr_accessor :name, :artist, :genre
  
  @@all = []
  
  def initialize(name, artist = nil,genre = nil)
    @name = name 
    @@all << self 
    #@artist = artist 
    self.artist = artist if artist
    self.genre = genre if genre
  end  
  
  def self.all
    @@all
  end  
  
  def self.destroy_all 
    self.all.clear
  end  
  
  def save 
    @@all << self
  end
  
  def self.create(name)
    song = new(name)
    song.save
    song 
  end 
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end  
  
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end
  
  def self.find_by_name(name)
    all.detect{ |s| s.name == name }
  end
  
  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end 
  
end   