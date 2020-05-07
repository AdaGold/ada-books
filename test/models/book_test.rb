require "test_helper"

describe Book do

  describe 'validations' do
    before do
      # Arrange
      author = Author.new(name: 'test author')
      @book = Book.new(title: 'test book', author: author)
    end

    it 'is valid when all fields are present' do
      # Act
      result = @book.valid?

      # Assert
      expect(result).must_equal true
    end

    it 'is invalid without a title' do
      # Arrange
      @book.title = nil
    
      # Act
      result = @book.valid?
    
      # Assert
      expect(result).must_equal false
      expect(@book.errors.messages).must_include :title
    end

    it 'is invalid with a non-unique title' do
      # Arrange
      # We can approach this test in many different ways ways;
      # One thing we can do is create a new book unique_book,
      # and modify @book so it becomes invalid
      # to follow the pattern of invalidating @book
      unique_book = Book.create!(title: 'original book', author: Author.new(name: 'test author'))
      @book.title = unique_book.title

      # Act
      result = @book.valid?

      # Assert
      expect(result).must_equal false
      expect(@book.errors.messages).must_include :title

    end
  end

  describe 'relations' do
    it 'can set the author through "author"' do
      # Create two models
      author = Author.create!(name: "test author")
      book = Book.new(title: "test book")

      # Make the models relate to one another
      book.author = author

      # author_id should have changed accordingly
      expect(book.author_id).must_equal author.id
    end

    it 'can set the author through "author_id"' do
      # Create two models
      author = Author.create!(name: "test author")
      book = Book.new(title: "test book")

      # Make the models relate to one another
      book.author_id = author.id

      # author should have changed accordingly
      expect(book.author).must_equal author
    end
  end

end