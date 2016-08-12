class RemoveGenreIdFromSeries < ActiveRecord::Migration
  def change
  	remove_column :series, :genre_id, :integer
  end
end
