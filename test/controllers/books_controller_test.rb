require "test_helper"

describe BooksController do
  before do
    Author.create(name: "JK Rowling")
  end

  describe "index" do
    it "should get index" do
      get "/books"
      must_respond_with :success
      # must_respond_with :ok
      # must_respond_with :server_error
      # must_respond_with :bad_request
      # must_respond_with :not_found

      # must_redirect_to "/books"
    end

    it "can get author_books_path" do
      get author_books_path(Author.first.id)

      must_respond_with :success
    end
  end

  describe "show" do
    before do
      @book = Book.first
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

  describe "new" do
    it "can get the new_book_path" do
      get new_book_path

      must_respond_with :success
    end

    it "can get the new_author_book_path" do
      get new_author_book_path(Author.first.id)

      must_respond_with :success
    end
  end

  describe "create" do

    let (:sandi_metz) {
      authors(:metz)
    }

    let (:book_hash) {
      {
        book: {
          title: "Practical Object Oriented Programming in Ruby",
          author_id: sandi_metz.id,
          description: 'A look at how to design object-oriented systems'
        }
      }
    }

    it "can create a book" do
      expect {
        post books_path, params: book_hash
      }.must_differ 'Book.count', 1
  
      must_respond_with  :redirect
      must_redirect_to root_path
      expect(Book.last.title).must_equal book_hash[:book][:title]
      expect(Book.last.author.name).must_equal sandi_metz.name
      expect(Book.last.description).must_equal book_hash[:book][:description]
    end

    it "will not create a book with invalid params" do
      book_hash[:book][:title] = nil

      expect {
        post books_path, params: book_hash
      }.must_differ "Book.count", 0

      must_respond_with :bad_request
    end
  end

  describe "update" do

    let (:new_book_hash) {
      {
        book: {
          title: "A Wrinkle in Time",
          author_id: authors(:madeleine_lengle).id,
          description: "A fabulous adventure",
        },
      }
    }
    it "will update a model with a valid post request" do
      id = Book.first.id
      expect {
        patch book_path(id), params: new_book_hash
      }.wont_change "Book.count"
  
      must_respond_with :redirect
  
      book = Book.find_by(id: id)
      expect(book.title).must_equal new_book_hash[:book][:title]
      expect(book.author.name).must_equal authors(:madeleine_lengle).name
      expect(book.description).must_equal new_book_hash[:book][:description]
    end
  
    it "will respond with not_found for invalid ids" do
      id = -1
  
      expect {
        patch book_path(id), params: new_book_hash
      }.wont_change "Book.count"
  
      must_respond_with :not_found
    end
  
    it "will not update if the params are invalid" do
      new_book_hash[:book][:title] = nil
      book = Book.first

      expect {
        patch book_path(book.id), params: new_book_hash
      }.wont_change "Book.count"

      book.reload # refresh the book from the database
      must_respond_with :bad_request
      expect(book.title).wont_be_nil
    end
  end
end
