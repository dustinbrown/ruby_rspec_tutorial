require 'spec_helper'

describe "Library object" do

    let(:lib_obj) { [
      Book.new("JavaScript: The Good Parts", "Douglas Crockford", :development),
      Book.new("Designing with Web Standards", "Jeffrey Zeldman", :design),
      Book.new("Don't Make me Think", "Steve Krug", :usability),
      Book.new("JavaScript Patterns", "Stoyan Stefanov", :development),
      Book.new("Responsive Web Design", "Ethan Marcotte", :design)
      ].to_yaml
    }

    # Using before blocks
    #before :all do
    #    lib_obj = [
    #        Book.new("JavaScript: The Good Parts", "Douglas Crockford", :development),
    #        Book.new("Designing with Web Standards", "Jeffrey Zeldman", :design),
    #        Book.new("Don't Make me Think", "Steve Krug", :usability),
    #        Book.new("JavaScript Patterns", "Stoyan Stefanov", :development),
    #        Book.new("Responsive Web Design", "Ethan Marcotte", :design)
    #    ]
    #    File.open "books.yml", "w" do |f|
    #        #f.write lib_obj.to_yaml
    #        f.write YAML::dump lib_obj
    #    end
    #end

    let(:lib) { Library.new lib_obj }
    let(:lib1) { Library.new }

    #Using before block
    #before :each do
    #    @lib = Library.new "books.yml"
    #end

  describe "#new" do

      context "with no parameters" do
          it "has no books" do
              #lib = Library.new #also works block example
              #lib.should have(0).books #also works block example
              lib1.books.length.should == 0
          end
      end
      context "with a yaml file parameter" do
          it "has five books" do
              #@lib.should have(5).books #also works with block example
              lib.books.length.should == 5
          end
      end
  end

  it "returns all the books in a given category" do
    #@lib.get_books_in_category(:development).length.should == 2 # block example
    lib.get_books_in_category(:development).length.should == 2
  end

  it "accepts new books" do
    #@lib.add_book( Book.new("Designing for the Web", "Mark Boulton", :design) ) #block example
    #@lib.get_book("Designing for the Web").should be_an_instance_of Book #block example
    lib.add_book( Book.new("Designing for the Web", "Mark Boulton", :design) )
    lib.get_book("Designing for the Web").should be_an_instance_of Book
  end

  it "saves the library" do
    books = lib.books.map { |book| book.title }
    lib.save
    #books.class.should == Array

    lib2 = Library.new lib_obj
    #lib2 = Library.new "books.yml" #blocks example
    books2 = lib2.books.map { |book| book.title }
    books.should eql books2

    #blocks example
    #books = @lib.books.map { |book| book.title }
    #@lib.save
    #lib2 = Library.new "books.yml"
    #books2 = lib2.books.map { |book| book.title }
    #books.should eql books2
  end

end
