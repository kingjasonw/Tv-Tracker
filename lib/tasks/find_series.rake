desc "Find popular series"
task :fetch_title => :environment do 
	require 'rubygems'
	require 'nokogiri'
	require 'open-uri'

	urls = ['http://www.imdb.com/search/title?title_type=tv_series',
		'http://www.imdb.com/search/title?title_type=tv_series&page=2',
		'http://www.imdb.com/search/title?title_type=tv_series&page=3',
		'http://www.imdb.com/search/title?title_type=tv_series&page=4',
		'http://www.imdb.com/search/title?title_type=tv_series&page=5']

	urls.each do |page|
		url = page
		doc = Nokogiri::HTML(open(url))
		doc.css("div.lister-item-content").each do |row|
			title = row.css("h3 a").text
			url = row.css("h3 a").attr('href').text
			Series.create(:title => title, :url => url)
		end
	end
end