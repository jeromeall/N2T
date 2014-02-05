class Spot < ActiveRecord::Base
	has_many :transitions
	has_many :users, through: :transitions
end
