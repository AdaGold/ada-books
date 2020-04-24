require "test_helper"

describe BooksController do
  describe "index" do
    it "should get index" do
      get "/books"
      must_respond_with :success
    end
  end

  describe "show" do
    before do
      @book = Book.create(title: "hello world")
    end

    it "will get show for valid ids" do
      # Arrange
      valid_book_id = @book.id
  
      # Act
      get "/books/#{valid_book_id}"
  
      # Assert
      must_respond_with :success
    end
  
    it "will respond with not_found for invalid ids" do
      # Arrange
      invalid_book_id = 999
  
      # Act
      get "/books/#{invalid_book_id}"
  
      # Assert
      must_respond_with :not_found
    end
  end

  describe "create" do
    it "can create a book" do
      book_hash = {
        book: {
          title: "Practical Object Oriented Programming in Ruby",
          author: "Sandi Metz",
          description: 'A look at how to design object-oriented systems'
        }
      }
  
      expect {
        post books_path, params: book_hash
      }.must_differ 'Book.count', 1
  
      must_respond_with  :redirect
      expect(Book.last.title).must_equal book_hash[:book][:title]
    expect(Book.last.author).must_equal book_hash[:book][:author]
    expect(Book.last.description).must_equal book_hash[:book][:description]
    end
  end

end
