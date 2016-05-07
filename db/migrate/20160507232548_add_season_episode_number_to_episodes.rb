class AddSeasonEpisodeNumberToEpisodes < ActiveRecord::Migration
  def change
    add_column :episodes, :season_episode_number, :integer
  end
end
