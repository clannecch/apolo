# == Schema Information
# Schema version: 20111013184648
#
# Table name: tipo_recibos
#
#  id               :integer         not null, primary key
#  detalle          :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  company_id       :integer
#  recibo_principal :boolean
#

class TipoRecibo < ActiveRecord::Base
  #scope :by_company, lambda {|company| where(:company_id => company) }
  default_scope  ($MULTIPLE_COMPANIES == true) ? where(:company_id => $CURRENT_COMPANY) : where(false)

  has_many :liquidacions, :dependent => :restrict
  validates_presence_of		    :detalle,															          :message => "es un dato requerido"
  validates_uniqueness_of		  :recibo_principal,			                        :message => "existente"

end
