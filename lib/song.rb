class Song
    attr_accessor :name, :artist, :genre
    
    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name 
        @genre = genre 
        if artist != nil 
            self.artist = artist
        end
    
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

    def genre
        @genre
    end

    def genre=(genre)
        @genre = genre 
        self.genre.add_song(self)
    end

    def self.find_by_name(song_name)
        self.all.find {|song| song.name == song_name}
    end

    def self.find_or_create_by_name(name)

    end
end
