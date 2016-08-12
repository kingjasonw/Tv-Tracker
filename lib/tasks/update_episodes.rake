desc "Update episodes"
task :fetch_epinfo => :environment do 
	require 'rubygems'
	require 'nokogiri'
	require 'open-uri'

	Season.find_each do |season|
		@season = season
		page = ("http://www.imdb.com"+@season.url)
		doc = Nokogiri::HTML(open(page))
		doc.css('div.list_item').each do |episode|
			title = episode.css('div.info a[itemprop = "name"]').text
			@episode = Episode.find_by title: title
			description = episode.css('div.item_description').text
			if description.include? "add a plot"
				@episode.destroy
			elsif description != @episode.description
				@episode.update_attribute(:description, description)
			end
			air_date = episode.css('div.airdate').text
			if air_date != @episode.air_date
				@episode.update_attribute(:air_date, air_date)
			end
		end
	end
end