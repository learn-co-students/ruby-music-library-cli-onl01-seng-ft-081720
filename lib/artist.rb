class Artist
    extend Concerns::Findable

    attr_accessor :name, :songs, :genre

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
        artist = self.new(name)
    end
     
    def add_song(song)
        if songs.include?(song)
            "I already know this song"
        else
            @songs << song
            if song.artist == nil
                song.artist = self
            else
                song.artist
            end
        end
    end

    def genres
        my_genres = []
        songs.collect do |song|
            my_genres << song.genre
        end
        my_genres.uniq
    end

end