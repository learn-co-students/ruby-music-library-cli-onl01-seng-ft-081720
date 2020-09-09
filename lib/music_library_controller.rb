class MusicLibraryController
    attr_accessor :path, :songs, :artists, :genres

    def initialize (path = "./db/mp3s")
        @path = path
        new_music = MusicImporter.new(path)
        new_music.import

    end

    def call 
        input = ""
        while input != "exit"
        
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
            case input
                when "list songs"
                    list_songs
        
                when "list artists"
                    list_artists
        
                when "list genres"
                    list_genres
        
                when "list artist"
                    list_songs_by_artist
                    
                when "list genre"
                    list_songs_by_genre
        
                when "play song"
                    play_song
            end
        end
    end

    def list_songs
        songs = Song.all.sort_by { |song| song.name }

        songs.each do |song|
            puts "#{songs.index(song) + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
    end

    def list_artists

        artists = Artist.all.sort_by { |artist| artist.name }

        artists.each do |artist|
            puts "#{artists.index(artist) + 1}. #{artist.name}"
        end
    end

    def list_genres

        genres = Genre.all.sort_by { |genre| genre.name }

        genres.each do |genre|
            puts "#{genres.index(genre) + 1}. #{genre.name}"
        end
    end

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        artist = gets.chomp

        if Artist.find_by_name(artist) != nil
            artist = Artist.find_by_name(artist)
            songs = artist.songs.sort_by { |song| song.name }

            songs.each do |song|
                puts "#{songs.index(song) + 1}. #{song.name} - #{song.genre.name}"
            end
        end
    end

    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        genre = gets.chomp  

        if Genre.find_by_name(genre) != nil
            genre = Genre.find_by_name(genre)
            songs = genre.songs.sort_by { |song| song.name }

            songs.each do |song|
                puts "#{songs.index(song) + 1}. #{song.artist.name} - #{song.name}"
            end
        end
    end

    def play_song
        puts "Which song number would you like to play?"
        song_number = gets.chomp

        if song_number.to_i.between?(1, Song.all.count)
            song_number = song_number.to_i - 1
            songs = Song.all.sort_by { |song| song.name }
            song = songs[song_number]

            puts "Playing #{song.name} by #{song.artist.name}"
        end
    end

        



            



end