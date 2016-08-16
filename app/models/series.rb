class Series < ActiveRecord::Base
	after_create :update_info, :find_seasons
	validates_uniqueness_of :title, :case_sensitive => false

	require 'rubygems'
    require 'nokogiri'
    require 'open-uri'

	has_many :seasons
	has_many :episodes, :through => :seasons
	has_many :genres

	has_many :lists, :dependent => :destroy 
	has_many :users, :through => :lists

	def self.search(term)
		where('LOWER(title) LIKE :term', term: "%#{term.downcase}%")
	end

	def update_info
		series_title = self.title
	    url = ("http://www.imdb.com/find?q="+series_title+"&s=tt&ttype=tv&ref_=fn_tv")
	    doc = Nokogiri::HTML(open(url))
	    series_url = doc.css(".result_text")[0].css('a').attr('href').text
	    title = doc.css(".result_text")[0].css('a').text
	    self.update_attributes(:url => series_url, :title => title)
	    info_url = ("http://www.imdb.com/"+self.url)
	    info = Nokogiri::HTML(open(info_url))
	    description = info.css('div.summary_text').text
	    cast = info.css('span[itemprop = "actors"]').text
	    poster = info.css('img[itemprop = "image"]').attr('src').text
	    creator = info.css('div.credit_summary_item span[itemprop = "creator"]').text
	    self.update_attributes(:description => description, :premiere => premiere, :cast => cast, :poster => poster, :creator => creator)
	end

	def find_seasons
		series_url = self.url
		series_id = self.id
		page = ("http://www.imdb.com"+series_url)
		doc = Nokogiri::HTML(open(page))
		doc.css('div.seasons-and-year-nav div')[2].css('a').each do |seasonlist|
			season_url = seasonlist['href']
			Season.create(:season_number => seasonlist.text, :url => season_url, :series_id => series_id)
		end
	end
	
end
