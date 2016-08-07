class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
    	t.belongs_to :user, index: true
    	t.belongs_to :series, index: true
    end
  end
end
