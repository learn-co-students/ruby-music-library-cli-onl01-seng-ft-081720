class Song

    @@all = [] 

    attr_accessor :name, :filename
    attr_reader :artist, :genre

    def initialize (name, artist = nil, genre = nil)
        @name = name
        self.artist = artist
        self.genre = genre
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

    def self.create (name, artist = nil, genre = nil)
        self.new(name).tap { |song| song.save}

        # song_new = self.new (name)
        # song_new.save
        # song_new
    end

    def artist= (artist)
        @artist ||= artist # long-hand below
        # if @artist == nil
        #     @artist = artist
        #   else
        #     @artist = @artist
        #   end
        @artist.add_song(self) if self.artist
        @artist
    end

    def genre= (genre)
        @genre ||= genre 
        @genre.add_song(self) if self.genre
        @genre
    end

    def self.find_by_name (name)
        self.all.find { |song| song.name == name}
    end

    def self.find_or_create_by_name (name)
        find_by_name(name) || create(name)
    end

    def self.new_from_filename (filename)
        # split filename on " - " , [0] = artist, [1] = title, [2] = genre
        artist, name, genre = filename.chomp(".mp3").split(" - ")
        # genre = genre.chomp(".mp3")
        song = self.find_or_create_by_name(name)
        song.artist = Artist.find_or_create_by_name(artist)
        song.genre = Genre.find_or_create_by_name(genre)
        song
    end

    def self.create_from_filename (filename)
        new_from_filename(filename) || create(filename)
    end










end
