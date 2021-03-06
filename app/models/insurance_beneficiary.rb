# == Schema Information
# Schema version: 20111013184648
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
#  fecha_nacimiento :date
#  address          :string(255)
#  kinship_id       :integer
#  porcentual       :decimal(, )
#

class InsuranceBeneficiary < ActiveRecord::Base
	belongs_to :employee
	belongs_to :document_type
  belongs_to :kinship
	
	validates_presence_of		    :nombre,															                :message => "es un dato requerido"
	validates_presence_of		    :apellido,															              :message => "es un dato requerido"
  validates_presence_of		    :fecha_nacimiento,													          :message => "es un dato requerido"
  validates_presence_of		    :numero_documento,													          :message => "es un dato requerido"

  validates_numericality_of 	:numero_documento, :greater_than_or_equal_to => 0,		:message => "acepta valores positivos"
  validates_numericality_of 	:porcentual, :greater_than_or_equal_to => 0,
                              :less__than_or_equal_to => 100 ,					            :message => "acepta valores positivos"


	
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
