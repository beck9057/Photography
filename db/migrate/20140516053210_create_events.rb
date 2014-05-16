class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :client_id
      t.string :title
      t.string :kind
      t.string :description
      t.date :date

      t.timestamps
    end
  end
end
