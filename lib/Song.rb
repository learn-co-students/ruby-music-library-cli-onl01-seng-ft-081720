class Song

    attr_accessor :name
    attr_reader :artist, :genre

    @@all = [] 

    def initialize(name, artist=nil, genre=nil)
        @name = name
        @song = []
        self.artist=(artist) if artist.class == Artist
        self.genre = (genre) if genre.class == Genre
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

    def self.create(name)
        song = self.new(name)
    end

    def songs
        @songs
    end

    def artist=(artist)
       @artist = artist
       artist.add_song(self)
    end

    def genre=(genre)    
        @genre = genre    
        if !(genre.songs.include?(self))      
            genre.songs << self      
            
        end
    end

    def self.find_by_name(name)
        @@all.detect{|songs| songs.name == name}
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
    end
    
    def self.create_from_filename(filename)
        self.new_from_filename(filename)
    end
end



# if @artist == "" 
#     @artist = artist
# else
#     @artist = @artist
# end
# if self.artist != ""
#     @artist.add_song(self)
# end
# @artist


















# if @artist == nil
#     @artist = artist
# else
#     @artist = @artist
# end
# if self.artist != nil
#     @artist.add_song(self)
# end
# @artist
# end

# def genre(song)

# end