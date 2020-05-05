class Genre < ApplicationRecord
  has_and_belongs_to_many :books
  has_many :authors, through: :books


  def self.books_by_author(genre_name)
    book_list = Genre.find_by(name: genre_name).books

    return book_list.includes(:author).order("authors.name")
  end

end
