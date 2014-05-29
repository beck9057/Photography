class AddOrientationFlagToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :is_landscape, :boolean
  end
end
