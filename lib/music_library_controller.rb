require 'pry'
class MusicLibraryController
    attr_reader :imported_songs
    def initialize(path = './db/mp3s')
        @imported_songs = MusicImporter.new(path).import
    end

    def call
        puts "Welcome to your music library!"
        puts "To list all of your songs, enter 'list songs'."
        puts "To list all of the artists in your library, enter 'list artists'."
        puts "To list all of the genres in your library, enter 'list genres'."
        puts "To list all of the songs by a particular artist, enter 'list artist'."
        puts "To list all of the songs of a particular genre, enter 'list genre'."
        puts "To play a song, enter 'play song'."
        puts "To quit, type 'exit'."
        puts "What would you like to do?"
        input = gets.chomp
        if input == "list songs"
            list_songs
            call
        elsif input == "list artists"
            list_artists
            call
        elsif  input == "list genres"
            list_genres
            call
        elsif input == "list artist"
            list_songs_by_artist
            call
        elsif input == "list genre"
            list_songs_by_genre
            call
        elsif input == "play song"
            play_song
            call
        elsif input == "exit"
            "meep"
        else
            call
        end
    end

    def list_songs 
        Song.all.sort_by(&:name).each.with_index(1) do |song, i|
            puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
    end

    def list_artists 
        Artist.all.sort_by(&:name).each.with_index(1) do |artist, i|
            puts "#{i}. #{artist.name}"
        end
    end

    def list_genres 
        Genre.all.sort_by(&:name).each.with_index(1) do |genre, i|
            puts "#{i}. #{genre.name}"
        end
    end

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        input = gets.strip
        if artist = Artist.find_by_name(input)
            artist.songs.sort_by(&:name).each.with_index(1) do |song, i|
            puts "#{i}. #{song.name} - #{song.genre.name}"
        end
        end
    end

    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        input = gets.strip
        if genre = Genre.find_by_name(input)
            genre.songs.sort_by(&:name).each.with_index(1) do |song, i|
            puts "#{i}. #{song.artist.name} - #{song.name}"
        end
        end
    end

    def play_song
        puts "Which song number would you like to play?"
        input = gets.strip.to_i
          song = Song.all[input] 
            puts "Playing #{song.name} by #{song.artist.name}" if song != nil && input.between?(1, Song.all.length)
        
    end

end