class AddEmailUniquenessIndex < ActiveRecord::Migration
  def up
    add_index :photographers, :email, :unique => true
  end
  
  def down
    remove_index :photographers, :email
  end
end
