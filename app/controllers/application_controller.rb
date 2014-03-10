class ApplicationController < ActionController::Base

	protect_from_forgery with: :exception
  
  before_filter :set_categories
  before_filter :configure_permitted_parameters, if: :devise_controller?


  def set_categories
    @categories = ["Groceries", "Laundromat","Gym","Haircut","Post+Office","Pharmacy","Doctor", "Dentist",]
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end
end
