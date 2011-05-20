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

ActiveRecord::Schema.define(:version => 20110517221542) do

  create_table "accounting_imputations", :force => true do |t|
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "activities", :force => true do |t|
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bank_deposit_account_types", :force => true do |t|
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bank_deposits", :force => true do |t|
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "character_services", :force => true do |t|
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contract_modes", :force => true do |t|
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cost_centers", :force => true do |t|
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", :force => true do |t|
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "document_types", :force => true do |t|
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "educational_levels", :force => true do |t|
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.integer  "group_renumbering_id"
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
  end

  create_table "employer_contributions", :force => true do |t|
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employments", :force => true do |t|
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "group_employer_contributions", :force => true do |t|
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "group_renumberings", :force => true do |t|
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "group_retentions", :force => true do |t|
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "health_insurances", :force => true do |t|
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "home_abouts", :force => true do |t|
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "insurance_beneficiaries", :force => true do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.integer  "document_type_id"
    t.integer  "numero_documento"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "employee_id"
  end

  create_table "insurance_companies", :force => true do |t|
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "issueds", :force => true do |t|
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "labor_unions", :force => true do |t|
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", :force => true do |t|
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "marital_statuses", :force => true do |t|
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nationalities", :force => true do |t|
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "places", :force => true do |t|
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "provinces", :force => true do |t|
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "remuneration_types", :force => true do |t|
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "remunerative_concepts", :force => true do |t|
    t.string   "codigo"
    t.string   "detalle"
    t.integer  "calculation_type"
    t.decimal  "valor"
    t.string   "porcentual_asistencia"
    t.string   "base_calculo"
    t.integer  "prioridad_calculo"
    t.boolean  "pide_datos"
    t.integer  "statistical_value"
    t.string   "acumulador_cantidad"
    t.integer  "grupo_ganancias_id"
    t.integer  "accounting_imputation_id"
    t.integer  "concepto_asociado_haber_id"
    t.integer  "concepto_asociado_retencion_id"
    t.integer  "concepto_asociado_haber_2_id"
    t.integer  "concepto_asociado_retencion_2_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "retention_concepts", :force => true do |t|
    t.string   "codigo"
    t.string   "detalle"
    t.integer  "calculation_type"
    t.decimal  "valor"
    t.string   "base_calculo"
    t.boolean  "pide_datos"
    t.integer  "statistical_value"
    t.boolean  "es_ganancia"
    t.integer  "accounting_imputation_id"
    t.string   "es_auxiliar_ganancias"
    t.string   "grupo_ganancias"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections", :force => true do |t|
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", :force => true do |t|
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
