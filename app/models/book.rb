class Book < ApplicationRecord
  validates :title, presence: true
  
  belongs_to :author
end
