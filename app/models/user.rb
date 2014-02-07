class User < ActiveRecord::Base
has_many :transitions
has_many :spots, through: :transitions

has_secure_password

	validates :first_name, presence: true, length: { maximum: 50 }
	validates :last_name, presence: true, length: { maximum: 50 }
	validates :email, presence: true, uniqueness: true
	validates_format_of :email,with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
	validates :password, :password_confirmation, presence: true, confirmation: true, on: :create






before_save { |user| user.email = email.downcase }
before_save :create_remember_token




private 
	def create_remember_token
		self.remember_token = SecureRandom.urlsafe_base64
	end


end
