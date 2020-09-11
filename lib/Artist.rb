class Artist
    extend Concerns::Findable
    attr_accessor :name, :song

    @@all = []

    def initialize (name)
        @name = name
        @songs = []
        save
    end

    def songs
       @songs
    end

    def add_song(song)
        if song.artist != self
        @songs << song
        song.artist = self
        elsif @songs.include?(song)
            nil
        else
            @songs << song
        end
    end

    def genres
        response = @songs.collect {|song| song.genre}
        response.uniq
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def self.destroy_all
        self.all.clear
    end

    def self.create (name)
        created_artist = Artist.new(name)
    end

end
