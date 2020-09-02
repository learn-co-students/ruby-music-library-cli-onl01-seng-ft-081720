require 'pry'
class MusicImporter
    attr_accessor :path
    @@all=[]
    def initialize(path)
        @path=path
        @@all << self
    end

    def files
        Dir["#{self.path}/*.mp3"].select{ |f| File.file? f }.map{ |f| File.basename f } 
    end

    def self.all
        @@all
    end

    def import
        self.files.each {|song| Song.create_from_filename(song)}
    end

end