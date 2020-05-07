class Book < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: true
  
  belongs_to :author
  has_and_belongs_to_many :genres
end
