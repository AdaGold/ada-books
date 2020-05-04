class RelateBooksToAuthors < ActiveRecord::Migration[6.0]
  def change
    remove_column :books, :author
    add_reference :books, :author, index: true
  end
end
