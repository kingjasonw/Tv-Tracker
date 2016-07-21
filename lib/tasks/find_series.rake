desc "Find all current series"
task :fetch_title => :environment do 
	require 'rubygems'
	require 'nokogiri'
	require 'open-uri'

 
	url = "http://www.imdb.com/search/title?title_type=tv_series"
	doc = Nokogiri::HTML(open(url))
	doc.css("td.title").each do |row|
		title = row.css("a")[0].text
		url = row.css("a")[0]["href"]
		Series.create(:title => title, :url => url)
	end
end