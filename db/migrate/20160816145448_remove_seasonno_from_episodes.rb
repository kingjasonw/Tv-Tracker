class RemoveSeasonnoFromEpisodes < ActiveRecord::Migration
  def change
  	remove_column :episodes, :seasonno
  end
end
