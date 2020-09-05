require 'pry'

class Genre
    extend Concerns::Findable
    # include Concerns::InstanceMethods

    attr_accessor :name
    attr_reader :songs, :artists
    @@all = []
    
    def initialize(name)
        @name = name
        @songs = []
        save
    end
    def self.all
        @@all
    end
    def self.destroy_all
        @@all.clear
    end
    def save
        @@all << self
    end
    def self.create(name)
        self.new(name)
    end

    def songs
        @songs
    end

    def artists
        arr = Song.all.select{|song| song.genre == self}
        arr.map{|song| song.artist} .uniq
    end    
end