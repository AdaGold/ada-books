
class BooksController < ApplicationController
  def index
    @books = Book.all
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
    @book = Book.new
  end
  
end
