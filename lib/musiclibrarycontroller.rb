class MusicLibraryController
    attr_accessor :path, :importer

    def initialize(path = "./db/mp3s")
        MusicImporter.new(path).import
    end

    def call
        i = "input"
        while i != "exit"
            case i
            when "list songs"
              self.list_songs
            when "list artists"
              self.list_artists
            when "list genres"
              self.list_genres
            when "list artist"
              self.list_songs_by_artist
            when "list genre"
              self.list_songs_by_genre
            when "play song"
              self.play_song
            else
            puts "Welcome to your music library!"
            puts "To list all of your songs, enter 'list songs'."
            puts "To list all of the artists in your library, enter 'list artists'."
            puts "To list all of the genres in your library, enter 'list genres'."
            puts "To list all of the songs by a particular artist, enter 'list artist'."
            puts "To list all of the songs of a particular genre, enter 'list genre'."
            puts "To play a song, enter 'play song'."
            puts "To quit, type 'exit'."
            puts "What would you like to do?"
            i = gets.chomp
        end
    end

    def list_songs
        Song.all.sort_by {|song|song.name}.each.with_index(1) {|song,i| 
        puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
    end
    
    def list_artists
        artist_list = Artist.all.sort_by {|artist| artist.name}.each.with_index(1) {|artist, i|
        puts "#{i}. #{artist.name}"}
    end

    def list_genres
        genres_list = Genre.all.sort_by {|genre| genre.name}.each.with_index(1) {|genre, i|
        puts "#{i}. #{genre.name}"}
    end

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        artist_name = gets.chomp
        song_list = Song.all.select {|song| song.artist.name == artist_name}
        song_list.sort_by {|song| song.name}.each.with_index(1) {|song, i|
        puts "#{i}. #{song.name} - #{song.genre.name}"}
    end

    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        genre_name = gets.chomp
        song_list = Song.all.select {|song| song.genre.name == genre_name}
        song_list.sort_by {|song| song.name}.each.with_index(1) {|song, i|
        puts "#{i}. #{song.artist.name} - #{song.name}"}
    end

    def play_song
        puts "Which song number would you like to play?"
        song_number = gets.chomp
        song_choice = Song.all.sort_by{|song| song.name} [song_number.to_i-1]
        puts "Playing #{song_choice.name} by #{song_choice.artist.name}" if song_choice && song_number.to_i >= 1 && song_number.to_i <= Song.all.length
        end
    end
end