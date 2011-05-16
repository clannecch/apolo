# == Schema Information
# Schema version: 20110516135018
#
# Table name: insurance_beneficiaries
#
#  id               :integer         not null, primary key
#  nombre           :string(255)
#  apellido         :string(255)
#  document_type_id :integer
#  numero_documento :integer
#  created_at       :datetime
#  updated_at       :datetime
#  employee_id      :integer
#

class InsuranceBeneficiary < ActiveRecord::Base
	belongs_to :employee
	belongs_to :document_type
	
	
	
=begin
    delegate :detalle, :to => :document_type
    	
	def detalle
	  document_type.detalle
	end 	

	delegate :detalle, :to => :document_type, :prefix => true

    def document_type_detalle
	  document_type.detalle
	end 	
=end
end
