class MusicImporter

    attr_accessor :path, :files

    def initialize(filepath)
        @path = filepath
    end

    def files
        @files = Dir.entries(@path)
        @files.delete_if {|file_name| file_name == "." || file_name == ".."}
    end

    def import
        self.files.each do |song|
            Song.create_from_filename(song)
        end
    end

end