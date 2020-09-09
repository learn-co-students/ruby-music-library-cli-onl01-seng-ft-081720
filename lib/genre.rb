class Genre
    extend Concerns::Findable
    
    attr_accessor :name, :songs

    @@all = []

    def initialize (name)
        @name = name
        @songs = []
        save
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
        genre = self.new(name)
        genre
    end

    def songs
        @songs
    end

    def artists
        genre_artists = []
        Song.all.collect do |song| 
            if song.genre == self
                genre_artists << song.artist
            end
        end
        genre_artists.uniq
    end

end