desc "Find episodes"
task :fetch_episodes => :environment do 
	require 'rubygems'
	require 'nokogiri'
	require 'open-uri'

	Season.find_each do |season|
		@season = season
		page = ("http://www.imdb.com"+@season.url)
		doc = Nokogiri::HTML(open(page))
		doc.css('div.list_item').each do |episode|
			title = episode.css('div.info a[itemprop = "name"]').text
			url = episode.css('a')[0]["href"]
			description = episode.css('div.item_description').text
			air_date = episode.css('div.airdate').text
			seasonep = episode.css('div.hover-over-image div').text
			if description.include? "add a plot"
				break
			else
				Episode.create(:title => title, :description => description, :air_date => air_date, :episode_number => seasonep, :url => url, :season_id => @season.id, :series_id => @season.series_id)
			end
		end
	end
end