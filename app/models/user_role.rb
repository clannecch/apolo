# == Schema Information
# Schema version: 20110910142220
#
# Table name: user_roles
#
#  id         :integer         not null, primary key
#  user_id    :integer         not null
#  rol_id     :integer         not null
#  is_active  :boolean         default(FALSE)
#  created_at :datetime
#  updated_at :datetime
#

class UserRole < ActiveRecord::Base

	validates_numericality_of	:user_id, :greater_than_or_equal_to => 0 , :message => "es un dato requerido."
	validates_numericality_of	:rol_id, :greater_than_or_equal_to => 0 , :message => "es un dato requerido."
end
