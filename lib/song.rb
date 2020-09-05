require 'pry'

class Song
    attr_accessor :name
    attr_reader :artist, :genre
    @@all = []
    def initialize(name, artist=nil, genre=nil)
        @name = name
        self.artist = artist if artist
        self.genre = genre if genre
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
    def self.create (name)
        song = Song.new(name)
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
        self.all.find {|song| song.name == name}
    end
    def self.find_or_create_by_name(name)
        self.find_by_name(name) || self.create(name)
    end
    def self.new_from_filename(filename)
        properties = filename.split(" - ")
        artist_name = properties[0]
        song_name = properties[1]
        genre_name = properties[2].gsub(".mp3", "")
        artist = Artist.find_or_create_by_name(artist_name)
        genre = Genre.find_or_create_by_name(genre_name)

        new_song = Song.new(song_name, artist, genre)
    end
    def self.create_from_filename(filename)
        self.new_from_filename(filename) || self.creat(filename)
    end
end