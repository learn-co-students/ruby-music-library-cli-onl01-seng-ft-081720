class Song

    attr_accessor :name, :artist, :genre

    @@all = []

    def initialize(name, artist=nil, genre=nil)
        @name = name
        if artist != nil
            self.artist = artist
        end

        if genre != nil
            self.genre = genre
        end
        save
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
        self.new(name)
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end
 
    def genre=(name)
        @genre = name
        if !@genre.songs.include?(self)
            @genre.songs << self
        end
    end

    def self.find_by_name(name)
        @@all.find {|song| song.name == name}
    end
 
    def self.find_or_create_by_name(name)
        self.find_by_name(name) || self.create(name)
    end
 
    def self.new_from_filename(filename)
        song_artist = filename.split(" - ")[0]
        song_title = filename.split(" - ")[1]
        song_genre = filename.split(" - ")[2].split(".mp3")[0]
        song = Song.create(song_title)
        song.artist = Artist.find_or_create_by_name(song_artist)
        song.genre = Genre.find_or_create_by_name(song_genre)
        song
    end
 
    def self.create_from_filename(filename)
        new_from_filename(filename)
    end

end