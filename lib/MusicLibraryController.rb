class MusicLibraryController 
  attr_accessor :imported_songs

def initialize(path='./db/mp3s')
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
    if input != exit
      
      call
  end 
end 

 def lists_songs
   Song.all.sort_by(&:name).each.with_index(1) do |song, idx|
     puts "#{idx}. #{song.artis.name} - #{song.name} - #{song.genre.name}" 
   end 
 end 

 def lists_artists
 end
 
 def lists_genres
 end 
end 