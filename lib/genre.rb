class Genre

    extend Concerns::Findable

    @@all = [] 

    attr_accessor :name
    attr_reader :artist

    def initialize (name)
        @name = name
        @songs = []
    end

    def self.all
        @@all
    end

    def self.destroy_all
        self.all.clear
    end

    def save
        @@all << self
    end

    def self.create (name)
        self.new(name).tap { |genre| genre.save} 
    end

    def songs
        @songs
    end

    def add_song (song_name)
        song_name.genre ||= song_name.genre = self
        if !@songs.any?(song_name) 
            @songs << song_name end
    end

    def artists #genre has many artists through songs
        artists = @songs.collect { |song| song.artist }
        artists.uniq
    end

end