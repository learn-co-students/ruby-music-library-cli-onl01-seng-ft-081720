

require 'pry'
class Artist
extend Concerns::Findable

    attr_accessor :name, :songs, :genres

    @@all = []


    def initialize(name)
        @name = name
        #save
        @songs = []
       
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def self.destroy_all
        @@all.clear
    end

    def self.create(name)
        #name = self.new(name)
        artist = self.new(name)
        @@all << artist
        artist
    end

    def songs
        @songs
    end

    def add_song(song)
        song.artist ||= self
        if @songs.none? { |songs| songs == song } 
            @songs << song
        end
    end

    def genres
        song_genres = @songs.map { |song| song.genre }
            song_genres.uniq
    end
    


end
  