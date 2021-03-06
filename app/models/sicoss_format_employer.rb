# == Schema Information
# Schema version: 20110910142220
#
# Table name: sicoss_format_employers
#
#  id               :integer         not null, primary key
#  sicoss_format_id :integer
#  field_type       :string(255)
#  formula          :string(255)
#  company_id       :integer
#  created_at       :datetime
#  updated_at       :datetime
#

class SicossFormatEmployer < ActiveRecord::Base
  belongs_to :sicoss_format

  #scope :by_company, lambda {|company| where(:company_id => company) }
  default_scope  ($MULTIPLE_COMPANIES == true) ? where(:company_id => $CURRENT_COMPANY) : where(false)

  validates_presence_of		    :formula,:field_type,	                          :message => "es un dato requerido"
  validates_uniqueness_of		  :sicoss_format_id,			                        :message => "existente"


end
