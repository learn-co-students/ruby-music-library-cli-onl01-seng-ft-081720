class Artist 
    extend Concerns::Findable

    attr_accessor :name 
    attr_reader :songs

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
        artis = self.new(name)
        # song = self.new(name).tap do |artist|
        # artist.save
        # end
    end

    # def self.find_by_name(name)
    #     @@all.detect{|artist| artist.name == name}
    # end

    def self.count
        @@all.size
    end

    def songs
        @songs
    end

    def add_song(song)
        song.artist = self unless song.artist == self
        @songs << song unless @songs.include?(song)
    end

    def genres
        genres = @songs.collect do |song|
            song.genre
        end
        genres.uniq
    end
end
