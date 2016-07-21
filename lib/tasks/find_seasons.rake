desc "Find seasons"
task :fetch_seasons => :environment do 
	require 'rubygems'
	require 'nokogiri'
	require 'open-uri'

	Series.find_each do |series|
		@series = series
		page = ("http://www.imdb.com"+@series.url)
		doc = Nokogiri::HTML(open(page))
		doc.css('div.seasons-and-year-nav div')[2].css('a').each do |seasonlist|
			season_url = seasonlist['href']
			Season.create(:season_number => seasonlist.text, :url => season_url, :series_id => @series.id)
		end
	end
end