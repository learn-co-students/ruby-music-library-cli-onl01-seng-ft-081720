require 'pry'

#this file contains all of my genre methods in the genre class so I can run these methods in other files
#by simply calling on the class in such: Genre.new()
class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []
  def initialize(name)
    @name = name
    @songs = []
    # @@all << self
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
    artist = self.new(name)
  end

  def songs
    @songs
  end

  def artists
    self.songs.collect {|song| song.artist}.uniq
  end

end