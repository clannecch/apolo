class SicossFormatEmployer < ActiveRecord::Base
  belongs_to :sicoss_format

  scope :by_company, lambda {|company| where(:company_id => company) }

end
