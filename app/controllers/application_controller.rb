class ApplicationController < ActionController::Base

	protect_from_forgery with: :exception
  
  before_filter :set_categories
  def set_categories
    @categories = ["Groceries", "Laundromat","Gym","Haircut","Post+Office","Pharmacy","Doctor", "Dentist",]
  end

end
