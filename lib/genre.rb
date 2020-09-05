class Genre

    attr_accessor :name, :songs

    @@all = []


    def initialize(name)
        @name = name
        #save
        @songs = []
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
        #name = self.new(name)
        genre = self.new(name)
        @@all << genre
        genre
    end


end