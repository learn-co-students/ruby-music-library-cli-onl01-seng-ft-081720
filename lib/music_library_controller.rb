

class MusicLibraryController
    extend Concerns::Findable

    def initialize(path= './db/mp3s')
        @path = path
        MusicImporter.new(path).import
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
            list_songs if input == 'list songs'
            list_artists if input == 'list artists'
            list_genres if input == 'list genres'
            list_songs_by_artist if input == 'list artist'
            list_songs_by_genre if input == 'list genre'
            play_song if input == 'play song'

        end
    end

    def list_songs
        sorted_array = Song.all.sort{ |a, b| a.name <=> b.name }
        sorted_array.each_with_index do |song, index|
            puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
    end

    def list_artists
        artists = Artist.all.collect {|artist| artist.name}.sort
        artists.each.with_index(1) do |artist, index|
            puts "#{index}. #{artist}"
        end
    end

    def list_genres
        genres = Genre.all.collect {|genre| genre.name}.sort
        genres.each.with_index(1) do |genre, index|
            puts "#{index}. #{genre}"
        end
    end

    def list_songs_by_artist
        # puts "Please enter the name of an artist:"

        # input = gets.chomp
        # songs_by_artist = []
        # Song.all.each_with_index do |song, index|
        #     if song.artist.name == input
        #         songs_by_artist << song
        #         # binding.pry
        #     end
        # end

        # songs_by_artist.sort.each_with_index do |song, index|
        #         # puts "#{index+1}. #{song.name} - #{song}"
        #         binding.pry
        # end
        #prints all songs by a particular artist in a numbered list (alphabetized by song name)
        puts "Please enter the name of an artist:"
        input = gets.chomp
        if artist = Artist.find_by_name(input) #find artist that matches input
            #get the list of songs and collect a new list that is alphabetized by song name
            songs_sorted_by_name = artist.songs.sort_by do |song|
                song.name
            end
            #print the each item in the list
            songs_sorted_by_name.each.with_index(1) do |song,index|
                puts "#{index}. #{song.name} - #{song.genre.name}"
            end
        end
    end

    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        input = gets.chomp
        if genre = Genre.find_by_name(input)
            songs_sorted_by_name = genre.songs.sort_by do |song|
                song.name
            end

            songs_sorted_by_name.each.with_index(1) do |genre, index|
                puts "#{index}. #{genre.artist.name} - #{genre.name}"
            end
        end

    end

    # def play_song
    #     # puts "Which song number would you like to play?"
    #     songlist = Song.all.sort do |a, b|
    #         a.name <=> b.name
    #     end
    #     songlist.uniq! 

    #     songlist.collect do |song|
    #         song.name
    #     end

    #     puts "Which song number would you like to play?"
    
    #     input = gets.strip.to_i
    #     # binding.pry
    #     if input >= 1 && input <= songlist.size
    #       song = songlist[input+2]
    #       puts "Playing #{song.name} by #{song.artist.name}"
    #     else
    #         # play_song
    #     end
    # end

    # def play_song
    #     puts "Which song number would you like to play?"
    #     list_of_songs = Song.all.sort{ |a, b| a.name <=> b.name }
    #     # binding.pry

    #     # list_of_songs = Song.all.sort_by(&:name)
    #     input = gets.to_i
        
    #     if input <= Song.all.length && input > 0
    #         puts "Playing #{list_of_songs[input+1].name} by #{list_of_songs[input+1].artist.name}"
    #     end
    #   end
      def play_song
        puts "Which song number would you like to play?"
        list_of_songs =  Song.all.sort{ |a, b| a.name <=> b.name }
        # list_songs
        input = gets.to_i
        # binding.pry
        if input <= Song.all.length && input > 0
            # binding.pry
            puts "Playing #{list_of_songs[input -1].name} by #{list_of_songs[input -1].artist.name}"
        end
    end

end

