class Episode < ActiveRecord::Base
	validates :title, uniqueness: {scope: :season_id}
	belongs_to :series
	belongs_to :season
end
