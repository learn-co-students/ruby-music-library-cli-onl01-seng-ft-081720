class Genre
    attr_accessor :name, :artists, :songs
    extend Concerns::Findable

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

    def self.create(genre)
        song = self.new(genre)
        song.save
        song
    end

    def artists
        songs.map{|song| song.artist}.uniq
    end
end