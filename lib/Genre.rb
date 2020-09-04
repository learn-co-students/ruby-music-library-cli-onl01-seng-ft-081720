require_relative '../config/environment'

class Genre 
  attr_accessor :name, :songs
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
  
  def self.create(genre)
    genre = self.new(genre)
    genre.save
    genre
  end 
  
   def artists
        @artists = []
        @songs.each do |songs|
        @artists << songs.artist
        end
        @artists.uniq
    end
end 