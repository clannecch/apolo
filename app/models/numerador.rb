class Numerador < ActiveRecord::Base
  scope :by_company, lambda {|company| where(:company_id => company) }
  validates_presence_of		    :code,							                          :message => "es un dato requerido"
  validates_presence_of		    :name,							                          :message => "es un dato requerido"

end
