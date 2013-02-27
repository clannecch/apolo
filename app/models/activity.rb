# == Schema Information
# Schema version: 20111025214836
#
# Table name: activities
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  company_id :integer
#  created_at :datetime
#  updated_at :datetime
#  code       :string(255)
#  default    :boolean
#

class Activity < ActiveRecord::Base
  has_many :employee_familiars, :dependent => :restrict
  #scope :by_company, lambda {|company| where(:company_id => company) }
  default_scope  ($MULTIPLE_COMPANIES == true) ? where(:company_id => $CURRENT_COMPANY) : where(false)

  validates_presence_of		    :name,:code,									  :message => "es un dato requerido"
  validates_uniqueness_of		  :code,			                        :message => "existente"
  validates_uniqueness_of     :default , :if => Proc.new { |t| t.default == true } , :message => "Ya existe un default"

end