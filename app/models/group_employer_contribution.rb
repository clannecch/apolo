# == Schema Information
# Schema version: 20110513210029
#
# Table name: group_employer_contributions
#
#  id         :integer         not null, primary key
#  detalle    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class GroupEmployerContribution < ActiveRecord::Base
	has_many :employees
end
