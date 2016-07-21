desc "Find series genre"
task :fetch_genre => :environment do 
	require 'rubygems'
	require 'nokogiri'
	require 'open-uri'

	Series.find_each do |series|
		@series = series
		page = ("http://www.imdb.com"+@series.url)
		doc = Nokogiri::HTML(open(page))
		doc.css('span[itemprop = "genre"]').each do |name|
			id = Genre.where(genre: name.text).ids
			@series.update_attribute(:genre_id, id)
		end
	end
end