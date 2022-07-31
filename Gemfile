source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'

gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
gem 'pg'
gem 'puma', '~> 4.1'

gem 'bootsnap', '>= 1.4.2', require: false

gem 'rack-cors'

gem 'devise'
gem 'devise_token_auth'
gem 'jsonapi-serializer'
gem 'kaminari'
gem 'has_scope'
gem 'active_storage_base64'
gem "aws-sdk-s3", require: false
gem 'pg_search'
gem 'rails-i18n'
gem 'devise-i18n'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'dotenv-rails'
end

group :development do
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
