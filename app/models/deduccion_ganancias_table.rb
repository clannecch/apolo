# == Schema Information
# Schema version: 20110721162735
#
# Table name: deduccion_ganancias_tables
#
#  id                  :integer         not null, primary key
#  no_imponibles       :float
#  conyuge             :float
#  hijo                :float
#  otras               :float
#  especial_inciso_e   :float
#  especial_inciso_abc :float
#  created_at          :datetime
#  updated_at          :datetime
#  periodo_ano         :integer
#  periodo_mes         :integer
#  company_id          :integer
#

class DeduccionGananciasTable < ActiveRecord::Base
  scope :by_company, lambda {|company| where(:company_id => company) }
end
