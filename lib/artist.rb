class Artist

    extend Concerns::Findable

    @@all = [] 

    attr_accessor :name
    attr_reader :genre

    def initialize (name)
        @name = name
        @songs = []
    end

    def self.all
        @@all
    end

    def self.destroy_all
        self.all.clear
    end

    def save
        @@all << self
    end

    def self.create (name)
        self.new(name).tap { |artist| artist.save} #instead of setting a new
        # instance of artist (self.new) to a local variable (song_new), calling 
        # save on that variable, and then returning the new instance, 
        # the receiver of .tap is passed through the block and then 
        # inherently returned, eliminating 2 lines of code (alternative below)
        
        # song_new = self.new (name)
        # song_new.save
        # song_new
    end

    def songs
        @songs
    end

    def add_song (song_name)
        song_name.artist ||= song_name.artist = self
        if !@songs.any?(song_name) 
            @songs << song_name end
    end

    def genres #artist has many genres through songs
        genres = @songs.collect { |song| song.genre }
        genres.uniq
        
        # @songs already is a collection of only the songs unique to that artist
        # WHY DOESN'T .TAP WORK
    end




end

