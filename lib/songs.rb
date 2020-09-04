require_relative '../config/environment'

class Song 
  attr_accessor :name, :genre
  attr_reader :artist
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
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
  
  def self.create(song)
    song = self.new(song)
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end 
  
 def genre= (genre)
   @genre = genre 
     genre.songs << self  unless genre.songs.include? self
 end 

#  def self.find_by_name(name)
#     @@all.find {|song| song.name==name }
#  end

#  def self.find_or_create_by_name(name)
#     self.find_by_name(name) || self.create(name)
#  end

 def self.new_from_filename(filename)
    split_file = filename.split(/\s-\s|\.mp3/)
    song = self.create(split_file[1])
    song.artist = Artist.find_or_create_by_name(split_file[0]) 
    song.genre = Genre.find_or_create_by_name(split_file[2])
    song
end

def self.create_from_filename(filename)
    new_from_filename(filename)
end

end