class Author < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  # Example Validations
  # must provide an email address and it must include an @ sign
  # validates :email, presence: true, format: {with: /@/}

  # usernames must be unique and between 5 and 25 characters in length
  # validates :username, uniqueness: true, length: { in: 5..25 }

  # age must be a number. An positive integer > 12, to be more precise.
  # validates :age, numericality: { only_integer: true, greater_than: 12 }

  has_many :books
  has_many :genres, through: :books

  def first_published
    books_with_year = self.books.where.not(publication_date: nil)
    first_book = books_with_year.order(publication_date: :asc).first
    if first_book
      return first_book.publication_date
    else
      return nil
    end
  end


  # def genres
  #   genres = []
  #   self.books.each do |book|
  #     genres += book.genres
  #   end
  #   return genres.uniq
  # end

end
