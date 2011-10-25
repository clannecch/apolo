# == Schema Information
# Schema version: 20110721162735
#
# Table name: data_to_asks
#
#  id         :integer         not null, primary key
#  detalle    :string(255)
#  cantidad   :boolean
#  importe    :boolean
#  created_at :datetime
#  updated_at :datetime
#  company_id :integer
#

class DataToAsk < ActiveRecord::Base
  has_many :remunerative_concepts, :dependent => :restrict
  has_many :retention_concepts, :dependent => :restrict
  #scope :by_company, lambda {|company| where(:company_id => company) }
  default_scope  ($MULTIPLE_COMPANIES == true) ? where(:company_id => $CURRENT_COMPANY) : where(false)

	validates_presence_of :detalle, :message => "es un dato requerido"
end
