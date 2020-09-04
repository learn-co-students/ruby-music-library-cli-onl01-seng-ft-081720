require_relative '../config/environment'
require 'pry'
class Artist
    extend Concerns::Findable
    attr_accessor :name, :songs, :genres

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all.clear
    end

    def self.create(artist)
        artist = self.new(artist)
    end

    def add_song(song)
        if song.artist != self
            song.artist = self
        end
        if !@songs.any?(song)
                @songs << song
        end 
    end
    
    def genres
        @genres = []
        self.songs.each do |song|
            @genres << song.genre
        end
        @genres.uniq
    end

end