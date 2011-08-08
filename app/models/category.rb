# == Schema Information
# Schema version: 20110721162735
#
# Table name: categories
#
#  id         :integer         not null, primary key
#  detalle    :string(255)
#  created_at :datetime
#  updated_at :datetime
#  importe    :decimal(, )
#  company_id :integer
#

class Category < ActiveRecord::Base
	has_many :employees
  validates_presence_of		    :detalle,															              :message => "es un dato requerido"

  scope :by_company, lambda {|company| where(:company_id => company) }

 # def print
 #   require 'prawn'
 #   pdf = Prawn::Document.new
 #   pdf.text("Prawn Rocks")
 #   pdf.render_file('prawn.pdf')
  #  end
end

