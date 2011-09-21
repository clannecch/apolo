# == Schema Information
# Schema version: 20110910142220
#
# Table name: menus
#
#  id         :integer         not null, primary key
#  parent_id  :integer
#  name       :string(128)     not null
#  link_url   :string(128)
#  order_no   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Menu < ActiveRecord::Base
	has_many :menu_roles, :dependent => :restrict
	has_many :menu_users, :dependent => :restrict

	validates_presence_of		:name, :case_sensitive => false, :message => "es un dato requerido."
  validates_presence_of  :order_no, :message => "es un dato requerido."
end
