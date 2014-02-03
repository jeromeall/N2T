class SessionsController < ApplicationController
	def new
	end

	def create
		signin_params = params[:session]
		user=User.find_by_username(signin_params[:username].downcase)
		if user && user.authenticate(signin_params[:password])
	        # Sign the user in and redirect to the user's show page.
	        sign_in user
	        redirect_to user
	    else
	        # Create an error message and re-render the signin form.
	        flash.now[:error]='Invalid username/password combination'
	        render :new
	    end
	end

	def destroy
  		sign_out
  		redirect_to root_url
	end 

end
