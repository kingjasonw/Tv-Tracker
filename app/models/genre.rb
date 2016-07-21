class Genre < ActiveRecord::Base
	validates :genre, uniqueness: true
	belongs_to :series
end
