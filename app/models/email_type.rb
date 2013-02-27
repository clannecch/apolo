# == Schema Information
# Schema version: 20111025214836
#
# Table name: email_types
#
#  id         :integer         not null, primary key
#  detalle    :string(255)
#  created_at :datetime
#  updated_at :datetime
#  company_id :integer
#  code       :string(255)
#  default    :boolean
#

class EmailType < ActiveRecord::Base
  has_many :employees, :dependent => :restrict
  validates_presence_of		    :detalle,	:code,									         :message => "es un dato requerido"
  validates_uniqueness_of		  :code,			                        :message => "existente"

  #scope :by_company, lambda {|company| where(:company_id => company) }
  default_scope  ($MULTIPLE_COMPANIES == true) ? where(:company_id => $CURRENT_COMPANY) : where(false)
  validates_uniqueness_of     :default , :if => Proc.new { |t| t.default == true } , :message => "Ya existe un default"
end
