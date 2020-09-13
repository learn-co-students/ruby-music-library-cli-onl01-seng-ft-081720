class Song 
    attr_accessor :name, :artist, :genre
    attr_reader 
    
    
    @@all = []
    def initialize(name, artist= nil, genre= nil)
        @name = name 
        self.artist= (artist) if artist
        self.genre= (genre) if genre
    
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
        self.new(name).tap {|song| song.save }
    end
    
    def artist= (artist)
        @artist = artist unless @artist
        artist.add_song(self)
    end
    
    def genre= (genre)
        @genre = genre unless @genre
        genre.add_song(self)
    end
    
    def self.find_by_name(name)
    
        @@all.find {|song| song.name == name}
    
    end
    
    def self.find_or_create_by_name(name)
        self.find_by_name(name) || self.create(name) 
    end
    
    
    def self.create_from_filename(name)
        @@all << self.new_from_filename(name)
    
    end
    
    def self.new_from_filename(name)
    
        song_name = name.split(" - ")[1]
        artist_name = name.split(" - ")[0]
        genre_name = name.split(" - ")[2].chomp(".mp3")
    
        song = self.find_or_create_by_name(song_name)
    
        song.artist = Artist.find_or_create_by_name(artist_name)
    
        song.genre = Genre.find_or_create_by_name(genre_name)
        song
    end
end  