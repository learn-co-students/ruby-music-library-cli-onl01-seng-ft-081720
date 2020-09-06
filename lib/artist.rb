
require 'pry'
class Artist 
  extend Concerns::Findable 
  
  attr_accessor :name,:song, :songs
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
  
  def self.create(name)
    self.new(name)
  end
  
  
  def add_song(song)
    if song.artist == nil 
       song.artist = self
   end
   if !@songs.include?(song)
     @songs << song
  end
 end 
  
def genres
  new = []
   Song.all.collect do |x|
    if x.artist == self 
     new << x.genre
    end
   end
  new.uniq
 end
end 