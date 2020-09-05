

class Genre
    extend Concerns::Findable
    
attr_accessor :name
# attr_reader :songs
@@all = []

    def initialize(name)
        @name = name
        @songs = []
        # save
    end
    
    def save
        @@all << self
    end

    def songs
        @songs
    end

    def self.create(name)
        new_genre = self.new(name)
        new_genre.save
        new_genre
    end

    def artists
        artists = @songs.collect do |song|
            song.artist
        end
        artists.uniq

    end


    def self.destroy_all
        @@all.clear 
    end

    def self.all
        @@all
    end

end
