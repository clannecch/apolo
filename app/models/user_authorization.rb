# == Schema Information
# Schema version: 20110910142220
#
# Table name: user_authorizations
#
#  id               :integer         not null, primary key
#  user_id          :integer         not null
#  authorization_id :integer         not null
#  created_at       :datetime
#  updated_at       :datetime
#

class UserAuthorization < ActiveRecord::Base

	validates_numericality_of	:user_id, :greater_than_or_equal_to => 0 , :message => "es un dato requerido."
	validates_numericality_of	:authorization_id, :greater_than_or_equal_to => 0 , :message => "es un dato requerido."
end
