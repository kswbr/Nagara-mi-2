class RemoveSiteIdFromMovies < ActiveRecord::Migration[5.2]
  def change
    remove_column :movies, :site_id, :integer
  end
end
