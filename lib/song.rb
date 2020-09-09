require 'pry'

class Song
    extend Concerns::Findable

    attr_accessor :name, :artist, :genre

    @@all = []

    def initialize (name, artist = nil, genre = nil)
        @name = name
        self.artist= artist
        self.genre = genre
        save
    end

    def artist= (artist)
        @artist = artist
        if @artist != nil
            artist.add_song(self)
        end
        @artist
    end

    def genre= (genre)
        @genre = genre
        if @genre != nil && genre.songs.include?(self) == false
            genre.songs << self
        end
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

    def self.create (name)
        song= self.new(name)
        song
    end

    def self.new_from_filename (file)
       split_file = file.split (" - ")
       song_name = split_file [1]
       song_artist = split_file [0]
       song_genre = split_file [2].gsub(".mp3", "")

       song_artist = Artist.find_or_create_by_name(song_artist)
       song_genre = Genre.find_or_create_by_name(song_genre)

       song = self.new(song_name, song_artist, song_genre)
    end

    def self.create_from_filename (file)
        new_from_filename(file)
    end
    
end