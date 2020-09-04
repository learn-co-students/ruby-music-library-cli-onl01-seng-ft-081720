class Song

    attr_accessor :name
    attr_reader :artist, :genre
    @@all = []

    def initialize (name, artist=nil, genre = nil)
        @name = name
        self.artist = artist if artist != nil
        self.genre = genre if genre != nil
        save
    end

    def artist=(artist)
        @artist = artist
        @artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
        genre.songs << self unless genre.songs.include?(self)
    end

    def self.find_by_name(name)
        self.all.find{|song| song.name == name}
    end

    def self.find_or_create_by_name (name)
        self.find_by_name(name) || self.create(name)
    end

    def self.new_from_filename(filename)
        new_file = filename.split(".mp3")
        file = new_file[0].split(" - ")
        song = Song.find_or_create_by_name(file[1])
        song.genre = Genre.find_or_create_by_name(file[2])
        song.artist = Artist.find_or_create_by_name(file[0])
        song.artist.songs << song
        song
    end

    def self.create_from_filename(filename)
        self.new_from_filename(filename)
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def self.destroy_all
        self.all.clear
    end

    def self.create (name)
        song = Song.new(name)
        song
    end

end