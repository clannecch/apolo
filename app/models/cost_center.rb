# == Schema Information
# Schema version: 20111025214836
#
# Table name: cost_centers
#
#  id         :integer         not null, primary key
#  detalle    :string(255)
#  created_at :datetime
#  updated_at :datetime
#  company_id :integer
#  code       :string(255)
#  default    :boolean
#

class CostCenter < ActiveRecord::Base
  has_many :employees, :dependent => :restrict
  scope :by_company, lambda {|company| where(:company_id => company) }

  validates_presence_of		    :detalle, :code,					          :message => "es un dato requerido"
  validates_uniqueness_of		  :code,			                        :message => "existente"
  validates_uniqueness_of     :default , :if => Proc.new { |t| t.default == true } , :message => "Ya existe un default"
end
