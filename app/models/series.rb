class Series < ActiveRecord::Base

	def find_series
    	Kgsearch = Google::Apis::KgsearchV1
    	service = Kgsearch::KgsearchService.new
    	Kgsearch.key = 'AIzaSyDoJiOxIjx_e62xUqIaSyLzyf9ZwPUHJxA'
	end
end
