class UsersController < ApplicationController

  def index
    @user= User.new
  end

  def show
    id = params.require(:id)
    @user = User.find(id)
    @spots = @user.spots
  end


  def new
  	@user = User.new()
  end

	def edit
  		@user = User.find(params[:id])
  	end
  

  def create
    @user=User.new(user_params)
    if @user.save
        flash[:success] = "Welcome to Ritly!"
        sign_in @user
        redirect_to @user

    else
        render'new'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
		flash[:success] = "Profile Updated"
		redirect_to @user
	else
		render 'edit'
	end
  end

  private
  	def user_params
  		params.require(:user).permit(:first_name,:last_name, :email, :password, :password_confirmation)
  	end

end
