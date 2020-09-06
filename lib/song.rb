class Song  

attr_accessor :name 

attr_reader :artist, :genre  
@@all = [] 

def initialize(name, artist = nil, genre = nil  )
  @name = name
    if artist != nil 
      self.artist = artist
    end
    if genre != nil 
      self.genre = genre 
    end
   save 
end 

def genre=(genre)
  @genre = genre 
   if genre.songs.include?(self) == false
     genre.songs << self
   end
end

def artist=(artist)
  @artist = artist 
  artist.add_song(self)
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

def self.create(name)
  self.new(name)
end 

 def self.find_by_name(namez) 
   @@all.find do |x|
    if x.name == namez 
       x
   end 
 end
end
   
   def self.find_or_create_by_name(name)
     find_by_name(name) || create(name)
   end
   
   def self.new_from_filename(name)
    artist,song,genre = name.split(" - ")
    x = genre.gsub('.mp3','')
    
    artist = Artist.find_or_create_by_name(artist)
    genre = Genre.find_or_create_by_name(x)
    new(song,artist,genre)
  end
  
def self.create_from_filename(name)
   self.new_from_filename(name)
  end
end
