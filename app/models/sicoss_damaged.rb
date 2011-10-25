# == Schema Information
# Schema version: 20110910142220
#
# Table name: sicoss_damageds
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  company_id :integer
#  created_at :datetime
#  updated_at :datetime
#  code       :string(255)
#

class SicossDamaged < ActiveRecord::Base
  has_many :employees, :dependent => :restrict
  validates_presence_of		    :name, :code,												:message => "es un dato requerido"
  validates_uniqueness_of		  :code,			                        :message => "existente"

end
