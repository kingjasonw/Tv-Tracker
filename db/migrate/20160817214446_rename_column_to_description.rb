class RenameColumnToDescription < ActiveRecord::Migration
  def change
  	rename_column :seasons, :desription, :description
  end
end
