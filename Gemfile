source 'https://rubygems.org'

ruby '2.0.0'
gem 'rails', '4.0.2'
gem "bcrypt", "~> 3.1.5"
gem 'devise'
gem 'yelpster'


gem 'pg'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
# gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'

group :doc do
  gem 'sdoc', require: false
end

group :development, :test do 
  gem 'dotenv-rails'
  gem 'rspec-rails', '~> 3.0.0.beta'
  gem 'launchy'
  gem 'database_cleaner'
  group :darwin do 
    gem 'rb-fsevent', :require => false
  end
  gem 'guard-rspec' 
  gem 'guard-livereload'
end

# to deploy correctly to heroku
gem 'rails_12factor', group: :production
