# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :my_image do |f|

  f.avatar_file_name "MyString"

  f.avatar_content_type "MyString"

  f.avatar_file_size 1

  f.avatar_updated_at "2011-07-18 17:18:18"

  f.detalle "MyString"

end
