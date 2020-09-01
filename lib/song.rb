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
        @@all.clear
    end

    def save
        @@all << self
    end

    def self.create(name)
        song = self.new(name)
        song.save
        song
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
        genre.songs << self if !genre.songs.include?(self)
    end

    def self.find_by_name(song_name)
        @@all.find { | song | song.name == song_name }
    end

    def self.find_or_create_by_name(song_name)
        if find_by_name(song_name)
            find_by_name(song_name)
        else
            create(song_name)
        end
    end

    def self.new_from_filename(file_name)
        artist = file_name.split(' - ')[0]
        song = file_name.split(' - ')[1]
        genre = file_name.split(' - ')[-1].split('.mp3')[0]
        new_song = Song.new(song)
        new_song.artist = Artist.find_or_create_by_name(artist)
        new_song.genre = Genre.find_or_create_by_name(genre)
        new_song
    end

    def self.create_from_filename(file_name)
        new_from_filename(file_name).save
    end
end