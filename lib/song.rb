require 'pry'
class Song
attr_accessor :name, :artist, :genre
# attr_reader :artist, :song
@@all = []

    def initialize(name, artist=nil, genre=nil)
        @name = name
        self.artist = artist unless artist == nil 
        self.genre = genre unless genre == nil 
        save 
    end

    def self.new_from_filename(filename)
        song_name = filename.split(" - ")[1]
        song_artist = filename.split(" - ")[0]
        song_genre = filename.split(" - ")[2].gsub(".mp3", "")

        song = self.find_or_create_by_name(song_name)
        song.artist = Artist.find_or_create_by_name(song_artist)
        song.genre = Genre.find_or_create_by_name(song_genre)
        song

    end

    def self.create_from_filename(filename)
        new_from_filename(filename)
        
    end


    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def self.find_by_name(name)
        @@all.find do |song|
            song.name == name
        end

    end

    def self.find_or_create_by_name(name)
        self.find_by_name(name) || self.create(name)
    end


    def genre=(genre)
        @genre = genre
        if !genre.songs.include?(self)
            genre.songs << self
        end
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
        new_song = self.new(name)

    end

    def self.destroy_all
        @@all.clear 
    end



end


# ****************************************************
