
class BooksController < ApplicationController
  def index
    if params[:author_id]
      # This is the nested route, /author/:author_id/books
      author = Author.find_by(id: params[:author_id])
      @books = author.books

    else
      # This is the 'regular' route, /books
      @books = Book.all
    end
  end

  def show
    book_id = params[:id]
    @book = Book.find_by(id: book_id)
    if @book.nil?
      head :not_found
      return
    end
  end

  def new
    if params[:author_id]
      # This is the nested route, /author/:author_id/books/new
      author = Author.find_by(id: params[:author_id])
      @book = author.books.new
    else
      # This is the 'regular' route, /books/new
      @book = Book.new
    end
  end

  # in app/controllers/books_controller.rb
  def create
    @book = Book.new(book_params) #instantiate a new book
    if @book.save # save returns true if the database insert succeeds
      redirect_to root_path # go to the index so we can see the book in the list
      return
    else # save failed :(
      render :new # show the new book form view again
      return
    end
  end

  def edit
    @book = Book.find_by(id: params[:id])

    if @book.nil?
      head :not_found
      return
    end
  end

  def update
    @book = Book.find_by(id: params[:id])
    if @book.nil?
      head :not_found
      return
    elsif @book.update(book_params)
      redirect_to books_path # go to the index so we can see the book in the list
      return
    else # save failed :(
      render :edit # show the new book form view again
      return
    end
  end

  def destroy
    book_id = params[:id]
    @book = Book.find_by(id: book_id)

    if @book.nil?
      head :not_found
      return
    end

    @book.destroy

    redirect_to books_path
    return
  end

  private

  def book_params
    return params.require(:book).permit(:title, :author_id, :description)
  end
  
end
