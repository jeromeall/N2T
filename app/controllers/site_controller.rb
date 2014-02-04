class SiteController < ApplicationController
  
  def index
  	@categories = ["Groceries", "Laundromat","Gym","Haircut","Post Office","Pharmacy","Doctor", "Dentist",]
  end

end
