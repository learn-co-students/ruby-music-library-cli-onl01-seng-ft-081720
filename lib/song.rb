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
    


end