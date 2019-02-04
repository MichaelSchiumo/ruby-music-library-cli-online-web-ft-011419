class Artist 
  
  extend Concerns::Findable
  
  attr_accessor :name 
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @@all << self 
    @songs = []

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
    artist = new(name)
    artist.save
    artist
  end  
  
  def songs 
    @songs 
  end  
  
  def add_song(song)
    song.artist = self unless song.artist
    songs << song unless songs.include?(song)
  end 
  
  def genres
    songs.collect{ |s| s.genre }.uniq
  end
  
  def self.find_by_name(name)
    all.detect {|a| a.name == name}
  end  
  
  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end  
end   