class Genre
    extend Concerns::Findable

    attr_accessor :name, :songs

    @@all = [] 

    def initialize(name)
        @name = name
        @songs = []
        save
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

    def self.create(name)
        artist = self.new(name)
        # song = self.new(name).tap do |genre|
        # genre.save
        # end
    end

    def songs
        @songs
    end

    # def artist 
    #     @artist 
    # end

    # def add_song(song)
    #     song.artist = self unless song.artist == self
    #     @songs << song unless @songs.include?(song)
    # end

    def artists
        artists = @songs.collect do |song|
            song.artist
        end
        artists.uniq
    end
end
