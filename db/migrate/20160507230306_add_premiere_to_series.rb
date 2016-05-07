class AddPremiereToSeries < ActiveRecord::Migration
  def change
    add_column :series, :premiere, :date
  end
end
