require 'pry'
class MusicImporter 

attr_accessor :path
attr_reader :files 
def initialize(path)
    @path = path 
    
  end 
 
 def files 
  Dir.glob("#{path}/*").map{|file| file.gsub("#{path}/",'')}
 end

 def import 
  files.each do |x|
   Song.create_from_filename(x) 
  end 
 end
end