class MenuRole < ActiveRecord::Base
	belongs_to :menu

	validates_numericality_of	:menu_id, :greater_than_or_equal_to => 0 , :message => "es un dato requerido."
	validates_numericality_of	:rol_id, :greater_than_or_equal_to => 0 , :message => "es un dato requerido."
end
