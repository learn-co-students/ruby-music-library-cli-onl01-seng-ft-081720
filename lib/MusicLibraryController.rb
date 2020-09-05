require 'pry'

class MusicLibraryController

  def initialize(path = './db/mp3s')
    #sets a variable for the new isntance of of the music importer class
    importer = MusicImporter.new(path)
    #then calls on the import method in the Music Importer class
    importer.import
  end
  
  def call
    #sets the input to a string
    input = ''

    #whiel the input is not equal to the word exit
    while input != 'exit'
      #Put all of the welcome messages and questions
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
#hen asks for the users input
      input = gets.chomp

      case input

      when 'list songs'
        self.list_songs
        # def list_songs
        #   Song.all.sort {|i, j| i.name <=>  j.name}.each.with_index(1) { |song, z|
        #       puts "#{z}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
        # end
      when 'list artists'
        self.list_artists
        # def list_artists
        #   artists = Artist.all.sort {|i, j| i.name <=> j.name}
        #   artists.each.with_index(1) {|artist, z| puts "#{z}. #{artist.name}"}
        # end
      when 'list genres'
        self.list_genres
        # def list_genres
        #   genres = Genre.all.sort {|i, j| i.name <=> j.name}
        #   genres.each.with_index(1) {|genre, z| puts "#{z}. #{genre.name}"}
        # end
      when 'list artist'
        self.list_songs_by_artist
      #   def list_songs_by_artist
      #     puts "Please enter the name of an artist:"
      #     list_artist = gets.strip
      
      #     if artist = Artist.find_by_name(list_artist)
      #       artist.songs.sort { |i, j| i.name <=> 
      #         j.name }.each.with_index(1) {|song, z| puts "#{z}. #{song.name} - #{song.genre.name}"}
      # #binding.pry
      #     end
      #   end
      when 'list genre'
        self.list_songs_by_genre
        # def list_songs_by_genre
        #   puts "Please enter the name of a genre:"
        #   list_genre = gets.strip
      
        #   if genre = Genre.find_by_name(list_genre)
        #     genre.songs.sort { |i, j| i.name <=> j.name }.each.with_index(1) {|song, z| puts "#{z}. #{song.artist.name} - #{song.name}"}
        #   end
        # end
      when 'play song'
        self.play_song
      #   def play_song
      #     puts "Which song number would you like to play?"
      #     playing = gets.chomp.to_i
      #     
      #     songs = Song.all
      
      #     if (1..songs.length).include?(playing)
      #       song = Song.all.sort{ |i, j| i.name <=> j.name }[playing - 1]
      #     end

      #     puts "Playing #{song.name} by #{song.artist.name}" if song
      #     list_songs
      #   end
      else
        "Type in a valid request please"
      end
    end
  end

  def list_songs
    Song.all.sort {|i, j| i.name <=>  j.name}.each.with_index(1) { |song, z|
        puts "#{z}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end


  def list_artists
    artists = Artist.all.sort {|i, j| i.name <=> j.name}
    artists.each.with_index(1) {|artist, z| puts "#{z}. #{artist.name}"}
  end

  def list_genres
    genres = Genre.all.sort {|i, j| i.name <=> j.name}
    genres.each.with_index(1) {|genre, z| puts "#{z}. #{genre.name}"}
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    list_artist = gets.strip

    if artist = Artist.find_by_name(list_artist)
      artist.songs.sort { |i, j| i.name <=> 
        j.name }.each.with_index(1) {|song, z| puts "#{z}. #{song.name} - #{song.genre.name}"}
#binding.pry
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    #gets the users input 
    list_genre = gets.strip
#if the users input is equal to the genre 
    if genre = Genre.find_by_name(list_genre)
      genre.songs.sort { |i, j| i.name <=> j.name }.each.with_index(1) {|song, z| 
        puts "#{z}. #{song.artist.name} - #{song.name}"}
    end
  end

  def play_song
    
    puts "Which song number would you like to play?"
    #gets the users input of which song they would like to play
    playing = gets.chomp.to_i

    # self.list_songs
    #sets a variable for the Song.all class method
    songs = Song.all
#Uses the variable to ask for the length then asks if it inculdes the users input
    if (1..songs.length).include?(playing)
      #then is sorts them and compares the song the users input calls on the users and minuses 1 because the computer starts counting at zero.
      song = Song.all.sort{ |i, j| i.name <=> j.name }[playing - 1]
    end
#binding.pry
    #puts the name of the song and the name of the artist if the variable song is true
    puts "Playing #{song.name} by #{song.artist.name}" if song
    
#binding.pry
  end
end