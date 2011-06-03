class DataToAsk < ActiveRecord::Base
    has_many :employees
    validates_presence_of		    :detalle,															                          :message => "es un dato requerido"
end
