class AddGenreRefToSeries < ActiveRecord::Migration
  def change
    add_reference :series, :genre, index: true, foreign_key: true
  end
end
