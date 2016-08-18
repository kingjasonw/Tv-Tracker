desc "too many seasons for auto find"
task :fetch_seasons => :environment do 
	require 'rubygems'
	require 'nokogiri'
	require 'open-uri'

	series = Series.where(:id => 3)
	season_url = "/title/tt0472954/episodes?season=1"
	url = ("http://www.imdb.com"+season_url)
	doc = Nokogiri::HTML(open(url))
	Season.create(:season_number => 1, :url => season_url, :series_id => 3)
end