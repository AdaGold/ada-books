class Author < ApplicationRecord
  has_many :books

  def first_published
    books_with_year = self.books.where.not(publication_date: nil)
    first_book = books_with_year.order(publication_date: :asc).first
    return first_book.publication_date
  end
end
