class Season < ActiveRecord::Base
	validates :season_number, uniqueness: {scope: :series_id}
	default_scope { order('season_number DESC') }
	
	belongs_to :series
	has_many :episodes
end
