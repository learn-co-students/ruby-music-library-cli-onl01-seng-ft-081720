class Genre
    extend Concerns::Findable

    attr_accessor :name, :songs, :artist

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
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

    def artists
        @artists = []
        @songs.each do |songs|
            @artists << songs.artist
        end
        @artists.uniq
    end

end