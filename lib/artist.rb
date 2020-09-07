class Artist
    attr_accessor :name, :songs, :genres
    extend Concerns::Findable
    
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

    def self.create(artist)
        song = self.new(artist)
        song.save
        song
    end

    def songs
        @songs
    end

    def add_song(song)
        song.artist = self if song.artist == nil
        @songs << song if !@songs.include?(song)
    end

    def genres
      songs.map{|song| song.genre}.uniq
    end
end