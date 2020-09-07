class MusicImporter

    attr_reader :path, :files

    def initialize (path)
        @path = path
    end

    def files
        @files = Dir.entries(@path).select {|song| song.end_with?(".mp3")}
        # @files = Dir.entries(@path)
        # @files.delete_if { |file| file == "." || file == ".." }
    end

    def import
        files.each {| file| Song.create_from_filename(file)}
    end





end
