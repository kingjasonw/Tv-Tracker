class Season < ActiveRecord::Base
	after_create :find_episodes
	validates :season_number, uniqueness: {scope: :series_id}
	default_scope { order('season_number DESC') }
	
	belongs_to :series
	has_many :episodes

	def find_episodes
		season_id = self.id
		series_id = self.series_id
		season_url = self.url
		page = ("http://www.imdb.com"+season_url)
		doc = Nokogiri::HTML(open(page))
		doc.css('div.list_item').each do |episode|
			title = episode.css('div.info a[itemprop = "name"]').text
			description = episode.css('div.item_description').text
			air_date = episode.css('div.airdate').text
			if description.include? "add a plot"
				break
			else
				Episode.create(:title => title, :description => description, :air_date => air_date, :season_id => season_id, :series_id => series_id)
			end
		end
	end
end
