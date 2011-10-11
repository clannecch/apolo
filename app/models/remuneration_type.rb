# == Schema Information
# Schema version: 20110721162735
#
# Table name: remuneration_types
#
#  id         :integer         not null, primary key
#  detalle    :string(255)
#  created_at :datetime
#  updated_at :datetime
#  company_id :integer
#

class RemunerationType < ActiveRecord::Base
  scope :by_company, lambda {|company| where(:company_id => company) }
	has_many :employees, :dependent => :restrict
  validates_presence_of		    :detalle, :hora_dia_mes,               :message => "es un dato requerido"
  validates_inclusion_of :hora_dia_mes , :in => %w(H D M)
end
