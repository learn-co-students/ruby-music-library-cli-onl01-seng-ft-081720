require 'pry'

class Artist
    
    extend Concerns::Findable
    attr_accessor :name, :songs
    @@all=[]
        def initialize(name)
            @name=name
            @songs=[]
        end
    
        def self.all
            @@all
        end
    
        def save
            @@all << self
        end
    
        def self.destroy_all
            all.clear
        end
    
        def self.create(name)
            new=self.new(name)
            new.save
            new
        end

        def add_song(song)
            if song.artist==nil 
                song.artist= self
            end
            if !self.songs.include?(song)
                songs << song
            end
            
        end

        def genres
            self.songs.map {|song| song.genre}.uniq
        end
    end
    