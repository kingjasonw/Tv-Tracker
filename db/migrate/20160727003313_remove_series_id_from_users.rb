class RemoveSeriesIdFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :series_id, :integer
  end
end
