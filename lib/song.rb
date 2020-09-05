require 'pry'

class Song
    extend Concerns::Findable

    attr_accessor :name
    attr_reader :artist, :genre
    @@all = []
    
    def initialize(name, artist=nil, genre=nil)
        @name = name
        self.artist = artist unless artist == nil
        self.genre = genre unless genre == nil
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
    
    def self.create(name)
        self.new(name)
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
        !genre.songs.include?(self) ? genre.songs << self : nil
    end

    def self.new_from_filename(file)
        arr = file.split(" - ").map{|x| x.chomp(".mp3")}        
        new_song = Song.new(arr[1])
        artist = Artist.find_or_create_by_name(arr[0])
        genre = Genre.find_or_create_by_name(arr[2])
        
        new_song.artist = artist
        new_song.genre = genre
        new_song
    end

    def self.create_from_filename(file)
        Song.new_from_filename(file)
    end

end