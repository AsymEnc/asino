source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'

# Bootstrap with SASS
gem 'bootstrap-sass'

# See https://github.com/ai/autoprefixer-rails
# gem 'autoprefixer-rails'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails', '~> 4.0.3'
gem 'jquery-ui-rails', '~> 5.0.5'

# Turbolinks makes following links in your web application faster. Read more:
# https://github.com/rails/turbolinks
gem 'turbolinks', '~> 2.5.3'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

# Spring speeds up development by keeping your application running
# in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'devise', '~> 3.4.1'

gem 'sunspot_rails'
gem 'sunspot_solr' # , :group => :development
gem 'progress_bar'

gem 'will_paginate'
gem 'will_paginate-bootstrap'

gem 'smart_listing'

group :development do
  # Using Thin instead of WEBrick.
  gem 'thin', '~> 1.6.3'

  # Use Capistrano for deployment
  gem 'capistrano', '~> 3.3.5', require: false
  gem 'capistrano-rails', '~> 1.1.2', require: false
  gem 'capistrano-passenger', '~> 0.0.2', require: false
  gem 'capistrano-bundler', '~> 1.1.4', require: false
  gem 'capistrano-rbenv', '~> 2.0.3', require: false

  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
end

group :production do
  gem 'mysql2', '~> 0.3.18'
end
