require 'pry'
class Song

    attr_accessor :name, :artist, :genre

    @@all = []


    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.artist = artist
        self.genre = genre
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

    def self.create(name, artist = nil, genre = nil)
        song = self.new(name, artist = nil, genre = nil)
        @@all << song
        song
    end

    def artist
        @artist 
    end

    def artist=(artist)
        @artist = artist
        if @artist != nil
            @artist.add_song(self)
        end
    end

    def genre=(genre)
        @genre = genre
        if @genre!= nil && @genre.songs.none? { |song| song == self}
            @genre.songs << self
        end
    end

    def self.find_by_name(name)
        @@all.find { |song| song.name == name}
    end

    def self.find_or_create_by_name(name)
        find_by_name(name) || create(name)
    end

    def self.new_from_filename(filename)
        parts = filename.split(" - ")
        artist = Artist.find_or_create_by_name(parts[0])
        genre = Genre.find_or_create_by_name(parts[2].gsub(".mp3", ""))
        self.new(parts[1], artist, genre)
    end
    
    def self.create_from_filename(filename)
       song = self.new_from_filename(filename)
       song.save
    end



end