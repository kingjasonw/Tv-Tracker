class List < ActiveRecord::Base

	belongs_to :user
	belongs_to :series

	validates_uniqueness_of :user_id, :scope => :series_id

	

end
