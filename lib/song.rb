class Song 
  
  attr_accessor :name, :artist
  
  @@all = []
  
  def initialize(name, artist = nil)
    @name = name 
    @@all << self 
    @artist = artist 
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
  
  def artist 
    @artist
    
  end  
  
end   