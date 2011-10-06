# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111005215403) do

  create_table "accounting_imputations", :force => true do |t|
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
  end

  create_table "activities", :force => true do |t|
    t.string   "name"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "associated_document_types", :force => true do |t|
    t.string   "name"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attachments", :force => true do |t|
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.integer  "associated_document_type_id"
    t.string   "name"
    t.date     "reception_date"
    t.string   "adjunto_file_name"
    t.string   "adjunto_content_type"
    t.integer  "associated_document_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.binary   "adjunto_file"
  end

  create_table "authorizations", :force => true do |t|
    t.string   "code",       :limit => 16,  :null => false
    t.string   "name",       :limit => 128, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bank_deposit_account_types", :force => true do |t|
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
  end

  create_table "bank_deposits", :force => true do |t|
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
  end

  create_table "categories", :force => true do |t|
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "importe"
    t.integer  "company_id"
    t.decimal  "horas"
    t.string   "codigo"
  end

  create_table "causa_egresos", :force => true do |t|
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
  end

  create_table "character_services", :force => true do |t|
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
  end

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contract_modes", :force => true do |t|
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
  end

  create_table "cost_centers", :force => true do |t|
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
  end

  create_table "countries", :force => true do |t|
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
  end

  create_table "data_to_asks", :force => true do |t|
    t.string   "detalle"
    t.boolean  "cantidad"
    t.boolean  "importe"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
  end

  create_table "deduccion_ganancias_tables", :force => true do |t|
    t.float    "no_imponibles"
    t.float    "conyuge"
    t.float    "hijo"
    t.float    "otras"
    t.float    "especial_inciso_e"
    t.float    "especial_inciso_abc"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "periodo_ano"
    t.integer  "periodo_mes"
    t.integer  "company_id"
  end

  create_table "detalle_recibo_habers", :force => true do |t|
    t.integer  "recibo_sueldo_id"
    t.integer  "remunerative_concept_id"
    t.string   "detalle"
    t.integer  "cost_center_id"
    t.decimal  "cantidad"
    t.decimal  "importe"
    t.decimal  "total"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "cantidad_recibo"
  end

  create_table "detalle_recibo_retencions", :force => true do |t|
    t.integer  "recibo_sueldo_id"
    t.integer  "retention_concept_id"
    t.string   "detalle"
    t.integer  "cost_center_id"
    t.decimal  "cantidad"
    t.decimal  "importe"
    t.decimal  "total"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "detalle_recibos", :force => true do |t|
    t.integer  "recibo_sueldo_id"
    t.integer  "remunerative_concept_id"
    t.integer  "retention_concept_id"
    t.string   "detalle"
    t.string   "type"
    t.integer  "cost_center_id"
    t.decimal  "cantidad"
    t.decimal  "importe"
    t.decimal  "total"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "document_types", :force => true do |t|
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
  end

  create_table "educational_levels", :force => true do |t|
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
  end

  create_table "email_types", :force => true do |t|
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
  end

  create_table "employee_documents", :force => true do |t|
    t.string   "name"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.datetime "document_updated_at"
    t.integer  "document_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.binary   "document_file"
    t.binary   "document_thumb_file"
    t.binary   "document_small_file"
    t.integer  "asociate_document_type_id"
    t.integer  "associated_document_type_id"
    t.integer  "employee_id"
  end

  create_table "employee_familiars", :force => true do |t|
    t.string   "apellido"
    t.string   "nombre"
    t.date     "fecha_nacimiento"
    t.integer  "numero_documento"
    t.integer  "health_insurance_id"
    t.string   "cuil"
    t.string   "cuit"
    t.string   "tomo"
    t.string   "folio"
    t.string   "acta"
    t.integer  "country_id"
    t.integer  "province_id"
    t.string   "comuna"
    t.integer  "employee_id"
    t.integer  "document_type_id"
    t.integer  "activity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "kinship_id"
    t.string   "address"
    t.string   "porcentual"
  end

  create_table "employee_remunerative_concepts", :force => true do |t|
    t.integer  "employee_id"
    t.integer  "remunerative_concept_id"
    t.integer  "cantidad"
    t.float    "importe"
    t.date     "fecha_inicio"
    t.date     "fecha_final"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cost_center_id"
    t.text     "detalle"
  end

  create_table "employee_retention_concepts", :force => true do |t|
    t.integer  "employee_id"
    t.integer  "retention_concept_id"
    t.integer  "cantidad"
    t.float    "importe"
    t.date     "fecha_inicio"
    t.date     "fecha_final"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "detalle"
  end

  create_table "employees", :force => true do |t|
    t.string   "legajo"
    t.string   "nombre"
    t.string   "apellido"
    t.string   "telefono"
    t.integer  "document_type_id"
    t.decimal  "numero_documento"
    t.integer  "issued_id"
    t.string   "sexo"
    t.integer  "nationality_id"
    t.integer  "marital_status_id"
    t.date     "fecha_nacimiento"
    t.string   "calle"
    t.string   "puerta"
    t.string   "piso"
    t.string   "departamento"
    t.integer  "location_id"
    t.integer  "province_id"
    t.integer  "country_id"
    t.string   "codigo_postal"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "movil"
    t.string   "email"
    t.integer  "category_id"
    t.integer  "section_id"
    t.integer  "task_id"
    t.integer  "place_id"
    t.integer  "character_service_id"
    t.string   "matricula_nacional"
    t.string   "matricula_provincial"
    t.string   "discapacidad"
    t.integer  "health_insurance_id"
    t.string   "plan_osocial"
    t.string   "numero_afiliado_osocial"
    t.integer  "cargas_extras_osocial"
    t.integer  "labor_union_id"
    t.string   "numero_afiliado_sindicato"
    t.string   "numero_jubilacion"
    t.string   "numero_ganancias"
    t.string   "cuit"
    t.string   "cuil"
    t.date     "fecha_ingreso"
    t.date     "fecha_egreso"
    t.decimal  "horas_pactadas"
    t.decimal  "remuneracion_fuera_convenio"
    t.integer  "remuneration_type_id"
    t.integer  "group_remuneration_id"
    t.integer  "group_retention_id"
    t.integer  "cost_center_id"
    t.integer  "antiguedad_reconocida_anos"
    t.integer  "antiguedad_reconocida_meses"
    t.decimal  "retencion_minima_osocial"
    t.integer  "educational_level_id"
    t.integer  "id_card"
    t.string   "numero_cofre"
    t.integer  "contract_mode_id"
    t.integer  "home_about_id"
    t.integer  "cuadras_asfalto"
    t.string   "domicilio_entre_calle_izquierda"
    t.string   "domicilio_entre_calle_derecha"
    t.string   "domicilio_entre_calles_detras"
    t.string   "domicilio_avenida_cercana"
    t.integer  "domicilio_avenida_cercana_altura"
    t.integer  "email_type_id"
    t.integer  "employment_id"
    t.integer  "accounting_imputation_id"
    t.integer  "insurance_company_id"
    t.string   "seguro_conyuge"
    t.string   "Seguro_numero_poliza"
    t.decimal  "seguro_monto_asegurado"
    t.integer  "bank_deposit_id"
    t.integer  "bank_deposit_account_type_id"
    t.string   "deposito_banco_cuenta"
    t.string   "deposito_banco_cbu"
    t.integer  "group_employer_contribution_id"
    t.integer  "causa_egreso_id"
    t.binary   "foto"
    t.integer  "company_id"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "sicoss_reduccion"
    t.integer  "sicoss_employer_type_id"
    t.integer  "sicoss_situation_id"
    t.integer  "sicoss_condition_id"
    t.integer  "sicoss_activity_id"
    t.integer  "sicoss_contract_mode_id"
    t.integer  "sicoss_damaged_id"
    t.integer  "sicoss_location_id"
    t.integer  "sicoss_reduction_zone_id"
    t.string   "sicoss_en_convenio"
    t.integer  "sicoss_regimen_type_id"
    t.string   "sicoss_seguro_obligatorio",        :limit => nil
  end

  create_table "employer_contribution_concepts", :force => true do |t|
    t.string   "codigo"
    t.string   "detalle"
    t.integer  "statistical_value"
    t.integer  "accounting_imputation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "prioridad"
    t.string   "acumuladores_valor"
    t.string   "formula_calculo_valor"
    t.integer  "company_id"
    t.integer  "aditional_halth_insurance_id"
    t.integer  "retention_concept_id"
    t.integer  "additional_health_insurance_id"
    t.integer  "health_insurance_id"
  end

  create_table "employer_contribution_concepts_group_employer_contributions", :id => false, :force => true do |t|
    t.integer  "group_employer_contribution_id"
    t.integer  "employer_contribution_concept_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employments", :force => true do |t|
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
  end

  create_table "group_employer_contributions", :force => true do |t|
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
  end

  create_table "group_remunerations", :force => true do |t|
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
  end

  create_table "group_remunerations_remunerative_concepts", :id => false, :force => true do |t|
    t.integer  "group_remuneration_id"
    t.integer  "remunerative_concept_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "group_renuneration", :force => true do |t|
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "group_retentions", :force => true do |t|
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
  end

  create_table "group_retentions_retention_concepts", :id => false, :force => true do |t|
    t.integer  "group_retention_id"
    t.integer  "retention_concept_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "health_insurances", :force => true do |t|
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
    t.string   "code"
  end

  create_table "home_abouts", :force => true do |t|
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
  end

  create_table "insurance_beneficiaries", :force => true do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.integer  "document_type_id"
    t.integer  "numero_documento"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "employee_id"
    t.date     "fecha_nacimiento"
    t.string   "address"
    t.integer  "kinship_id"
    t.decimal  "porcentual"
  end

  create_table "insurance_companies", :force => true do |t|
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
  end

  create_table "issueds", :force => true do |t|
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
  end

  create_table "kinships", :force => true do |t|
    t.string   "name"
    t.string   "hijo_conyugue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
  end

  create_table "labor_unions", :force => true do |t|
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
  end

  create_table "liquidacions", :force => true do |t|
    t.date     "fecha_liquidacion"
    t.date     "fecha_deposito"
    t.integer  "bank_deposit_id"
    t.date     "fecha_cierre"
    t.integer  "quincena"
    t.decimal  "techo_retenciones"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tipo_recibo_id"
    t.date     "periodo"
    t.date     "periodo_deposito"
    t.integer  "company_id"
  end

  create_table "locations", :force => true do |t|
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
  end

  create_table "marital_statuses", :force => true do |t|
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
  end

  create_table "menu_roles", :force => true do |t|
    t.integer  "menu_id",    :null => false
    t.integer  "rol_id",     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "menu_users", :force => true do |t|
    t.integer  "menu_id",    :null => false
    t.integer  "user_id",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "menus", :force => true do |t|
    t.integer  "parent_id"
    t.string   "name",       :limit => 128, :null => false
    t.string   "link_url",   :limit => 128
    t.integer  "order_no"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nationalities", :force => true do |t|
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
  end

  create_table "numeradors", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.decimal  "number"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "places", :force => true do |t|
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
  end

  create_table "provinces", :force => true do |t|
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
  end

  create_table "recibo_sueldos", :force => true do |t|
    t.integer  "liquidacion_id"
    t.integer  "employee_id"
    t.date     "fecha_recibo"
    t.string   "observaciones"
    t.string   "mensaje_recibo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "fecha_calculo"
  end

  create_table "remuneration_types", :force => true do |t|
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
  end

  create_table "remunerative_concepts", :force => true do |t|
    t.string   "codigo"
    t.string   "detalle"
    t.boolean  "porcentual_asistencia"
    t.integer  "prioridad_calculo"
    t.integer  "statistical_value"
    t.integer  "grupo_ganancias_id"
    t.integer  "accounting_imputation_id"
    t.integer  "concepto_asociado_haber_id"
    t.integer  "concepto_asociado_retencion_id"
    t.integer  "concepto_asociado_haber_2_id"
    t.integer  "concepto_asociado_retencion_2_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "acumuladores_valor"
    t.string   "acumuladores_cantidad"
    t.string   "calculo_valor"
    t.string   "calculo_cantidad"
    t.integer  "data_to_ask_id"
    t.string   "cantidad_en_recibo"
    t.integer  "company_id"
    t.boolean  "auxiliar"
  end

  create_table "retention_concepts", :force => true do |t|
    t.string   "codigo"
    t.string   "detalle"
    t.integer  "statistical_value"
    t.integer  "accounting_imputation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "prioridad"
    t.string   "formula_calculo_valor"
    t.string   "acumuladores_valor"
    t.integer  "data_to_ask_id"
    t.integer  "company_id"
    t.boolean  "auxiliar"
  end

  create_table "sections", :force => true do |t|
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
  end

  create_table "sicoss_activities", :force => true do |t|
    t.string   "name"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code"
  end

  create_table "sicoss_conditions", :force => true do |t|
    t.string   "name"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code"
  end

  create_table "sicoss_contract_modes", :force => true do |t|
    t.string   "name"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code"
  end

  create_table "sicoss_damageds", :force => true do |t|
    t.string   "name"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code"
  end

  create_table "sicoss_employer_types", :force => true do |t|
    t.string   "name"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code"
  end

  create_table "sicoss_format_employers", :force => true do |t|
    t.integer  "sicoss_format_id"
    t.string   "field_type"
    t.string   "formula"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sicoss_formats", :force => true do |t|
    t.integer  "position"
    t.string   "name"
    t.integer  "field_length"
    t.string   "justifies"
    t.string   "fill_character"
    t.string   "formula"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "field_type"
    t.integer  "number_of_decimals"
    t.boolean  "modifiable"
  end

  create_table "sicoss_locations", :force => true do |t|
    t.string   "name"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code"
  end

  create_table "sicoss_reduction_zones", :force => true do |t|
    t.string   "name"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code"
  end

  create_table "sicoss_regimen_types", :force => true do |t|
    t.string   "name"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code"
  end

  create_table "sicoss_situations", :force => true do |t|
    t.string   "name"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code"
  end

  create_table "tasks", :force => true do |t|
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
  end

  create_table "tipo_recibos", :force => true do |t|
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
    t.boolean  "recibo_principal"
  end

  create_table "user_authorizations", :force => true do |t|
    t.integer  "user_id",          :null => false
    t.integer  "authorization_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_roles", :force => true do |t|
    t.integer  "user_id",                       :null => false
    t.integer  "rol_id",                        :null => false
    t.boolean  "is_active",  :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
