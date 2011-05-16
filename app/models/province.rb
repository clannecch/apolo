# == Schema Information
# Schema version: 20110513210029
#
# Table name: provinces
#
#  id         :integer         not null, primary key
#  detalle    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Province < ActiveRecord::Base
	has_many :empleados
end
