require 'pry'


class Artist
    extend Concerns::Findable

attr_accessor :name
@@all = []

    def initialize(name)
        @name = name
        @songs = []
        save

    end


    def self.create(name)
        new_artist = self.new(name)
    end

    def add_song(song)
        if song.artist == nil
            song.artist = self
        end
        
        @songs << song unless @songs.include?(song)
    end

    def save
        @@all << self
    end
    
    def genres
        genres = self.songs.collect do |song|
            song.genre
        end
        genres.uniq
    end


    def songs
        @songs
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all.clear 
    end







end
