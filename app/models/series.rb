class Series < ActiveRecord::Base
	validates :title, uniqueness: true

	has_many :seasons
	has_many :episodes, :through => :seasons
	has_many :genres
end
