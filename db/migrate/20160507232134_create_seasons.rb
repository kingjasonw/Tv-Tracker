class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.integer :season_number
      t.string :desription

      t.timestamps null: false
    end
  end
end
