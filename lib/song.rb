# require_relative './findable.rb'
 extend Concerns::Findable
class Song 
  attr_accessor :name, :artist, :genre
 
  
  @@all = [] 
  def initialize(name, artist= nil,genre=nil)
   @name = name 
   self.artist = artist if artist
   self.genre = genre if genre
   
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

  def self.create(song_name)
  song = self.new(song_name)
  song.save
  song
  end 
  
  def artist=(artist)
   @artist = artist
   artist.add_song(self)
  end 
  
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end 
  
  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end 
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create(name)
    end
  end
  
  
def self.new_from_filename(file_name)
    file = file_name.split(" - ")
    artist = file [0]
    name =  file[1]
    genre = file[2].gsub(".mp3", "")
    new_artist = Artist.find_or_create_by_name(artist)
    new_genre = Genre.find_or_create_by_name(genre)
    new_song = Song.new(name, new_artist, new_genre)
  end
  

  def self.create_from_filename(file_name)
   @@all << new_from_filename(file_name)
  end

end 