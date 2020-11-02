class AddBioToAuthor < ActiveRecord::Migration[6.0]
  def change
    add_column :authors, :bio_url, :string
  end
end
