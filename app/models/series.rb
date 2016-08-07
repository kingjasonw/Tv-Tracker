class Series < ActiveRecord::Base
	validates :title, uniqueness: true

	has_many :seasons
	has_many :episodes, :through => :seasons
	has_many :genres

	has_many :lists, :dependent => :destroy 
	has_many :users, :through => :lists
	
end
