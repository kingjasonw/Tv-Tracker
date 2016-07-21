class AddUrlToSeasons < ActiveRecord::Migration
  def change
    add_column :seasons, :url, :string
  end
end
