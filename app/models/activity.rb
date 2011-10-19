# == Schema Information
# Schema version: 20110910142220
#
# Table name: activities
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  company_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Activity < ActiveRecord::Base
  has_many :employee_familiars, :dependent => :restrict
  validates_presence_of	:name,:message => "es un dato requerido"
end
