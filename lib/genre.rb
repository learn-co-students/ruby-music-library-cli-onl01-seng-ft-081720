#require 'pry'

class Genre
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
        new_genre = Genre.new(name)
        new_genre.save
        new_genre
    end

    def save
        @@all << self
    end

    def songs
        @songs
    end

    def add_song(song)
        song.genre ||= self
        @songs << song unless songs.include? song
    end

    def artists
        songs.map(&:artist).uniq
    end
end
