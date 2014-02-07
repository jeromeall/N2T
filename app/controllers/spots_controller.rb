class SpotsController < ApplicationController
	before_filter :signed_in_user, only: [:create, :new, :edit, :update]


	def index
		consumer_key = 'ikIQlAiyIkmkYEBmfTgQWg'
		consumer_secret = 'KvdVjZdwTcfl5a1uVyNEf_5EnyA'
		token = 'JXXPmvxHacfzt2XZmug7sfQ2czqwa9yD'
		token_secret = 'Y-0y4MgCGJWLXTpTOUZwkm08sMY'

		api_host = 'api.yelp.com'

		consumer = OAuth::Consumer.new(consumer_key, consumer_secret, {:site => "http://#{api_host}"})
		access_token = OAuth::AccessToken.new(consumer, token, token_secret)

		@category = params[:spots]["term"]


		search_by = params[:search_by] || 0 
		path = "/v2/search?term=#{@category}&location=#{params[:spots]["zip"]}&sort=#{search_by}"

		api_request = access_token.get(path).body
		@search_results = JSON.parse(api_request)
		# binding.pry
		render "spots/index.html.erb"
	end

	def result
		@category = params[:category]
		id = params.require(:yelp_id)
		consumer_key = 'ikIQlAiyIkmkYEBmfTgQWg'
		consumer_secret = 'KvdVjZdwTcfl5a1uVyNEf_5EnyA'
		token = 'JXXPmvxHacfzt2XZmug7sfQ2czqwa9yD'
		token_secret = 'Y-0y4MgCGJWLXTpTOUZwkm08sMY'

		api_host = 'api.yelp.com'

		consumer = OAuth::Consumer.new(consumer_key, consumer_secret, {:site => "http://#{api_host}"})
		access_token = OAuth::AccessToken.new(consumer, token, token_secret)

		path = "/v2/business/#{params[:yelp_id]}"

		api_request_by_id = access_token.get(path).body
		@business = JSON.parse(api_request_by_id)
		binding.pry
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
