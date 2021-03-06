# == Schema Information
# Schema version: 20110910142220
#
# Table name: sicoss_activities
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  company_id :integer
#  created_at :datetime
#  updated_at :datetime
#  code       :string(255)
#

class SicossActivity < ActiveRecord::Base
  has_many :employees, :dependent => :restrict
  validates_presence_of		    :name,	:code,											:message => "es un dato requerido"
  validates_uniqueness_of		  :code,			                        :message => "existente"
  validates_uniqueness_of     :default , :if => Proc.new { |t| t.default == true } , :message => "Ya existe un default"

end
