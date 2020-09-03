require 'pry'
class Artist

    attr_accessor :name, :songs, :genres

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
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
        Artist.new(name).save
        self
    end

    def songs
        @songs
    end

    def add_song(song)
        # binding.pry
        if song.artist == nil
            song.artist = self
        end
        if @songs.include?(song)
            song
        else
            @songs << song
        end
    end

    def genres
        @genres = []
        @songs.each do |songs|
            @genres << songs.genre
        end
        @genres.uniq
    end

end