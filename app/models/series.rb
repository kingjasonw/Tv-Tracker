class Series < ActiveRecord::Base
	validates :title, uniqueness: true
	after_create :update_info

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
	    self.update_attributes(:url => series_url)
	    info_url = ("http://www.imdb.com/"+self.url)
	    info = Nokogiri::HTML(open(info_url))
	    title = info.css('h1[itemprop = "name"]').text
	    description = info.css('div.summary_text').text
	    cast = info.css('span[itemprop = "actors"]').text
	    poster = info.css('img[itemprop = "image"]').attr('src').text
	    creator = info.css('div.credit_summary_item span[itemprop = "creator"]').text
	    self.update_attributes(:title => title, :description => description, :premiere => premiere, :cast => cast, :poster => poster, :creator => creator)
	end
	
end
