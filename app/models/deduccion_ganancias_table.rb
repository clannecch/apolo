class DeduccionGananciasTable < ActiveRecord::Base
  scope :by_company, lambda {|company| where(:company_id => company) }
end
