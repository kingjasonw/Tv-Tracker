class AddNetworkToSeries < ActiveRecord::Migration
  def change
    add_column :series, :network, :string
  end
end
