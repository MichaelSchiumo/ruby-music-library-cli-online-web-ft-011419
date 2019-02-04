class Genre 
  
  extend Concerns::Findable
  
  attr_accessor :name, :songs 

  @@all = []
  
  def initialize(name)
    @name = name 
    #@@all << self 
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
    genre = new(name)
    genre.save
    genre 
  end   
  
  def artists 
    songs.collect {|s| s.artist}.uniq
  end   
  
  def self.find_by_name(name)
    self.all.detect {|g| g.name == name}
  end  
  
  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end  
  
end   