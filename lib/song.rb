require 'pry'

class Song
    attr_accessor :name
    attr_reader :artist, :genre

    @@all = []
    
    def initialize(name, artist=nil, genre=nil)
        @name = name
        self.artist = artist if artist
        self.genre = genre if genre
    end

    def self.all
        @@all
    end

    def self.destroy_all
        self.all.clear
    end

    def self.create(name)
        new_song = Song.new(name)
        new_song.save
        new_song
    end

    def self.find_by_name(name_string)
        @@all.find {|song| song.name == name_string}
    end

    def self.find_or_create_by_name(name_string)
        find_by_name(name_string) ? find_by_name(name_string) : create(name_string)
    end

    def self.new_from_filename(file_name)
        song = file_name.chomp(".mp3").split(" - ")
        new_song = Song.new(song[1])
        new_song.artist = Artist.find_or_create_by_name(song[0])
        new_song.genre = Genre.find_or_create_by_name(song[2])
        new_song
    end

    def self.create_from_filename(file_name)
        new_from_filename(file_name).save
    end

    def save
        @@all << self
    end

    def artist=(artist_string)
       @artist = artist_string
       artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
        genre.add_song(self)
    end
end