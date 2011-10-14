require 'paperclip'

class Company < ActiveRecord::Base
  belongs_to :province
  belongs_to :location

  validates_presence_of		    :name,	:code, :calle, :altura, :codigo_postal,
                               :razon_social, :province_id, :location_id , :telefono, :razon_social,
                               :cuit, :email, :message => "es un dato requerido"

  has_many   :attachments, :as => :attachable, :dependent => :restrict

  accepts_nested_attributes_for :attachments , :allow_destroy => true

end
