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
    #select books that match the category passed in and add to @books array
    @books.select do |book|
      book.category == category
    end
  end

  def add_book book
    #add passed in book to @books array
    @books.push book
  end

  def get_book title
    #select book that title matches passed in title and add it to @books array
    @books.select do |book|
      book.title == title
    end.first
  end

  def save lib_file = false
    #set @lib_file to passed in value or instance var or default string
    @lib_file = lib_file || @lib_file || "library.yml"

    #wrap file open block in case @lib_file is not a path/string
    begin
      File.open @lib_file, "w" do |f|
        f.write @books.to_yaml
        #f.write YAML::dump @books
      end
    rescue Errno::ENOENT, /No such file or directory/
      @lib_file = "library.yml"
    end
  end
end
