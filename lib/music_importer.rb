require 'pry'

class MusicImporter
    
    attr_reader :path

    def initialize(file_path)
        @path = file_path
    end

    def files
        Dir.chdir(path) do
            Dir.glob("*.mp3")
        end    
    end

    def import
        files.each do |file|
            Song.create_from_filename(file)
        end
    end
end