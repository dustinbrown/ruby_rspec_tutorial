class Library
  attr_accessor :books

  def initialize lib_file = false
      @lib_file = lib_file
      @books = @lib_file ? YAML::load(@lib_file) : []

      #if you want to load a file
      #if @books = @lib_file
      #  if @lib.class != String
      #    @books = YAML::load(@lib_file)
      #  else
      #    @books = YAML::load(File.read(@lib_file))
      #  end
      #else
      # @books = []
      #end

      #started with. above are my modifications
      #@books = @lib_file ? YAML::load(File.read(@lib_file)) : []
  end

  def get_books_in_category category
        @books.select do |book|
            book.category == category
        end
  end

  def add_book book
    @books.push book
  end

  def get_book title
    @books.select do |book|
      book.title == title
    end.first
  end

  def save lib_file = false
    #@lib_file = lib_file || @lib_file || "library.yml"
    #if @lib_file.class != String
      @lib_file = "library.yml"
      #@lib_file = lib_file || "library.yml"
    #end
      File.open @lib_file, "w" do |f|
        #f.write @books.to_yaml
        f.write YAML::dump @books
      end
  end
end
