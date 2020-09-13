class Genre 
    extend Concerns::Findable
    attr_accessor :name, :song, :artist
    attr_reader :songs

    @@all = []
    def initialize(name, artist= nil, genre= nil)
        @name = name
        @songs = []
        @genre = genre
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
     self.new(name).tap {|genre| genre.save }


    end
    def add_song(song)

        song.genre = self unless song.genre == self
       @songs.push(song) unless @songs.include?(song)

    end

    def artists

        self.songs.map {|song| song.artist }.uniq

    end

end 