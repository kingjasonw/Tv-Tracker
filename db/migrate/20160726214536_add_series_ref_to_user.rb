class AddSeriesRefToUser < ActiveRecord::Migration
  def change
    add_reference :users, :series, index: true, foreign_key: true
  end
end
