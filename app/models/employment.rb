# == Schema Information
# Schema version: 20110513210029
#
# Table name: employments
#
#  id         :integer         not null, primary key
#  detalle    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Employment < ActiveRecord::Base
	has_many :employees
end
