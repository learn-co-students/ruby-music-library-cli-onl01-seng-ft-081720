class MusicLibraryController

    attr_reader :name, :artist, :genre

    def initialize (path='./db/mp3s')
        @path = path
        MusicImporter.new(@path).tap {|song| song.import}
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
          input = gets.strip
    
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

    # puts "Welcome to your music library!"
        # input = gets.chomp
        # while input != "exit"
        # puts "To list all of your songs, enter 'list songs'."
        
        # end

        def list_songs
            # sort the songs (Song.all)
            # iterate over the sorted songs, each_with_index, and puts out
            Song.all.sort {|a, b| a.name <=> b.name }.each_with_index { |song, i|
                puts "#{i+=1}. #{song.artist.name} - #{song.name} - #{song.genre.name}" }
        end

        def list_artists
            Artist.all.sort {|a, b| a.name <=> b.name }.each_with_index { |artist, i|
            puts "#{i+=1}. #{artist.name}" }
        end

        def list_genres
            Genre.all.sort {|a, b| a.name <=> b.name }.each_with_index { |genre, i|
            puts "#{i+=1}. #{genre.name}" }
        end

        def list_songs_by_artist
            puts "Please enter the name of an artist:"
            input = gets.strip
            if artist = Artist.find_by_name(input) #find artist that matches input
                #get the list of songs and collect a new list that is alphabetized by song name
                sorted_songs = artist.songs.sort_by {|song| song.name}
                #print the each item in the list
                sorted_songs.each_with_index { |song, i|
                puts "#{i+=1}. #{song.name} - #{song.genre.name}" }
              end
            
        end

        def list_songs_by_genre
            puts "Please enter the name of a genre:"
            input = gets.strip
            if genre = Genre.find_by_name(input) 
                sorted_songs = genre.songs.sort_by {|song| song.name}
                sorted_songs.each_with_index { |song, i|
                puts "#{i+=1}. #{song.artist.name} - #{song.name}" }
              end
        end

        def play_song
            puts "Which song number would you like to play?"
            input = gets.strip.to_i
            sorted_list = Song.all.sort {|a, b| a.name <=> b.name }
            # input is only valid if it's between 1 and list_songs.count
            if (input > 0) && (input <= sorted_list.size)
                song = sorted_list[input-1]
                puts "Playing #{song.name} by #{song.artist.name}"
            end
        end





end

