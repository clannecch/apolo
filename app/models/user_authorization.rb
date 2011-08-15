class UserAuthorization < ActiveRecord::Base

	validates_numericality_of	:user_id, :greater_than_or_equal_to => 0 , :message => "es un dato requerido."
	validates_numericality_of	:authorization_id, :greater_than_or_equal_to => 0 , :message => "es un dato requerido."
end
