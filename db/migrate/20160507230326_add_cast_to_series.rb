class AddCastToSeries < ActiveRecord::Migration
  def change
    add_column :series, :cast, :string
  end
end
