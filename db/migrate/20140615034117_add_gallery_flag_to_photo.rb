class AddGalleryFlagToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :show_on_gallery, :boolean
  end
end
