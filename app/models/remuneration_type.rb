# == Schema Information
# Schema version: 20111013184648
#
# Table name: remuneration_types
#
#  id           :integer         not null, primary key
#  detalle      :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  company_id   :integer
#  hora_dia_mes :string(255)
#

class RemunerationType < ActiveRecord::Base
  #scope :by_company, lambda {|company| where(:company_id => company) }
  default_scope  ($MULTIPLE_COMPANIES == true) ? where(:company_id => $CURRENT_COMPANY) : where(false)

  has_many :employees, :dependent => :restrict
  validates_presence_of		    :detalle, :hora_dia_mes,               :message => "es un dato requerido"
  validates_inclusion_of :hora_dia_mes , :in => %w(H D M)
end
