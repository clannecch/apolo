# == Schema Information
# Schema version: 20110513210029
#
# Table name: activities
#
#  id         :integer         not null, primary key
#  detalle    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Activity < ActiveRecord::Base
	has_many :employee_familiars
end
