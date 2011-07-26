class AssociatedDocumentType < ActiveRecord::Base
  belongs_to  :employee
  validates_presence_of		    :name,															                          :message => "es un dato requerido"

  scope :by_company, lambda {|company| where(:company_id => company) }
end
