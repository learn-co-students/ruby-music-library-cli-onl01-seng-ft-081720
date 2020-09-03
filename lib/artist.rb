#require 'pry'

class Artist
    extend Concerns::Findable
    
    attr_accessor :name

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

    def self.create(name)
        new_artist = Artist.new(name)
        new_artist.save
        new_artist
    end

    def save
        @@all << self
    end

    def songs
        @songs
    end

    def add_song(song)
        song.artist ||= self
        @songs << song unless songs.include? song
    end

    def genres
        songs.map(&:genre).uniq
    end
end