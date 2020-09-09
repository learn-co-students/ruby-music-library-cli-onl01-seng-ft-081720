require 'pry'

class MusicImporter
    attr_accessor :path, :files

    def initialize (file)
        @path = file
    end

    def files
       files = Dir.entries("#{@path}")
       files.select { |file| file.end_with? (".mp3")}
    end

    def import 
        files.each do |file|
            Song.create_from_filename(file)
        end
    end

end