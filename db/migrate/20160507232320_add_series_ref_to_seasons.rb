class AddSeriesRefToSeasons < ActiveRecord::Migration
  def change
    add_reference :seasons, :series, index: true, foreign_key: true
  end
end
