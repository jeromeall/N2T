class SpotsController < ApplicationController

	def index
		consumer_key = 'ikIQlAiyIkmkYEBmfTgQWg'
		consumer_secret = 'KvdVjZdwTcfl5a1uVyNEf_5EnyA'
		token = 'gKhs6i3E-sDOWuFiEVavVlQFKs9Wc3RB'
		token_secret = 'XVw3pxeohMeSKga7cK-YRe5KVHY'

		api_host = 'api.yelp.com'

		consumer = OAuth::Consumer.new(consumer_key, consumer_secret, {:site => "http://#{api_host}"})
		access_token = OAuth::AccessToken.new(consumer, token, token_secret)

		path = "/v2/search?term=#{params[:spots]["term"]}&location=#{params[:spots]["zip"]}"

		api_request = access_token.get(path).body
		@search_results = JSON.parse(api_request)
		# binding.pry
		render "spots/index.html.erb"
	end

	def show
		id = params[:yelp_id]

		consumer_key = 'ikIQlAiyIkmkYEBmfTgQWg'
		consumer_secret = 'KvdVjZdwTcfl5a1uVyNEf_5EnyA'
		token = 'gKhs6i3E-sDOWuFiEVavVlQFKs9Wc3RB'
		token_secret = 'XVw3pxeohMeSKga7cK-YRe5KVHY'

		api_host = 'api.yelp.com'

		consumer = OAuth::Consumer.new(consumer_key, consumer_secret, {:site => "http://#{api_host}"})
		access_token = OAuth::AccessToken.new(consumer, token, token_secret)

		path = "/v2/business/#{params[:yelp_id]}"

		api_request_by_id = access_token.get(path).body
		@business = JSON.parse(api_request_by_id)
		binding.pry
	end



end
