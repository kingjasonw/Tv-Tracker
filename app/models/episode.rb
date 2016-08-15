class Episode < ActiveRecord::Base
	validates :title, uniqueness: {scope: :season_id}
	default_scope { order('air_date DESC') }
	
	belongs_to :series
	belongs_to :season
end
