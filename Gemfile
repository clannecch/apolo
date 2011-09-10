source 'http://rubygems.org'

gem 'rails', '3.0.10'
#gem 'rake', '0.9.2'
# fix rake version for DSL problem
gem 'rake', '0.8.7'

# design
gem 'compass'
gem 'haml-rails'
gem 'jquery-rails'
gem 'cocoon'
gem 'formtastic'
gem 'attrtastic'
gem 'subexec'
gem 'mini_magick'
gem 'geocoder'
gem 'paperclip', :git => "git://github.com/patshaughnessy/paperclip.git"

# paginacion
gem 'kaminari'

# search
gem 'meta_search'

# pdf
gem 'prawn'
gem 'wicked_pdf'

gem 'sqlite3'

group :development, :test do
  # database
  # design depends
  #gem 'hpricot'
  #gem 'ruby_parser'
  # documentation
  gem 'annotate'
  # testing
  gem 'rspec-rails'
  #gem 'factory_girl_rails'
end

group :production do
  # heroku's cache
  gem 'dalli'
end
