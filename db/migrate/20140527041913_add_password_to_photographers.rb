class AddPasswordToPhotographers < ActiveRecord::Migration
  def change
    add_column :photographers, :password_digest, :string
  end
end
