# == Schema Information
# Schema version: 20111013184648
#
# Table name: companies
#
#  id                        :integer         not null, primary key
#  name                      :string(255)
#  created_at                :datetime
#  updated_at                :datetime
#  code                      :string(255)
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
#  ultima_hoja_libro         :integer
#  imprimir_hasta_hoja_libro :integer
#  observaciones             :text
#

require 'paperclip'

class Company < ActiveRecord::Base
  belongs_to :province
  belongs_to :location

  validates_presence_of		    :name,	:code, :calle, :altura, :codigo_postal,
                               :razon_social, :province_id, :location_id , :telefono, :razon_social,
                               :cuit, :email,                     :message => "es un dato requerido"
  validates_uniqueness_of		  :code,			                        :message => "existente"

  has_many   :attachments, :as => :attachable, :dependent => :restrict

  accepts_nested_attributes_for :attachments , :allow_destroy => true

end
