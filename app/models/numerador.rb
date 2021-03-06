# == Schema Information
# Schema version: 20111013184648
#
# Table name: numeradors
#
#  id         :integer         not null, primary key
#  code       :string(255)
#  name       :string(255)
#  number     :decimal(, )
#  company_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Numerador < ActiveRecord::Base
  #scope :by_company, lambda {|company| where(:company_id => company) }
  default_scope  ($MULTIPLE_COMPANIES == true) ? where(:company_id => $CURRENT_COMPANY) : where(false)

  validates_presence_of		    :name, :code,							                          :message => "es un dato requerido"
  validates_uniqueness_of		  :code,			                        :message => "existente"

end
