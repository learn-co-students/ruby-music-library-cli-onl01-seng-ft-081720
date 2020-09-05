require 'pry'
class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    @files ||= Dir.entries(@path).select {|song| !File.directory?(song) && song.end_with?(".mp3")}
  end

  def import
    self.files.each {|filename| Song.create_from_filename(filename)}
  end

  # def import
  #   imported_files = self.files
  #   imported_files.each do |file|
  #     new_song = Song.new_by_filename(file)
  #   end
  # end
# binding.pry
#Thank goodness for the three days it took to complete this code.

end