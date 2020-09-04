require_relative '../config/environment'

class Genre
    extend Concerns::Findable
    attr_accessor :name, :songs, :artist

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
        @@all = []
    end

    def self.create(genre)
        genre = self.new(genre)
    end

    def artists
        @artists = []
        self.songs.each do |song|
            @artists << song.artist
        end
        @artists.uniq
    end
end