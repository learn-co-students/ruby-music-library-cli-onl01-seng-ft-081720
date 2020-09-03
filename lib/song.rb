class Song

    attr_accessor :name, :artist, :genre
    

    @@all = []

    def initialize(name, artist = nil, genre  = nil)
        @name = name
        if artist != nil
            self.artist=(artist)
        end 
        if genre != nil
            self.genre=(genre)
        end
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
        Song.new(name).save
        self
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
        if genre.songs.include?(self)
            self
        else
            genre.songs << self
        end
    end

    def self.find_by_name(name)
        @@all.find {|song| song.name == name}.class
    end

    def self.find_or_create_by_name(name)
        # binding.pry
        item = find_by_name(name)
        if item == nil
            Song.create(name)
        else
            item.class
        end

    end

end