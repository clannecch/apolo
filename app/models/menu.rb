class Menu < ActiveRecord::Base
	has_many :menu_roles
	has_many :menu_users

	validates_presence_of		:name, :case_sensitive => false, :message => "es un dato requerido."
end
