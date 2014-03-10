class SpotsController < ApplicationController
	before_filter :authenticate_user!
	# include Yelp::V2::Search::Request::Location

	def index
		consumer_key = ENV['YELP_CONSUMER_KEY']
		consumer_secret = ENV['YELP_CONSUMER_SECRET']
		token = ENV['YELP_TOKEN']
		token_secret = ENV['YELP_TOKEN_SECRET']

		# search parameters
		category = params[:spots]["term"]
		zip = params[:spots]["zip"]
		search_by = params[:search_by] || 0 
		
		# construct client instance 
		client = Yelp::Client.new

		# perform an address/location-based search for cream puffs nearby
		request = Yelp::V2::Search::Request::Location.new(
			:term => category,
			:zipcode =>	zip,
			:sort => search_by,
			:consumer_key => consumer_key,
			:consumer_secret => consumer_secret,
			:token => token,
			:token_secret => token_secret
			)
		
		@search_results = client.search(request)

		binding.pry
		render "spots/index.html.erb"
	end

	def result
		consumer_key = ENV['YELP_CONSUMER_KEY']
		consumer_secret = ENV['YELP_CONSUMER_SECRET']
		token = ENV['YELP_TOKEN']
		token_secret = ENV['YELP_TOKEN_SECRET']

		@category = params[:category]
		yelp_id = params.require(:yelp_id)

		client = Yelp::Client.new

		request = Yelp::V2::Business::Request::Id.new(
			:yelp_business_id => yelp_id	,
			:consumer_key => consumer_key,
			:consumer_secret => consumer_secret,
			:token => token,
			:token_secret => token_secret
			)
		@business = client.search(request)
	end


	def add_to_user
		if current_user.spots.find_by(category: params[:spot]["category"]) != nil
			current_user.spots.find_by(category: params[:spot]["category"]).delete	
		end
		current_user.spots.create(spot_params)
		redirect_to current_user
	end


	def show
		id = params[:id]
		@spot = current_user.spots.find(id)
	end

	def destroy
		id = params[:id]
		current_user.spots.delete(id)
		redirect_to current_user
	end

	def update
		id = params[:id]
		@spot = current_user.spots.find(id)
		@spot.update(spot_params)
		render "show"
	end





	private
	def spot_params
		params.require(:spot).permit(:name, :rating_img_url, :snippet_text, :image_url, :display_phone, :address, :cross_streets, :city, :neighborhoods, :postal_code, :state_code, :yelp_id, :category, :note)
	end
end
