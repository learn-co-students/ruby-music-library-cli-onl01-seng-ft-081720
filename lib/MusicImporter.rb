class MusicImporter

    attr_reader :path

    def initialize(path)
        @path=path
    end

    def files
    Dir.glob("#{path}/*.mp3").collect { | file | file.gsub("#{path}/", "") }
    end

    # def size

    # end

end