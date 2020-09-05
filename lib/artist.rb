class Artist
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs
  @@all = []
  def initialize(name)
    @name = name
    # @@all << self
    @songs = []
    save
  end

  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    artist = self.new(name)
  end

  def songs
    @songs
  end

  def add_song(song)
    song.artist = self unless song.artist
      songs << song unless songs.include?(song)
  end

  def genres
    # self.songs.collect {|song| song.genre}
    songs.collect { |song| song.genre}.uniq
#binding.pry
  end

  # def artist=(artist)
  #   @artist = genre
  # end
end