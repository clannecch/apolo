# == Schema Information
# Schema version: 20110721162735
#
# Table name: tipo_recibos
#
#  id         :integer         not null, primary key
#  detalle    :string(255)
#  created_at :datetime
#  updated_at :datetime
#  company_id :integer
#

class TipoRecibo < ActiveRecord::Base
  scope :by_company, lambda {|company| where(:company_id => company) }
  has_many :liquidacions
  validates_presence_of		    :detalle,															                          :message => "es un dato requerido"

end
