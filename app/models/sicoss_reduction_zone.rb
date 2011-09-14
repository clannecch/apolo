# == Schema Information
# Schema version: 20110910142220
#
# Table name: sicoss_reduction_zones
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  company_id :integer
#  created_at :datetime
#  updated_at :datetime
#  code       :string(255)
#

class SicossReductionZone < ActiveRecord::Base
  has_many :employees
  validates_presence_of		    :name,															                          :message => "es un dato requerido"

end
