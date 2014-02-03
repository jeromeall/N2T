class UsersController < ApplicationController

	def show
	    @user = User.find(params[:id])
	end

	def new
	    @user = User.new()
	end

	def create
	    new_user = params.require(:user).permit(:first_name, :last_name, :email, :username, :password, :password_confirmation, :birthday, :address, :city, :state_code, :zip, :neighborhood, :phone, :about)
	    @user=User.new(new_user)
	    if @user.save
	        flash[:success] = "Welcome to the Cook Book app!"
	        sign_in @user
	        redirect_to edit_user_path(current_user)
	    else
	        render'new'
	    end
	end

	def update
	    @user = User.find(params[:id])
	    @user.update_attributes(params[:user])
	    render :show
	end

	def edit
		@user = User.find(params[:id])
	end

end
