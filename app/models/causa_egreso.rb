class CausaEgreso < ActiveRecord::Base

  has_many :employees
  validates_presence_of		    :detalle,															            :message => "es un dato requerido"

  scope :by_company, lambda {|company| where(:company_id => company) }

end
