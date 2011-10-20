# == Schema Information
# Schema version: 20111013184648
#
# Table name: consortia
#
#  id                        :integer         not null, primary key
#  code                      :string(255)
#  name                      :string(255)
#  razon_social              :string(255)
#  calle                     :string(255)
#  altura                    :string(255)
#  codigo_postal             :string(255)
#  location_id               :integer
#  province_id               :integer
#  latitude                  :float
#  longitude                 :float
#  telefono                  :string(255)
#  contacto                  :string(255)
#  email                     :string(255)
#  cuit                      :string(255)
#  numero_inscripcion        :string(255)
#  caja                      :string(255)
#  ultima_hoja_libro         :string(255)
#  imprimir_hasta_hoja_libro :string(255)
#  observaciones             :text
#  company_id                :integer
#  created_at                :datetime
#  updated_at                :datetime
#

require 'paperclip'

class Consortium < ActiveRecord::Base
  belongs_to :province
  belongs_to :location

  validates_presence_of	:name, :code, :calle, :altura, :codigo_postal,
                        :cuit, :ultima_hoja_libro, :message => "es un dato requerido"

#                               , :numero_inscripcion, :caja,

  has_many   :attachments, :as => :attachable, :dependent => :restrict

  accepts_nested_attributes_for :attachments , :allow_destroy => true

  scope :by_company, lambda {|company| where(:company_id => company) }


  def full_address
#    apellido + ', '+nombre
    return calle + ' ' +altura+' -'+codigo_postal+' '+location.detalle+' ('+province.detalle+")"
  end
end
