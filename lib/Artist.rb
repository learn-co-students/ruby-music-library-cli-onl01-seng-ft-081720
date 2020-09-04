require_relative '../config/environment'

class Artist 
  attr_accessor :name, :songs, :genres 
  extend Concerns::Findable
  
  @@all = [] 
  
  def initialize(name)
    @name = name 
    @songs = []
    save 
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
  
  def self.create(artist)
    artist = self.new(artist)
    # artist.save
    # artist
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
        @songs.each do |songs|
            @genres << songs.genre
        end
        @genres.uniq
    end
end 