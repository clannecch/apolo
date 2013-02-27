source 'http://rubygems.org'

#gem 'rails', '3.0.10'
gem 'rails', '~>3.0.10'

#gem 'rake', '0.9.2'
# fix rake version for DSL problem
gem 'rake', '0.8.7'

# design
gem 'compass'
gem 'haml-rails'
gem 'jquery-rails'
#gem 'cocoon'
gem 'cocoon', '1.0.22'
#gem 'formtastic'
gem 'formtastic', '~>2.0.1'
gem 'attrtastic'
gem 'subexec'
gem 'mini_magick'
gem 'geocoder'
#gem 'paperclip', :git => "git://github.com/patshaughnessy/paperclip.git"
gem 'paperclip', '~>3.1.2'
gem 'devise'

# paginacion
gem 'kaminari'

# search
gem 'meta_search'

# pdf
gem 'prawn'
gem 'wicked_pdf'



group :development, :test do
  # database
  gem 'sqlite3'
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
  gem 'thin'
  gem 'dalli'
end
