# == Schema Information
# Schema version: 20111025214836
#
# Table name: remuneration_types
#
#  id           :integer         not null, primary key
#  detalle      :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  company_id   :integer
#  hora_dia_mes :string(255)
#  code         :string(255)
#  default      :boolean
#

class RemunerationType < ActiveRecord::Base
  #scope :by_company, lambda {|company| where(:company_id => company) }
  default_scope  ($MULTIPLE_COMPANIES == true) ? where(:company_id => $CURRENT_COMPANY) : where(false)

  has_many :employees, :dependent => :restrict
  validates_presence_of		    :detalle, :code, :hora_dia_mes,     :message => "es un dato requerido"
  validates_inclusion_of :hora_dia_mes , :in => %w(H D M)
  validates_uniqueness_of		  :code,			                        :message => "existente"
end
