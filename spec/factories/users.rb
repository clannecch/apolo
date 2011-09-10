# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :user do |f|
  f.email "MyString"
  f.first_name "MyString"
  f.last_name "MyString"
end
