# == Schema Information
# Schema version: 20110621182933
#
# Table name: tipo_recibos
#
#  id         :integer         not null, primary key
#  detalle    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class TipoRecibo < ActiveRecord::Base
  scope :by_company, lambda {|company| where(:company_id => company) }
  has_many :liquidacions
end
