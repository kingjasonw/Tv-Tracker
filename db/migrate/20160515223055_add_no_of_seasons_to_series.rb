class AddNoOfSeasonsToSeries < ActiveRecord::Migration
  def change
    add_column :series, :seasonsno, :integer
  end
end
