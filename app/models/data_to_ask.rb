# == Schema Information
# Schema version: 20110621182933
#
# Table name: data_to_asks
#
#  id         :integer         not null, primary key
#  detalle    :string(255)
#  cantidad   :boolean
#  importe    :boolean
#  created_at :datetime
#  updated_at :datetime
#

class DataToAsk < ActiveRecord::Base
    has_many :employees
    validates_presence_of		    :detalle,															                          :message => "es un dato requerido"
end
