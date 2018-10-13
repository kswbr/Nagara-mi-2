class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :url
      t.integer :feed_id
      t.integer :movie_type_id
      t.string :image
      t.boolean :publish
      t.string :movie_id
      t.integer :play_time
      t.integer :site_id
      t.integer :site_type_id

      t.timestamps
    end
  end
end
