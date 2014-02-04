class UsersController < ApplicationController

	def show
	    @user = User.find(params[:id])
	end

	def new
	    @user = User.new()
	end

	def create
	    @user=User.new(user_params)
	    if @user.save
	        flash[:success] = "Welcome 2 town!"
	        sign_in @user
	        redirect_to edit_user_path(current_user)
	    else
	        render'new'
	    end
	end

	def update
	    @user = User.find(params[:id])
	    @user.update_attributes(user_params)
	    render :show
	end

	def edit
		@user = User.find(params[:id])
	end

private 
def user_params
	params.require(:user).permit(:first_name, :last_name, :email, :username, :password, :password_confirmation,
	    	 :birthday, :address, :city, :state_code, :zip, :neighborhood, :phone, :about)
end


end
