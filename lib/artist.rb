# require_relative './findable.rb'
class Artist 
  attr_accessor :name, :songs, :genre
  extend Concerns::Findable
  
  @@all = [] 
  
  def initialize(name)
    @name = name 
    @songs = []
    @genre = genre
  end
  
  def self.all
  @@all 
  end
  
  def self.destroy_all
    @@all.clear
  end 
  
  def save
  self.class.all << self 
  end

  def self.create(artist_name)
  artist = self.new(artist_name)
  artist.save
  artist
  end 
  
  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self if song.artist == nil
  end
  
  def genres
  self.songs.uniq.collect do |song| 
    song.genre 
  end.uniq    

 end 
 
end 