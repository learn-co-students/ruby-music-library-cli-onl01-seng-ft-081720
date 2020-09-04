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
        song.artist = self if song.artist != self
        @songs << song if !@songs.any?(song)
    end
    
    def genres
        self.songs.map {|song| song.genre}.uniq
    end

end