class Artist
    extend Concerns::Findable
    attr_accessor :name, :songs
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
    def self.create (name)
        artist = Artist.new(name)
        artist
    end
    def songs
        @songs
    end
    def add_song(song)
        if song.artist == nil
            song.artist = self
        end
        if !self.songs.include?(song)
            @songs << song
        end
    end
    def genres
        Genre.all
    end
end