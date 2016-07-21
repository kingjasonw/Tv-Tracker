desc "Find series details"
task :fetch_info => :environment do 
	require 'rubygems'
	require 'nokogiri'
	require 'open-uri'

	Series.find_each do |series|
		@series = series
		page = ("http://www.imdb.com"+@series.url)
		doc = Nokogiri::HTML(open(page))
		description = doc.css('div.summary_text').text
		premiere = doc.css('div#titleDetails div.txt-block')[3].text
		cast = doc.css('span[itemprop = "actors"]').text
		creator = doc.css('div.credit_summary_item span[itemprop = "creator"]').text
		@series.update_attributes(:description => description, :premiere => premiere, :cast => cast, :creator => creator)
	end
end