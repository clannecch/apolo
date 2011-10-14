require 'paperclip'

class Consortium < ActiveRecord::Base
  belongs_to :province
  belongs_to :location

  validates_presence_of		    :name,	:code, :calle, :altura, :codigo_postal,
                               :cuit, :numero_inscripcion,
                               :caja, :ultima_hoja_libro, :message => "es un dato requerido"

  has_many   :attachments, :as => :attachable, :dependent => :restrict

  accepts_nested_attributes_for :attachments , :allow_destroy => true

  scope :by_company, lambda {|company| where(:company_id => company) }


  def full_address
#    apellido + ', '+nombre
    return calle + ' ' +altura+' -'+codigo_postal+' '+location.detalle+' ('+province.detalle+")"

  end
end
