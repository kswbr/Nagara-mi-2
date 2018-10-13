class CreateFavicons < ActiveRecord::Migration[5.2]
  def change
    create_table :favicons do |t|
      t.binary :image
      t.string :image_type
      t.integer :site_id

      t.timestamps
    end
  end
end
