class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path 
  end   

  def import
    files.each {|filename| Song.create_from_filename(filename)}
  end  
  
  def files 
     @list_of_filenames||= Dir.glob("#{path}/*.mp3").collect {|file| file.gsub("#{path}/","")}
  end   
   
  
end