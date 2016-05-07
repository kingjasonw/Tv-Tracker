class AddSeriesRefToEpisodes < ActiveRecord::Migration
  def change
    add_reference :episodes, :series, index: true, foreign_key: true
  end
end
