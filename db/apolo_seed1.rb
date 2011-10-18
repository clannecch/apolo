#encoding: utf-8
=begin
Execute:
  heroku console
  load Rails.root.join('db/apolo_seed1.rb').to_s
=end

=begin
Menu.delete_all
id_menu_old = []
id_menu_new = []
new_reg=Menu.create!(:parent_id => nil, :name => "Maestros", :link_url => "", :order_no => 1)
id_menu_old << 1
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Empleados", :link_url => "/employees", :order_no => 1)
id_menu_old << 2
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "liquidaciones", :link_url => "/liquidacions", :order_no => 2)
id_menu_old << 3
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Conceptos de liquidacion", :link_url => "?", :order_no => 3)
id_menu_old << 4
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Haberes", :link_url => "?", :order_no => 1)
id_menu_old << 5
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Grupo de Remuneraciones", :link_url => "/group_remunerations", :order_no => 2)
id_menu_old << 6
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Codigos", :link_url => "/remunerative_concepts", :order_no => 1)
id_menu_old << 7
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Retenciones", :link_url => "/retention_concepts", :order_no => 1)
id_menu_old << 8
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Retenciones", :link_url => "?", :order_no => 1)
id_menu_old << 9
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Grupo de retenciones", :link_url => "/group_retentions", :order_no => 1)
id_menu_old << 10
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Aportes Patronales", :link_url => "?", :order_no => 1)
id_menu_old << 11
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Grupo de Aportes Patronales", :link_url => "/group_employer_contributions", :order_no => 3)
id_menu_old << 12
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Codigos", :link_url => "/employer_contribution_concepts", :order_no => 1)
id_menu_old << 13
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Bancos", :link_url => "?", :order_no => 1)
id_menu_old << 14
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Bancos", :link_url => "/bank_deposits", :order_no => 1)
id_menu_old << 15
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Tipos de Cuentas", :link_url => "/bank_deposit_account_types", :order_no => 2)
id_menu_old << 16
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Tablas Varias", :link_url => "?", :order_no => 0)
id_menu_old << 17
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Ubicacion", :link_url => "?", :order_no => 1)
id_menu_old << 18
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Modalidades de Contratacion", :link_url => "/contract_modes", :order_no => 1)
id_menu_old << 19
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Centros de Costos", :link_url => "/cost_centers", :order_no => 1)
id_menu_old << 20
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Paises", :link_url => "/countries", :order_no => 1)
id_menu_old << 21
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Datos a Solicitar", :link_url => "/data_to_asks", :order_no => 1)
id_menu_old << 22
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Tipos de Documentos", :link_url => "/document_types", :order_no => 1)
id_menu_old << 23
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Niveles de Educacion", :link_url => "/educational_levels", :order_no => 1)
id_menu_old << 24
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Tipo de Calle", :link_url => "/home_abouts", :order_no => 1)
id_menu_old << 25
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Lugares de emision de Documentos", :link_url => "/issueds", :order_no => 1)
id_menu_old << 26
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Localidades", :link_url => "/locations", :order_no => 1)
id_menu_old << 27
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Estados Civil", :link_url => "/marital_statuses", :order_no => 1)
id_menu_old << 28
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Nacionalidades", :link_url => "/nationalities", :order_no => 1)
id_menu_old << 29
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Lugares de Trabajo", :link_url => "/places", :order_no => 1)
id_menu_old << 30
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Provincias", :link_url => "/provinces", :order_no => 1)
id_menu_old << 31
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Tipos de Remuneraciones", :link_url => "/remuneration_types", :order_no => 1)
id_menu_old << 32
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Secciones", :link_url => "/sections", :order_no => 1)
id_menu_old << 33
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Tareas", :link_url => "/tasks", :order_no => 1)
id_menu_old << 34
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Tipos de Recibos", :link_url => "/tipo_recibos", :order_no => 1)
id_menu_old << 35
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Cuentas Contables", :link_url => "/accounting_imputations", :order_no => 1)
id_menu_old << 36
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Categorias", :link_url => "/categories", :order_no => 1)
id_menu_old << 37
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Obras Sociales", :link_url => "/health_insurances", :order_no => 1)
id_menu_old << 38
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Aseguradoras", :link_url => "/insurance_companies", :order_no => 1)
id_menu_old << 39
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Sindicatos", :link_url => "/labor_unions", :order_no => 1)
id_menu_old << 40
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "menus", :link_url => "/menus", :order_no => 99)
id_menu_old << 41
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Exportaciones", :link_url => "?", :order_no => 1)
id_menu_old << 42
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "SIJP", :link_url => "/sijp", :order_no => 1)
id_menu_old << 43
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Estadisticas", :link_url => "?", :order_no => 1)
id_menu_old << 44
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Centros de Costos", :link_url => "/centro_costos", :order_no => 1)
id_menu_old << 45
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Conceptos de liquidacion", :link_url => "?", :order_no => 1)
id_menu_old << 46
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Haberes", :link_url => "/estadistica_haberes", :order_no => 1)
id_menu_old << 47
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Retenciones", :link_url => "/retenciones", :order_no => 1)
id_menu_old << 48
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Empleados", :link_url => "?", :order_no => 1)
id_menu_old << 49
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Resumen de liquidaciones", :link_url => "/resumen_liquidaciones", :order_no => 1)
id_menu_old << 50
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Conceptos de liquidacion", :link_url => "/estaditica_empleado_concepto", :order_no => 1)
id_menu_old << 51
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Graficas", :link_url => "?", :order_no => 1)
id_menu_old << 52
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Liquidacion Automatica", :link_url => "?", :order_no => 1)
id_menu_old << 53
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Tipos de Documento Adjunto", :link_url => "/associated_document_types", :order_no => 1)
id_menu_old << 55
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Parentesco", :link_url => "/kinships", :order_no => 1)
id_menu_old << 56
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Actividad", :link_url => "/activities", :order_no => 1)
id_menu_old << 57
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Tablas AFIP", :link_url => "?", :order_no => 1)
id_menu_old << 58
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Actividades", :link_url => "/sicoss_activities", :order_no => 1)
id_menu_old << 59
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Condicion", :link_url => "/sicoss_conditions", :order_no => 1)
id_menu_old << 60
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Modalidad de Contrato", :link_url => "/sicoss_contract_modes", :order_no => 1)
id_menu_old << 61
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Codigo de Siniestrado", :link_url => "/sicoss_damageds", :order_no => 1)
id_menu_old << 62
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Localidad", :link_url => "/sicoss_locations", :order_no => 1)
id_menu_old << 63
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Zona / Reduccion", :link_url => "/sicoss_reduction_zones", :order_no => 1)
id_menu_old << 64
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Tipo de Regimen", :link_url => "/sicoss_regimen_types", :order_no => 1)
id_menu_old << 65
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Situacion", :link_url => "/sicoss_situations", :order_no => 1)
id_menu_old << 67
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Tipo de Empleador", :link_url => "/sicoss_employer_types", :order_no => 1)
id_menu_old << 68
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Formato de Transferecia SiCOSS", :link_url => "/sicoss_formats", :order_no => 99)
id_menu_old << 69
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "formato sicoss", :link_url => "/sicoss_formats", :order_no => 88)
id_menu_old << 70
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Complemento SICOSS Empresa", :link_url => "/sicoss_format_employers", :order_no => 77)
id_menu_old << 71
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Causa de Egreso", :link_url => "/causa_egresos", :order_no => 86)
id_menu_old << 72
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Tipos de Mail", :link_url => "/email_types", :order_no => 85)
id_menu_old << 73
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Ocupacion", :link_url => "/employments", :order_no => 84)
id_menu_old << 74
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Numeradores", :link_url => "/numeradors", :order_no => 99)
id_menu_old << 75
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Administradoras", :link_url => "/companies", :order_no => 3)
id_menu_old << 76
id_menu_new << new_reg.id
new_reg=Menu.create!(:parent_id => 1, :name => "Consorsios", :link_url => "/consortia", :order_no => 77)
id_menu_old << 77
id_menu_new << new_reg.id


Country.delete_all
id_country_old = []
id_country_new = []
new_reg=Country.create!(:detalle => "Argentina", :company_id => nil)
id_country_old << 1
id_country_new << new_reg.id
new_reg=Country.create!(:detalle => "Italia", :company_id => nil)
id_country_old << 2
id_country_new << new_reg.id
new_reg=Country.create!(:detalle => "España", :company_id => nil)
id_country_old << 3
id_country_new << new_reg.id
Province.delete_all
id_province_old = []
id_province_new = []
new_reg=Province.create!(:detalle => "Buenos Aires", :company_id => nil)
id_province_old << 1
id_province_new << new_reg.id
new_reg=Province.create!(:detalle => "Santa Fé", :company_id => nil)
id_province_old << 2
id_province_new << new_reg.id
new_reg=Province.create!(:detalle => "Cordoba", :company_id => nil)
id_province_old << 3
id_province_new << new_reg.id
Company.delete_all
=end

id_company_old = []
id_company_new = []
#new_reg=Company.create!(:name => "Coca Cola", :code => "koke", :razon_social => "The Coca-Cola Company", :calle => "helguera", :altura => "4847", :codigo_postal => "1419", :location_id => nil, :province_id => id_province_new[ id_province_old.index(1)], :latitude => nil, :longitude => nil, :telefono => "4573-4409", :contacto => "pablo", :email => "esta@pro.com", :cuit => "30-1234567-1", :numero_inscripcion => "no tiene", :caja => "industria", :ultima_hoja_libro => 1, :imprimir_hasta_hoja_libro => 100, :observaciones => obs)
id_company_old << 1
id_company_new << 1

=begin
new_reg=Company.create!(:name => "Pepsi", :code => nil, :razon_social => nil, :calle => nil, :altura => nil, :codigo_postal => nil, :location_id => nil, :province_id => nil, :latitude => nil, :longitude => nil, :telefono => nil, :contacto => nil, :email => nil, :cuit => nil, :numero_inscripcion => nil, :caja => nil, :ultima_hoja_libro => nil, :imprimir_hasta_hoja_libro => nil, :observaciones => nil)
id_company_old << 2
id_company_new << new_reg.id
new_reg=Company.create!(:name => "quilmes", :code => nil, :razon_social => nil, :calle => nil, :altura => nil, :codigo_postal => nil, :location_id => nil, :province_id => nil, :latitude => nil, :longitude => nil, :telefono => nil, :contacto => nil, :email => nil, :cuit => nil, :numero_inscripcion => nil, :caja => nil, :ultima_hoja_libro => nil, :imprimir_hasta_hoja_libro => nil, :observaciones => nil)
id_company_old << 3
id_company_new << new_reg.id
Location.delete_all

id_location_old = []
id_location_new = []
new_reg=Location.create!(:detalle => "Capital Federal", :company_id => id_company_new[ id_company_old.index(1)])
id_location_old << 1
id_location_new << new_reg.id
new_reg=Location.create!(:detalle => "La Plata", :company_id => id_company_new[ id_company_old.index(1)])
id_location_old << 2
id_location_new << new_reg.id
new_reg=Location.create!(:detalle => "San Martin", :company_id => id_company_new[ id_company_old.index(1)])
id_location_old << 3
id_location_new << new_reg.id
Province.delete_all
id_province_old = []
id_province_new = []
new_reg=Province.create!(:detalle => "Buenos Aires", :company_id => id_company_new[ id_company_old.index(1)])
id_province_old << 1
id_province_new << new_reg.id
new_reg=Province.create!(:detalle => "Santa Fé", :company_id => id_company_new[ id_company_old.index(1)])
id_province_old << 2
id_province_new << new_reg.id
new_reg=Province.create!(:detalle => "Cordoba", :company_id => id_company_new[ id_company_old.index(1)])
id_province_old << 3
id_province_new << new_reg.id
=end


GroupRemuneration.delete_all
id_group_remuneration_old = []
id_group_remuneration_new = []
new_reg=GroupRemuneration.create!(:detalle => "enfermeros", :company_id => id_company_new[ id_company_old.index(1)])
id_group_remuneration_old << 1
id_group_remuneration_new << new_reg.id
new_reg=GroupRemuneration.create!(:detalle => "DETALLE1", :company_id => id_company_new[ id_company_old.index(1)])
id_group_remuneration_old << 2
id_group_remuneration_new << new_reg.id
new_reg=GroupRemuneration.create!(:detalle => "Sueldo * Hs * extras * asistencia", :company_id => id_company_new[ id_company_old.index(1)])
id_group_remuneration_old << 3
id_group_remuneration_new << new_reg.id
GroupRetention.delete_all
id_group_retention_old = []
id_group_retention_new = []
new_reg=GroupRetention.create!(:detalle => "Osde", :company_id => id_company_new[ id_company_old.index(1)])
id_group_retention_old << 1
id_group_retention_new << new_reg.id
new_reg=GroupRetention.create!(:detalle => "UOM", :company_id => id_company_new[ id_company_old.index(1)])
id_group_retention_old << 2
id_group_retention_new << new_reg.id
new_reg=GroupRetention.create!(:detalle => "UOCRA", :company_id => id_company_new[ id_company_old.index(1)])
id_group_retention_old << 3
id_group_retention_new << new_reg.id
AccountingImputation.delete_all
id_accounting_imputation_old = []
id_accounting_imputation_new = []
new_reg=AccountingImputation.create!(:detalle => "sueldos pabellon 1", :company_id => id_company_new[ id_company_old.index(1)])
id_accounting_imputation_old << 1
id_accounting_imputation_new << new_reg.id
new_reg=AccountingImputation.create!(:detalle => "Sueldos Administracion", :company_id => id_company_new[ id_company_old.index(1)])
id_accounting_imputation_old << 2
id_accounting_imputation_new << new_reg.id
new_reg=AccountingImputation.create!(:detalle => "otra mas", :company_id => id_company_new[ id_company_old.index(1)])
id_accounting_imputation_old << 4
id_accounting_imputation_new << new_reg.id
DataToAsk.delete_all
id_data_to_ask_old = []
id_data_to_ask_new = []
new_reg=DataToAsk.create!(:detalle => "Ninguno", :cantidad => false, :importe => false, :company_id => id_company_new[ id_company_old.index(1)])
id_data_to_ask_old << 1
id_data_to_ask_new << new_reg.id
new_reg=DataToAsk.create!(:detalle => "Cantidad", :cantidad => true, :importe => false, :company_id => id_company_new[ id_company_old.index(1)])
id_data_to_ask_old << 2
id_data_to_ask_new << new_reg.id
new_reg=DataToAsk.create!(:detalle => "Importe", :cantidad => false, :importe => true, :company_id => id_company_new[ id_company_old.index(1)])
id_data_to_ask_old << 3
id_data_to_ask_new << new_reg.id
new_reg=DataToAsk.create!(:detalle => "Cantidad e Importe", :cantidad => true, :importe => true, :company_id => id_company_new[ id_company_old.index(1)])
id_data_to_ask_old << 4
id_data_to_ask_new << new_reg.id
Category.delete_all
id_category_old = []
id_category_new = []
new_reg=Category.create!(:detalle => "Administrativo", :importe => 20000.0, :company_id => id_company_new[ id_company_old.index(1)], :horas => 200.0, :codigo => "A1")
id_category_old << 1
id_category_new << new_reg.id
new_reg=Category.create!(:detalle => "Director", :importe => 20000.0, :company_id => id_company_new[ id_company_old.index(1)], :horas => 200.0, :codigo => "D1")
id_category_old << 2
id_category_new << new_reg.id
new_reg=Category.create!(:detalle => "Enfermero", :importe => 10000.0, :company_id => id_company_new[ id_company_old.index(1)], :horas => 150.0, :codigo => "E1")
id_category_old << 3
id_category_new << new_reg.id
RetentionConcept.delete_all
id_retention_concept_old = []
id_retention_concept_new = []
new_reg=RetentionConcept.create!(:codigo => "001", :detalle => "Jubilacion", :statistical_value => 0, :accounting_imputation_id => nil, :prioridad => 0, :formula_calculo_valor => "@haberescondescuento  * 0.11", :acumuladores_valor => "@retenciones", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(1)], :company_id => id_company_new[ id_company_old.index(1)], :auxiliar => false)
id_retention_concept_old << 1
id_retention_concept_new << new_reg.id
new_reg=RetentionConcept.create!(:codigo => "002", :detalle => "Obra Social", :statistical_value => nil, :accounting_imputation_id => nil, :prioridad => 1, :formula_calculo_valor => "0.03 * @haberescondescuento", :acumuladores_valor => "@retenciones", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(1)], :company_id => id_company_new[ id_company_old.index(1)], :auxiliar => false)
id_retention_concept_old << 2
id_retention_concept_new << new_reg.id
new_reg=RetentionConcept.create!(:codigo => "1234", :detalle => "adicional obra social", :statistical_value => nil, :accounting_imputation_id => nil, :prioridad => 99, :formula_calculo_valor => "1", :acumuladores_valor => "1", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(1)], :company_id => id_company_new[ id_company_old.index(1)], :auxiliar => false)
id_retention_concept_old << 5
id_retention_concept_new << new_reg.id
new_reg=RetentionConcept.create!(:codigo => "777", :detalle => "Importe Fijo", :statistical_value => 1, :accounting_imputation_id => id_accounting_imputation_new[ id_accounting_imputation_old.index(1)], :prioridad => 999, :formula_calculo_valor => ":importe", :acumuladores_valor => ":cantidad", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(3)], :company_id => id_company_new[ id_company_old.index(1)], :auxiliar => false)
id_retention_concept_old << 6
id_retention_concept_new << new_reg.id
new_reg=RetentionConcept.create!(:codigo => "ar1", :detalle => "auxiliar", :statistical_value => nil, :accounting_imputation_id => nil, :prioridad => 1, :formula_calculo_valor => "100", :acumuladores_valor => "1", :data_to_ask_id => nil, :company_id => id_company_new[ id_company_old.index(1)], :auxiliar => true)
id_retention_concept_old << 7
id_retention_concept_new << new_reg.id
RemunerativeConcept.delete_all
id_remunerative_concept_old = []
id_remunerative_concept_new = []
new_reg=RemunerativeConcept.create!(:codigo => "001", :detalle => "Sueldo Basico", :porcentual_asistencia => false, :prioridad_calculo => 1, :statistical_value => 1, :grupo_ganancias_id => nil, :accounting_imputation_id => nil, :concepto_asociado_haber_id => nil, :concepto_asociado_retencion_id => nil, :concepto_asociado_haber_2_id => nil, :concepto_asociado_retencion_2_id => nil, :acumuladores_valor => "@basico   @haberescondescuento @remuneracion_habitual", :acumuladores_cantidad => "", :calculo_valor => "@sueldo", :calculo_cantidad => "1", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(1)], :cantidad_en_recibo => "", :company_id => id_company_new[ id_company_old.index(1)], :auxiliar => false)
id_remunerative_concept_old << 1
id_remunerative_concept_new << new_reg.id
new_reg=RemunerativeConcept.create!(:codigo => "002", :detalle => "Horas Normales", :porcentual_asistencia => false, :prioridad_calculo => 1, :statistical_value => 0, :grupo_ganancias_id => nil, :accounting_imputation_id => nil, :concepto_asociado_haber_id => nil, :concepto_asociado_retencion_id => nil, :concepto_asociado_haber_2_id => nil, :concepto_asociado_retencion_2_id => nil, :acumuladores_valor => "@basico @haberescondescuento @aguinaldo  @aguinaldo", :acumuladores_cantidad => "", :calculo_valor => "novedad_haber:cantidad  * @valor_hora", :calculo_cantidad => "novedad_haber:cantidad", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(2)], :cantidad_en_recibo => "", :company_id => id_company_new[ id_company_old.index(1)], :auxiliar => false)
id_remunerative_concept_old << 2
id_remunerative_concept_new << new_reg.id
new_reg=RemunerativeConcept.create!(:codigo => "003", :detalle => "Horas Extras al 50%.", :porcentual_asistencia => false, :prioridad_calculo => 1, :statistical_value => nil, :grupo_ganancias_id => nil, :accounting_imputation_id => nil, :concepto_asociado_haber_id => nil, :concepto_asociado_retencion_id => nil, :concepto_asociado_haber_2_id => nil, :concepto_asociado_retencion_2_id => nil, :acumuladores_valor => "@basico   @haberescondescuento", :acumuladores_cantidad => "@HorasTrabajadas", :calculo_valor => "@valor_hora * novedad_haber:cantidad  * 1.5", :calculo_cantidad => "", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(2)], :cantidad_en_recibo => "", :company_id => id_company_new[ id_company_old.index(1)], :auxiliar => false)
id_remunerative_concept_old << 3
id_remunerative_concept_new << new_reg.id
new_reg=RemunerativeConcept.create!(:codigo => "004", :detalle => "premio asistencia", :porcentual_asistencia => false, :prioridad_calculo => 2, :statistical_value => nil, :grupo_ganancias_id => nil, :accounting_imputation_id => nil, :concepto_asociado_haber_id => nil, :concepto_asociado_retencion_id => nil, :concepto_asociado_haber_2_id => nil, :concepto_asociado_retencion_2_id => nil, :acumuladores_valor => "@basico @haberescondescuento", :acumuladores_cantidad => "", :calculo_valor => "@basico * 0.2 ", :calculo_cantidad => "", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(1)], :cantidad_en_recibo => "", :company_id => id_company_new[ id_company_old.index(1)], :auxiliar => false)
id_remunerative_concept_old << 4
id_remunerative_concept_new << new_reg.id
new_reg=RemunerativeConcept.create!(:codigo => "005", :detalle => "Antiguedad", :porcentual_asistencia => false, :prioridad_calculo => 3, :statistical_value => nil, :grupo_ganancias_id => nil, :accounting_imputation_id => nil, :concepto_asociado_haber_id => nil, :concepto_asociado_retencion_id => nil, :concepto_asociado_haber_2_id => nil, :concepto_asociado_retencion_2_id => nil, :acumuladores_valor => " @haberescondescuento", :acumuladores_cantidad => "", :calculo_valor => "@basico * @antiguedad * 0.2", :calculo_cantidad => "@antiguedad", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(1)], :cantidad_en_recibo => "", :company_id => id_company_new[ id_company_old.index(1)], :auxiliar => false)
id_remunerative_concept_old << 5
id_remunerative_concept_new << new_reg.id
new_reg=RemunerativeConcept.create!(:codigo => "006", :detalle => "Horas Extras al 100%", :porcentual_asistencia => false, :prioridad_calculo => 0, :statistical_value => nil, :grupo_ganancias_id => nil, :accounting_imputation_id => nil, :concepto_asociado_haber_id => nil, :concepto_asociado_retencion_id => nil, :concepto_asociado_haber_2_id => nil, :concepto_asociado_retencion_2_id => nil, :acumuladores_valor => "@basico @haberescondescuento @aguinaldo", :acumuladores_cantidad => "", :calculo_valor => "novedad_haber:cantidad*@valor_hora*0.2", :calculo_cantidad => "novedad_haber:cantidad", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(2)], :cantidad_en_recibo => "", :company_id => id_company_new[ id_company_old.index(1)], :auxiliar => false)
id_remunerative_concept_old << 6
id_remunerative_concept_new << new_reg.id
new_reg=RemunerativeConcept.create!(:codigo => "500", :detalle => "Aguinaldo", :porcentual_asistencia => false, :prioridad_calculo => 999, :statistical_value => nil, :grupo_ganancias_id => nil, :accounting_imputation_id => nil, :concepto_asociado_haber_id => nil, :concepto_asociado_retencion_id => nil, :concepto_asociado_haber_2_id => nil, :concepto_asociado_retencion_2_id => nil, :acumuladores_valor => "@haberescondescuento", :acumuladores_cantidad => "", :calculo_valor => "@mejor_remuneracion_semestre / 180 * @dias_trabajados_semestre", :calculo_cantidad => "@dias_trabajados_semestre", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(1)], :cantidad_en_recibo => "", :company_id => id_company_new[ id_company_old.index(1)], :auxiliar => false)
id_remunerative_concept_old << 7
id_remunerative_concept_new << new_reg.id
new_reg=RemunerativeConcept.create!(:codigo => "499", :detalle => "Dias Vacaciones", :porcentual_asistencia => false, :prioridad_calculo => 0, :statistical_value => nil, :grupo_ganancias_id => nil, :accounting_imputation_id => nil, :concepto_asociado_haber_id => nil, :concepto_asociado_retencion_id => nil, :concepto_asociado_haber_2_id => nil, :concepto_asociado_retencion_2_id => nil, :acumuladores_valor => "@basico @haberescondescuento", :acumuladores_cantidad => "", :calculo_valor => "@sueldo / 25 * @dias_vacaciones", :calculo_cantidad => "@dias_vacaciones", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(1)], :cantidad_en_recibo => nil, :company_id => id_company_new[ id_company_old.index(1)], :auxiliar => false)
id_remunerative_concept_old << 8
id_remunerative_concept_new << new_reg.id
new_reg=RemunerativeConcept.create!(:codigo => "007", :detalle => "Dias Vacaciones (MANUAL)", :porcentual_asistencia => false, :prioridad_calculo => 1, :statistical_value => nil, :grupo_ganancias_id => nil, :accounting_imputation_id => nil, :concepto_asociado_haber_id => nil, :concepto_asociado_retencion_id => nil, :concepto_asociado_haber_2_id => nil, :concepto_asociado_retencion_2_id => nil, :acumuladores_valor => "@basico @haberescondescuento", :acumuladores_cantidad => "", :calculo_valor => "novedad_haber:importe", :calculo_cantidad => "novedad_haber:cantidad", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(2)], :cantidad_en_recibo => "", :company_id => id_company_new[ id_company_old.index(1)], :auxiliar => false)
id_remunerative_concept_old << 9
id_remunerative_concept_new << new_reg.id
new_reg=RemunerativeConcept.create!(:codigo => "600", :detalle => "Indemnizacion por despido ", :porcentual_asistencia => false, :prioridad_calculo => 90, :statistical_value => nil, :grupo_ganancias_id => nil, :accounting_imputation_id => nil, :concepto_asociado_haber_id => nil, :concepto_asociado_retencion_id => nil, :concepto_asociado_haber_2_id => nil, :concepto_asociado_retencion_2_id => nil, :acumuladores_valor => "@haberescondescuento", :acumuladores_cantidad => "", :calculo_valor => "@cantidad_sueldos_indemnizacion_despido *  @mejor_remuneracion_habitual_anual", :calculo_cantidad => "@cantidad_sueldos_indemnizacion_despido", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(1)], :cantidad_en_recibo => nil, :company_id => id_company_new[ id_company_old.index(1)], :auxiliar => false)
id_remunerative_concept_old << 10
id_remunerative_concept_new << new_reg.id
new_reg=RemunerativeConcept.create!(:codigo => "601", :detalle => "Indemnizacion sustitutiva del Preaviso", :porcentual_asistencia => false, :prioridad_calculo => 90, :statistical_value => nil, :grupo_ganancias_id => nil, :accounting_imputation_id => nil, :concepto_asociado_haber_id => nil, :concepto_asociado_retencion_id => nil, :concepto_asociado_haber_2_id => nil, :concepto_asociado_retencion_2_id => nil, :acumuladores_valor => "@haberescondescuento", :acumuladores_cantidad => "", :calculo_valor => "@cantidad_indemnizacion_falta_preaviso *  @mejor_remuneracion_habitual_anual", :calculo_cantidad => "@cantidad_indemnizacion_falta_preaviso", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(1)], :cantidad_en_recibo => nil, :company_id => id_company_new[ id_company_old.index(1)], :auxiliar => false)
id_remunerative_concept_old << 11
id_remunerative_concept_new << new_reg.id
new_reg=RemunerativeConcept.create!(:codigo => "602", :detalle => "Integracion mes despido", :porcentual_asistencia => false, :prioridad_calculo => 1, :statistical_value => nil, :grupo_ganancias_id => nil, :accounting_imputation_id => nil, :concepto_asociado_haber_id => nil, :concepto_asociado_retencion_id => nil, :concepto_asociado_haber_2_id => nil, :concepto_asociado_retencion_2_id => nil, :acumuladores_valor => "@haberescondescuento", :acumuladores_cantidad => "", :calculo_valor => "(@mejor_remuneracion_habitual_anual / 30) * @dias_trabajados_mes", :calculo_cantidad => "@dias_trabajados_mes", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(1)], :cantidad_en_recibo => nil, :company_id => id_company_new[ id_company_old.index(1)], :auxiliar => false)
id_remunerative_concept_old << 12
id_remunerative_concept_new << new_reg.id
new_reg=RemunerativeConcept.create!(:codigo => "603", :detalle => "Proporcional del mes trabajado", :porcentual_asistencia => false, :prioridad_calculo => 1, :statistical_value => nil, :grupo_ganancias_id => nil, :accounting_imputation_id => nil, :concepto_asociado_haber_id => nil, :concepto_asociado_retencion_id => nil, :concepto_asociado_haber_2_id => nil, :concepto_asociado_retencion_2_id => nil, :acumuladores_valor => "@haberescondescuento", :acumuladores_cantidad => "", :calculo_valor => "(@mejor_remuneracion_habitual_anual / 30) * (30 - @dias_trabajados_mes)", :calculo_cantidad => "30 - @dias_trabajados_mes", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(1)], :cantidad_en_recibo => nil, :company_id => id_company_new[ id_company_old.index(1)], :auxiliar => false)
id_remunerative_concept_old << 13
id_remunerative_concept_new << new_reg.id
new_reg=RemunerativeConcept.create!(:codigo => "604", :detalle => "Indemnizacion por Vacaciones no Gozadas", :porcentual_asistencia => false, :prioridad_calculo => 1, :statistical_value => nil, :grupo_ganancias_id => nil, :accounting_imputation_id => nil, :concepto_asociado_haber_id => nil, :concepto_asociado_retencion_id => nil, :concepto_asociado_haber_2_id => nil, :concepto_asociado_retencion_2_id => nil, :acumuladores_valor => "@haberescondescuento", :acumuladores_cantidad => "", :calculo_valor => "@dias_vacaciones_no_gozadas * (@mejor_remuneracion_habitual_anual / 25)", :calculo_cantidad => "@dias_vacaciones_no_gozadas", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(1)], :cantidad_en_recibo => nil, :company_id => id_company_new[ id_company_old.index(1)], :auxiliar => false)
id_remunerative_concept_old << 14
id_remunerative_concept_new << new_reg.id
new_reg=RemunerativeConcept.create!(:codigo => "605", :detalle => "SAC proporcional", :porcentual_asistencia => false, :prioridad_calculo => 1, :statistical_value => nil, :grupo_ganancias_id => nil, :accounting_imputation_id => nil, :concepto_asociado_haber_id => nil, :concepto_asociado_retencion_id => nil, :concepto_asociado_haber_2_id => nil, :concepto_asociado_retencion_2_id => nil, :acumuladores_valor => "@haberescondescuento", :acumuladores_cantidad => "", :calculo_valor => "(@mejor_remuneracion_habitual_anual / 360) * @dias_trabajados_semestre", :calculo_cantidad => "@dias_trabajados_semestre", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(1)], :cantidad_en_recibo => nil, :company_id => id_company_new[ id_company_old.index(1)], :auxiliar => false)
id_remunerative_concept_old << 15
id_remunerative_concept_new << new_reg.id
new_reg=RemunerativeConcept.create!(:codigo => "606", :detalle => "SAC sobre Vacaciones no Gozadas", :porcentual_asistencia => false, :prioridad_calculo => 2, :statistical_value => nil, :grupo_ganancias_id => nil, :accounting_imputation_id => nil, :concepto_asociado_haber_id => nil, :concepto_asociado_retencion_id => nil, :concepto_asociado_haber_2_id => nil, :concepto_asociado_retencion_2_id => nil, :acumuladores_valor => "@haberescondescuento", :acumuladores_cantidad => "", :calculo_valor => "(@mejor_remuneracion_habitual_anual / 360) * @dias_vacaciones_no_gozadas", :calculo_cantidad => "@dias_vacaciones_no_gozadas", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(1)], :cantidad_en_recibo => nil, :company_id => id_company_new[ id_company_old.index(1)], :auxiliar => false)
id_remunerative_concept_old << 16
id_remunerative_concept_new << new_reg.id
new_reg=RemunerativeConcept.create!(:codigo => "607", :detalle => "SAC sobre Preaviso", :porcentual_asistencia => false, :prioridad_calculo => 2, :statistical_value => nil, :grupo_ganancias_id => nil, :accounting_imputation_id => nil, :concepto_asociado_haber_id => nil, :concepto_asociado_retencion_id => nil, :concepto_asociado_haber_2_id => nil, :concepto_asociado_retencion_2_id => nil, :acumuladores_valor => "@haberescondescuento", :acumuladores_cantidad => "", :calculo_valor => "(@mejor_remuneracion_habitual_anual / 360) * @cantidad_indemnizacion_falta_preaviso", :calculo_cantidad => "@cantidad_indemnizacion_falta_preaviso", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(1)], :cantidad_en_recibo => nil, :company_id => id_company_new[ id_company_old.index(1)], :auxiliar => false)
id_remunerative_concept_old << 17
id_remunerative_concept_new << new_reg.id
new_reg=RemunerativeConcept.create!(:codigo => "608", :detalle => "SAC sobre Integracion del mes de despido", :porcentual_asistencia => false, :prioridad_calculo => 2, :statistical_value => nil, :grupo_ganancias_id => nil, :accounting_imputation_id => nil, :concepto_asociado_haber_id => nil, :concepto_asociado_retencion_id => nil, :concepto_asociado_haber_2_id => nil, :concepto_asociado_retencion_2_id => nil, :acumuladores_valor => "@haberescondescuento", :acumuladores_cantidad => "", :calculo_valor => "(@mejor_remuneracion_habitual_semestre / 360) * (30 - @dias_trabajados_mes)", :calculo_cantidad => "30 - @dias_trabajados_mes", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(1)], :cantidad_en_recibo => nil, :company_id => id_company_new[ id_company_old.index(1)], :auxiliar => false)
id_remunerative_concept_old << 18
id_remunerative_concept_new << new_reg.id
new_reg=RemunerativeConcept.create!(:codigo => "700", :detalle => "Adicional Personalizado", :porcentual_asistencia => false, :prioridad_calculo => nil, :statistical_value => nil, :grupo_ganancias_id => nil, :accounting_imputation_id => nil, :concepto_asociado_haber_id => nil, :concepto_asociado_retencion_id => nil, :concepto_asociado_haber_2_id => nil, :concepto_asociado_retencion_2_id => nil, :acumuladores_valor => "@haberessindescuento", :acumuladores_cantidad => "", :calculo_valor => "novedad_haber:importe ", :calculo_cantidad => "", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(3)], :cantidad_en_recibo => "", :company_id => id_company_new[ id_company_old.index(1)], :auxiliar => false)
id_remunerative_concept_old << 19
id_remunerative_concept_new << new_reg.id
new_reg=RemunerativeConcept.create!(:codigo => "a9", :detalle => "auxiliar", :porcentual_asistencia => false, :prioridad_calculo => 1, :statistical_value => nil, :grupo_ganancias_id => nil, :accounting_imputation_id => nil, :concepto_asociado_haber_id => nil, :concepto_asociado_retencion_id => nil, :concepto_asociado_haber_2_id => nil, :concepto_asociado_retencion_2_id => nil, :acumuladores_valor => "@basico", :acumuladores_cantidad => "", :calculo_valor => "2000", :calculo_cantidad => "", :data_to_ask_id => nil, :cantidad_en_recibo => "", :company_id => id_company_new[ id_company_old.index(1)], :auxiliar => true)
id_remunerative_concept_old << 20
id_remunerative_concept_new << new_reg.id
