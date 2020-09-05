require 'pry'

class MusicLibraryController
    attr_accessor :path, :library

    def initialize(path='./db/mp3s')
        @path = path
        @library = MusicImporter.new(path)
        @library.import()
    end

    def case_statement(user_input)
        # input = gets.strip
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
        else 
            call
        end
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
    
        input = gets.strip
        if input != 'exit'
            case_statement(input)
        end
    end

    def alphebitized_songs
        arr = library.files.map{|file| file.split(" - ")} 
        list = arr.sort{|a,b| a[1]<=>b[1]} .map{|arr| arr.join(' - ').chomp('.mp3')}
    end

    def list_songs
        # arr = library.files.map{|file| file.split(" - ")} 
        # list = arr.sort{|a,b| a[1]<=>b[1]} .map{|arr| arr.join(' - ').chomp('.mp3')}
        list = alphebitized_songs
        list.each_with_index{|song, i| puts "#{i+1}. #{song}"}
        # binding.pry
    end

    def list_artists
        arr = library.files.map{|file| file.split(" - ")} 
        list = arr.sort{|a,b| a[0]<=>b[0]} .map{|arr| arr[0]} .uniq
        list.each_with_index{|song, i| puts "#{i+1}. #{song}"}
    end

    def list_genres
        arr = library.files.map{|file| file.split(" - ")}
        list = arr.sort{|a,b| a[2]<=>b[2]} .map{|arr| arr[2].chomp('.mp3')} .uniq
        list.each_with_index{|g,i| puts "#{i+1}. #{g.to_s}"}
    end

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        input = gets.strip
        arr = []
        list = Artist.all.map do |x| 
            if x.name == input
                  x.songs.each{|y| arr << y}
            end
        end

        if arr.length > 0
            sorted = arr.sort{|a,b| a.name<=>b.name}
            sorted.each_with_index do |song, i| 
                puts "#{i+1}. #{song.name} - #{song.genre.name}"
            end
        end
    end

    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        input = gets.strip
        arr = []
        list = Genre.all.map do |x| 
            if x.name == input
                  x.songs.each{|y| arr << y}
            end
        end

        if arr.length > 0
            sorted = arr.sort{|a,b| a.name<=>b.name}
            sorted.each_with_index do |song, i| 
                puts "#{i+1}. #{song.artist.name} - #{song.name}"
            end
        end
    end

    def play_song
        puts "Which song number would you like to play?"
        input = gets.strip.to_i - 1
        if input >= 0 && input < library.files.length
            songs = alphebitized_songs.map{|str| str.split(' - ')}
            puts "Playing #{songs[input][1]} by #{songs[input][0]}"
        end
    end


end