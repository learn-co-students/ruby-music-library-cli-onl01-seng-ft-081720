class Genre
    
    extend Concerns::Findable
    attr_accessor :name, :song, :artist
    @@all = []

    def initialize (name)
        @name = name
        @songs = []
        save
    end

    def artists
        response = @songs.collect {|song| song.artist}
        response.uniq
    end

    def songs
        @songs
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
        genre = Genre.new(name)
    end

end
