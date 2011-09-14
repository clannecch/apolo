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
	validates_presence_of :detalle, :message => "es un dato requerido"
  has_many :data_to_ask
  scope :by_company, lambda {|company| where(:company_id => company) }

end
