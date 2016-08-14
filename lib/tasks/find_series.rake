desc "Find all current series"
task :fetch_title => :environment do 
	require 'rubygems'
	require 'nokogiri'
	require 'open-uri'

 
	url = "http://www.imdb.com/search/title?title_type=tv_series"
	doc = Nokogiri::HTML(open(url))
	doc.css("div.lister-item-content").each do |row|
		title = row.css("h3 a").text
		url = row.css("h3 a").attr('href').text
		Series.create(:title => title, :url => url)
	end
end