class Spot < ActiveRecord::Base
	has_many :spotsusers
	has_many :users, through :spotsusers
end
