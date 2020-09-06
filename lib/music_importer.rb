class MusicImporter

  attr_accessor :name, :path
  @@all = []

  def initialize(path)
    @path = path
  end

   def files
    @files = Dir.children(path)
  end

  def import
    files.each { |file| Song.create_from_filename(file) }
  end

end