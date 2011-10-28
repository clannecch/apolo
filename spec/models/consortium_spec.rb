# == Schema Information
# Schema version: 20111028135309
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
#  ultima_hoja_libro         :string(255)
#  imprimir_hasta_hoja_libro :string(255)
#  observaciones             :text
#  company_id                :integer
#  created_at                :datetime
#  updated_at                :datetime
#

require 'spec_helper'

describe Consortium do
  pending "add some examples to (or delete) #{__FILE__}"
end
