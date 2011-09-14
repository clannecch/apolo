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
  validates_presence_of		    :formula,:field_type,	                          :message => "es un dato requerido"

  scope :by_company, lambda {|company| where(:company_id => company) }

end
