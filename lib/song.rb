require "pry"

#this file contains all of my song methods in the song class so I can run these methods in other files
#by simply calling on the class in such: Song.new()

class Song
  
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name

    self.artist = artist unless artist == nil
    # @@all << self
    self.genre = genre unless genre ==  nil
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
    song = self.new(name)
    # song.save
    # song
  end

  def songs
    @songs
  end
#binding.pry
  # def artist=(artist)
  #   self.all.push(artist)
  # end

  def artist=(artist)
     @artist = artist
     #calls on the add_song method with an argument of self to the artist name
     artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    #if the genres song includes self 
    if !(genre.songs.include?(self))
      #then call on the songs method and push self
      genre.songs << self
      # Genre.all.push(genre)
# binding.pry
    end
  end

  def self.find_by_name(name)
    @@all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(filename)
    info = filename.split(" - ")
    artist, name, genre = info[0], info[1], info[2].gsub( ".mp3" , "")
    genre = Genre.find_or_create_by_name(genre)
    artist = Artist.find_or_create_by_name(artist)
#binding.pry
    new(name, artist, genre)
    # file_array = file_name.split(' - ') 
    # file = Song.new(file_array[1])
    # file.artist_name = file_array[0]        
    # file 
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename) 
  end
end