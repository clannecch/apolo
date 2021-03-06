# == Schema Information
# Schema version: 20111024224627
#
# Table name: employees
#
#  id                               :integer         not null, primary key
#  legajo                           :string(255)
#  nombre                           :string(255)
#  apellido                         :string(255)
#  telefono                         :string(255)
#  document_type_id                 :integer
#  numero_documento                 :decimal(, )
#  issued_id                        :integer
#  sexo                             :string(255)
#  nationality_id                   :integer
#  marital_status_id                :integer
#  fecha_nacimiento                 :date
#  calle                            :string(255)
#  puerta                           :string(255)
#  piso                             :string(255)
#  departamento                     :string(255)
#  location_id                      :integer
#  province_id                      :integer
#  country_id                       :integer
#  codigo_postal                    :string(255)
#  created_at                       :datetime
#  updated_at                       :datetime
#  movil                            :string(255)
#  email                            :string(255)
#  category_id                      :integer
#  section_id                       :integer
#  task_id                          :integer
#  place_id                         :integer
#  character_service_id             :integer
#  matricula_nacional               :string(255)
#  matricula_provincial             :string(255)
#  discapacidad                     :string(255)
#  health_insurance_id              :integer
#  plan_osocial                     :string(255)
#  numero_afiliado_osocial          :string(255)
#  cargas_extras_osocial            :integer
#  labor_union_id                   :integer
#  numero_afiliado_sindicato        :string(255)
#  numero_jubilacion                :string(255)
#  numero_ganancias                 :string(255)
#  cuit                             :string(255)
#  cuil                             :string(255)
#  fecha_ingreso                    :date
#  fecha_egreso                     :date
#  horas_pactadas                   :decimal(, )
#  remuneracion_fuera_convenio      :decimal(, )
#  remuneration_type_id             :integer
#  group_retention_id               :integer
#  group_employercontribution_id    :integer
#  cost_center_id                   :integer
#  antiguedad_reconocida_anos       :integer
#  antiguedad_reconocida_meses      :integer
#  retencion_minima_osocial         :decimal(, )
#  educational_level_id             :integer
#  id_card                          :integer
#  numero_cofre                     :string(255)
#  contract_mode_id                 :integer
#  home_about_id                    :integer
#  cuadras_asfalto                  :integer
#  domicilio_entre_calle_izquierda  :string(255)
#  domicilio_entre_calle_derecha    :string(255)
#  domicilio_entre_calles_detras    :string(255)
#  domicilio_avenida_cercana        :string(255)
#  domicilio_avenida_cercana_altura :integer
#  email_type_id                    :integer
#  employment_id                    :integer
#  accounting_imputation_id         :integer
#  insurance_company_id             :integer
#  seguro_conyuge                   :string(255)
#  Seguro_numero_poliza             :string(255)
#  seguro_monto_asegurado           :decimal(, )
#  bank_deposit_id                  :integer
#  bank_deposit_account_type_id     :integer
#  deposito_banco_cuenta            :string(255)
#  deposito_banco_cbu               :string(255)
#  causa_egreso_id                  :integer
#  company_id                       :integer
#  latitude                         :float
#  longitude                        :float
#  avatar_file_name                 :string(255)
#  avatar_content_type              :string(255)
#  avatar_file_size                 :integer
#  avatar_updated_at                :datetime
#  sicoss_reduccion                 :string(255)
#  sicoss_employer_type_id          :integer
#  sicoss_situation_id              :integer
#  sicoss_condition_id              :integer
#  sicoss_activity_id               :integer
#  sicoss_contract_mode_id          :integer
#  sicoss_damaged_id                :integer
#  sicoss_location_id               :integer
#  sicoss_reduction_zone_id         :integer
#  sicoss_en_convenio               :string(255)
#  sicoss_regimen_type_id           :integer
#  sicoss_seguro_obligatorio        :string(1)
#  group_employer_contribution_id   :integer
#  group_remuneration_id            :integer
#  consortium_id                    :integer
#

require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
