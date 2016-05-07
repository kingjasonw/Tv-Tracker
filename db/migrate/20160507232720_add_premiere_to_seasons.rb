class AddPremiereToSeasons < ActiveRecord::Migration
  def change
    add_column :seasons, :premiere, :date
  end
end
