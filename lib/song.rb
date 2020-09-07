require 'pry'
class Song
    attr_accessor :name, :artist, :genre
    extend Concerns::Findable
    
    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name 
        self.artist = artist if artist != nil 
        self.genre = genre if genre != nil
    
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

    def self.create(song)
        song = self.new(song)
        song.save
        song
    end

    def artist=(artist)
        @artist = artist 
        artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre 
        if !genre.songs.include?(self)
            genre.songs << self
        end
    end

    def self.new_from_filename(filename)
        artist_name, song_name, genre_name = filename.rpartition(".").first.split(" - ")
        artist = Artist.find_or_create_by_name(artist_name)
        genre = Genre.find_or_create_by_name(genre_name)
        self.new(song_name, artist, genre)
    end

    def self.create_from_filename(filename)
        self.new_from_filename(filename).save
    end
end
