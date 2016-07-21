class AddSeasonNoToEpisodes < ActiveRecord::Migration
  def change
    add_column :episodes, :seasonno, :integer
  end
end
