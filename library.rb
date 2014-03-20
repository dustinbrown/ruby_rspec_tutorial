class Library
    attr_accessor :books

    def initialize lib_file = false
        @lib_file = lib_file
        @books = @lib_file ? YAML::load(@lib_file) : []
        #@books = @lib_file ? YAML::load(File.read(@lib_file)) : []
    end
end
