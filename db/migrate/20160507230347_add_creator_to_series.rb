class AddCreatorToSeries < ActiveRecord::Migration
  def change
    add_column :series, :creator, :string
  end
end
