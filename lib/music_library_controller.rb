require 'pry'
class MusicLibraryController
  
  attr_accessor :path,:list_songs 
  
  def initialize(path = './db/mp3s')
     MusicImporter.new(path).import
     
  end
  
  def call 
    answer = ''
     while answer != 'exit'
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts  "To list all of the songs of a particular genre, enter 'list genre'."
    puts  "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    answer = gets.chomp
    
    case answer
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
   Song.all.sort_by(&:name).each.with_index(1) do |x,z| 
   puts "#{z}. #{x.artist.name} - #{x.name} - #{x.genre.name}" 
 end
end
 
 def list_artists
   Artist.all.sort_by(&:name).each.with_index(1) do |x,z|
     puts "#{z}. #{x.name}"
   end
 end 
  
  def list_genres
      Genre.all.sort_by(&:name).each.with_index(1) do |x,z| 
       puts "#{z}. #{x.name}"
    end
 end 
 
 def list_songs_by_artist
   puts "Please enter the name of an artist:"
     x = gets.chomp
    
    if  artist = Artist.find_by_name(x)
     artist.songs.sort_by(&:name).each.with_index(1) do |z,x|
       puts "#{x}. #{z.name} - #{z.genre.name}"
    end 
  end
end
 
 def list_songs_by_genre
   puts "Please enter the name of a genre:"
     x = gets.chomp
    
    if  genre = Genre.find_by_name(x)
     genre.songs.sort_by(&:name).each.with_index(1) do |z,x|
      puts "#{x}. #{z.artist.name} - #{z.name}"
   end 
 end
end

def play_song 
 puts "Which song number would you like to play?"
  song = gets.chomp.to_i
  if (1..Song.all.length).include?(song)
    list = Song.all.sort_by(&:name)[song - 1]
  puts "Playing #{list.name} by #{list.artist.name}"
end 
end





end 