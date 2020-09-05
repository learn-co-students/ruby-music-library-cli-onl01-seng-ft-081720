require 'pry'

class Artist
    extend Concerns::Findable
    # include Concerns::InstanceMethods

    attr_accessor :name 
    attr_reader :songs, :genres
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

    def add_song(song)
        if !song.artist
            song.artist = self
        end

        if !self.songs.include?(song)
            @songs << song
        end
    end

    def genres
        self.songs.map{|song| song.genre} .uniq
    end
end