require 'pry'
class MusicLibraryController 
    def initialize(path="./db/mp3s")
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
        Song.all.sort_by{|song| song.name}.each_with_index do |song,index|
            puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}" 
        end
    end

    def list_artists
        Artist.all.sort_by{ |artist| artist.name }.each_with_index do |art,index|
            puts "#{index+1}. #{art.name}" 
        end
    end

    def list_genres
        Genre.all.sort_by{|gen| gen.name}.each_with_index do |gen ,index|
            puts "#{index+1}. #{gen.name}" 
        end
    end

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        input=gets.strip
        Song.all.find_all{|song| song.artist.name == input }.sort_by{|song| song.name}.each_with_index do |song,index|
            puts "#{index+1}. #{song.name} - #{song.genre.name}" 
            end
    end

    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        input=gets.strip
        Song.all.find_all{|song| song.genre.name == input }.sort_by{|song| song.name}.each_with_index do |song,index|
            puts "#{index+1}. #{song.artist.name} - #{song.name}" 
            end
    end

    def play_song
        puts "Which song number would you like to play?"
        input=gets.strip.to_i 
        current_song=Song.all.sort_by{|song| song.name}[input-1]
        puts "Playing #{current_song.name} by #{current_song.artist.name}" if (1..Song.all.length).include?(input) && input >= 1
    end
end
