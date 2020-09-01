require 'pry'

class MusicLibraryController

    attr_accessor :path

    def initialize(path='./db/mp3s')
        @path = path
        MusicImporter.new(path).import
    end

    def call
        user_input = ''
        while user_input != 'exit'
            puts "Welcome to your music library!"
            puts "To list all of your songs, enter 'list songs'."
            puts "To list all of the artists in your library, enter 'list artists'."
            puts "To list all of the genres in your library, enter 'list genres'."
            puts "To list all of the songs by a particular artist, enter 'list artist'."
            puts "To list all of the songs of a particular genre, enter 'list genre'."
            puts "To play a song, enter 'play song'."
            puts "To quit, type 'exit'."
            puts "What would you like to do?"

            user_input = gets.strip

            case user_input
            when 'list songs'
                list_songs
            when 'list artists'
                list_artists
            when 'list genres'
                list_genres
            when 'list artist'
                list_songs_by_artist
            when 'list genre'
                list_songs_by_genre
            when 'play song'
                play_song
            end

        end
    end

    def list_songs
        Song.all.sort_by{ | song | song.name }.each.with_index(1) do | song, index |
            puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
    end

    def list_artists
        Artist.all.sort_by{ | artist | artist.name }.each.with_index(1) do | artist, index |
            puts "#{index}. #{artist.name}"
        end
    end

    def list_genres
        Genre.all.sort_by{ | genre | genre.name }.each.with_index(1) do | genre, index |
            puts "#{index}. #{genre.name}"
        end
    end

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        user_input = gets.strip
        Song.all.find_all { | song | song.artist.name == user_input }.sort_by{ | song | song.name }.each.with_index(1) do | song, index |  
            puts "#{index}. #{song.name} - #{song.genre.name}"
        end
    end

    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        user_input = gets.strip
        Song.all.find_all { | song | song.genre.name == user_input }.sort_by{ | song | song.name }.each.with_index(1) do | song, index |  
            puts "#{index}. #{song.artist.name} - #{song.name}"
        end
    end

    def play_song
        # binding.pry
        puts "Which song number would you like to play?"
        user_input = gets.strip
        song_choice =  Song.all.sort_by{ | song | song.name }[user_input.to_i - 1] 
        puts "Playing #{song_choice.name} by #{song_choice.artist.name}" if song_choice && user_input.to_i >= 1 && user_input.to_i <= Song.all.length
    end
end