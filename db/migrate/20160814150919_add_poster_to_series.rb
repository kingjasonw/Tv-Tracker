class AddPosterToSeries < ActiveRecord::Migration
  def change
    add_column :series, :poster, :string
  end
end
