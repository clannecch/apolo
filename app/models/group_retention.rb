# == Schema Information
# Schema version: 20110513210029
#
# Table name: group_retentions
#
#  id         :integer         not null, primary key
#  detalle    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class GroupRetention < ActiveRecord::Base
	has_many :employees
  validates_presence_of		    :detalle,															                          :message => "es un dato requerido"
  has_and_belongs_to_many :retention_concepts
end
