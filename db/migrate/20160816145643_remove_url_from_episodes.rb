class RemoveUrlFromEpisodes < ActiveRecord::Migration
  def change
  	remove_column :episodes, :url
  end
end
