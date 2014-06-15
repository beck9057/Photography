class AddSlideshowFlagToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :show_on_slideshow, :boolean
  end
end
