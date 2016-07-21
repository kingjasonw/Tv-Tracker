class Season < ActiveRecord::Base
	validates :season_number, uniqueness: {scope: :series_id}
	
	belongs_to :series
	has_many :episodes
end
