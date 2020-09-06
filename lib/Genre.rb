class Genre
    extend Concerns::Findable
    
    attr_accessor :name, :genre 

    @@all = []

    def initialize(name)
        @name=name
        @songs=[]
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all.clear
    end
    
    def save
        @@all<<self
    end

    def self.create(name)
     self.new(name).save
       @@all.last
    end

    def songs
        @songs
    end

    def artists
        collected_artists = songs.collect { |song| song.artist}
        collected_artists.uniq
    end



end