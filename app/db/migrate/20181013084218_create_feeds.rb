class CreateFeeds < ActiveRecord::Migration[5.2]
  def change
    create_table :feeds do |t|
      t.string :url
      t.string :title
      t.integer :site_id
      t.datetime :published
      t.text :summary
      t.boolean :searched

      t.timestamps
    end
  end
end
