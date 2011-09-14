# == Schema Information
# Schema version: 20110910142220
#
# Table name: menu_roles
#
#  id         :integer         not null, primary key
#  menu_id    :integer         not null
#  rol_id     :integer         not null
#  created_at :datetime
#  updated_at :datetime
#

class MenuRole < ActiveRecord::Base
	belongs_to :menu

	validates_numericality_of	:menu_id, :greater_than_or_equal_to => 0 , :message => "es un dato requerido."
	validates_numericality_of	:rol_id, :greater_than_or_equal_to => 0 , :message => "es un dato requerido."
end
