class User < ActiveRecord::Base
has_many :spotsusers
has_many :spots, through: :spotsusers

has_secure_password

	validates :first_name, presence: true, length: { maximum: 50 }
	validates :last_name, presence: true, length: { maximum: 50 }
	validates :email, presence: true, uniqueness: true
	validates_format_of :email,with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
	validates :password, :password_confirmation, presence: true, confirmation: true
	validates :state_code,  length: { is: 2 }, on: :update
	validates_format_of :state_code, with: /\A[-a-z]+\z/, on: :update






before_save { |user| user.email = email.downcase }
before_save :create_remember_token




private 
	def create_remember_token
		self.remember_token = SecureRandom.urlsafe_base64
	end


end
