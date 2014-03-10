# class UsersController < ApplicationController

#   def index
#     @user= User.new
#   end

#   def show
#     id = params.require(:id)
#     @user = User.find(id)
#     @groceries_spot = @user.spots.find_by(category: "Groceries")
#     @laundromat_spot = @user.spots.find_by(category: "Laundromat")
#     @gym_spot = @user.spots.find_by(category: "Gym")
#     @haircut_spot = @user.spots.find_by(category: "Haircut")
#     @postoffice_spot = @user.spots.find_by(category: "Post+Office")
#     @pharmacy_spot = @user.spots.find_by(category: "Pharmacy")
#     @doctor_spot = @user.spots.find_by(category: "Doctor")
#     @dentist_spot = @user.spots.find_by(category: "Dentist")
#   end


#   def new
#   	@user = User.new()
#   end

# 	def edit
#   		@user = User.find(params[:id])
#   	end
  

#   def create
#     @user=User.new(user_params)
#     if @user.save
#         flash[:success] = "Welcome to Ritly!"
#         UserMailer.welcome_email(@user).deliver 
#         sign_in @user
#         redirect_to @user
#         binding.pry

#     else
#         render'new'
#     end
#   end

#   def update
#     binding.pry
#     @user = User.find(params[:id])
#     if @user.update_attributes(user_params)
#       @user.save
# 		flash[:success] = "Profile Updated"
# 		redirect_to @user
# 	else
# 		render 'edit'
# 	end
#   end

#   private
#   	def user_params
#   		params.require(:user).permit(:first_name,:last_name, :email, :password, :password_confirmation, :birthday, :address, :city, :state_code, :zip, :neighborhood, :about)
#   	end

# end
