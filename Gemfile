source 'http://rubygems.org'

gem 'rails'
gem 'bcrypt'
gem 'faker'
gem 'bootstrap-sass'
gem 'will_paginate' # この行を追加してください。
gem 'bootstrap-will_paginate'
gem 'puma',         '~> 3.7'
gem 'sass-rails',   '~> 5.0'
gem 'uglifier',     '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks',   '~> 5'
gem 'jbuilder',     '~> 2.5'
gem 'rails-i18n',   '5.1.3'
gem 'rinku'
gem 'rename'
gem 'rakuten_web_service'
gem 'google-api-client', '<0.9'
gem 'trollop', '~> 2.1'
gem 'carrierwave'
gem 'mini_magick'
gem 'nokogiri'
gem 'optimist'
gem "refile", require: "refile/rails", github: 'manfe/refile'
gem "refile-mini_magick"

group :development, :test do
  gem 'sqlite3'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  gem 'pg', '0.20.0'
end

# Windows環境ではtzinfo-dataというgemを含める必要があります
# Mac環境でもこのままでOKです
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
