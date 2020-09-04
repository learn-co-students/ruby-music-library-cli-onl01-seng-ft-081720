class MusicImporter
 attr_accessor :path, :files

 def initialize(file_path)
     @path = file_path
 end

 def files
     Dir.children(self.path) 
 end

 def import
     self.files.each{ |filename| Song.create_from_filename(filename) }
 end


end