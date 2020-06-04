
class BooksController < ApplicationController

  before_action :find_book, only: [:show, :edit, :update, :destroy]
  skip_before_action :require_login, only: [:index]
  before_action :current_user, only: [:index]


  def index
    puts "Use is #{@current_user}"
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
      flash[:success] = "Book added successfully"
      redirect_to root_path # go to the index so we can see the book in the list
      return
    else # save failed :(
      flash.now[:error] = "Something happened. Book not added."
      render :new, status: :bad_request # show the new book form view again
      return
    end
  end

  def edit
    if @book.nil?
      head :not_found
      return
    end
  end

  def update
    if @book.nil?
      head :not_found
      return
    elsif @book.update(book_params)
      flash[:success] = "Book updated successfully"
      redirect_to books_path # go to the index so we can see the book in the list
      return
    else # save failed :(
      flash.now[:error] = "Something happened. Book not updated."
      render :edit, status: :bad_request # show the new book form view again
      return
    end
  end

  def destroy
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
    return params.require(:book).permit(:title, :author_id, :description, genre_ids: [])
  end

  def find_book
    @book = Book.find_by(id: params[:id])
  end
  
end
