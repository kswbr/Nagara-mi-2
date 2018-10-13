class CreateSites < ActiveRecord::Migration[5.2]
  def change
    create_table :sites do |t|
      t.string :name
      t.string :url
      t.integer :site_type_id
      t.integer :favicon_id

      t.timestamps
    end
  end
end
