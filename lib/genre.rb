class Genre

    attr_accessor :name, :songs, :artists

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
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
        Genre.new(name).save
        self
    end
    
    def artists
        @artists = []
        @songs.each do |songs|
            @artists << songs.artist
        end
        @artists.uniq
    end
end