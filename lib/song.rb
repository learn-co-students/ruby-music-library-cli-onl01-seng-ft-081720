require 'pry'

class Song

attr_accessor :name, :artist, :genre

@@all=[]
    def initialize(name,artist=nil,genre=nil)
        @name=name
        @genre=genre
        self.artist=artist if artist
        self.genre=genre if genre
       
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def self.destroy_all
        all.clear
    end

    def self.create(name)
        new=self.new(name)
        new.save
        new
    end

    def artist=(artist)
        @artist=artist
        artist.add_song(self)
        
    end

    def genre=(genre)
        @genre=genre
        if !genre.songs.include?(self)
        genre.songs << self
        end
    end

    def self.find_by_name(name)
        all.find {|song| song.name == name}
    end

    def self.find_or_create_by_name(name)
         find_by_name(name) || create(name)
    end

    def self.new_from_filename(file)
        song_name = file.split("-").map(&:strip)[1]
        artist_name = file.split("-").map(&:strip)[0]
        genre=file.split("- ").map(&:strip)[2].split(".").map(&:strip)[0]
        artist=Artist.find_or_create_by_name(artist_name)
        genre=Genre.find_or_create_by_name(genre)
        new_song= Song.new(song_name,artist,genre)
        new_song

    end

    def self.create_from_filename(file)
        new= new_from_filename(file)
        all << new
    end

   

end

