# require_relative './findable.rb'
 
class Genre 
  attr_accessor :name, :songs, :artist
  extend Concerns::Findable
  
  @@all = [] 
  
  def initialize(name)
    @name = name 
    @songs = []
    @artist= artist 
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

  def self.create(genre_name)
   genre= self.new(genre_name)
   genre.save
   genre
  end 
  
   def artists 
    self.songs.collect do |song| 
      song.artist 
  end.uniq 
  
   end 
end 