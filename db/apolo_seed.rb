#encoding: utf-8
=begin
Execute:
  heroku console
  load Rails.root.join('db/apolo_seed.rb').to_s
=end

=begin
id_menu_old = []
id_menu_new = []
new_reg=Menu.create!(:parent_id => nil, :name => "Maestros", :link_url => "", :order_no => 1)
id_menu_old << [1]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Empleados", :link_url => "/employees", :order_no => 1)
id_menu_old << [2]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "liquidaciones", :link_url => "/liquidacions", :order_no => 2)
id_menu_old << [3]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Conceptos de liquidacion", :link_url => "?", :order_no => 3)
id_menu_old << [4]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Haberes", :link_url => "?", :order_no => 1)
id_menu_old << [5]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Grupo de Remuneraciones", :link_url => "/group_remunerations", :order_no => 2)
id_menu_old << [6]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Codigos", :link_url => "/remunerative_concepts", :order_no => 1)
id_menu_old << [7]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Retenciones", :link_url => "/retention_concepts", :order_no => 1)
id_menu_old << [8]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Retenciones", :link_url => "?", :order_no => 1)
id_menu_old << [9]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Aportes Patronales", :link_url => "?", :order_no => 1)
id_menu_old << [11]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Grupo de Aportes Patronales", :link_url => "/group_employer_contributions", :order_no => 3)
id_menu_old << [12]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Bancos", :link_url => "?", :order_no => 1)
id_menu_old << [14]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Bancos", :link_url => "/bank_deposits", :order_no => 1)
id_menu_old << [15]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Tipos de Cuentas", :link_url => "/bank_deposit_account_types", :order_no => 2)
id_menu_old << [16]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Tablas Varias", :link_url => "?", :order_no => 0)
id_menu_old << [17]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Ubicacion", :link_url => "?", :order_no => 1)
id_menu_old << [18]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Paises", :link_url => "/countries", :order_no => 1)
id_menu_old << [21]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Datos a Solicitar", :link_url => "/data_to_asks", :order_no => 1)
id_menu_old << [22]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Tipos de Documentos", :link_url => "document_types", :order_no => 1)
id_menu_old << [23]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Niveles de Educacion", :link_url => "/educational_levels", :order_no => 1)
id_menu_old << [24]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Tipo de Calle", :link_url => "/home_abouts", :order_no => 1)
id_menu_old << [25]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Lugares de emision de Documentos", :link_url => "/issueds", :order_no => 1)
id_menu_old << [26]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Localidades", :link_url => "/locations", :order_no => 1)
id_menu_old << [27]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Estados Civil", :link_url => "/marital_statuses", :order_no => 1)
id_menu_old << [28]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Nacionalidades", :link_url => "/nationalities", :order_no => 1)
id_menu_old << [29]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Lugares de Trabajo", :link_url => "/places", :order_no => 1)
id_menu_old << [30]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Provincias", :link_url => "/provinces", :order_no => 1)
id_menu_old << [31]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Cuentas Contables", :link_url => "/accounting_imputations", :order_no => 1)
id_menu_old << [36]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Obras Sociales", :link_url => "/health_insurances", :order_no => 1)
id_menu_old << [38]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Aseguradoras", :link_url => "/insurance_companies", :order_no => 1)
id_menu_old << [39]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Sindicatos", :link_url => "/labor_unions", :order_no => 1)
id_menu_old << [40]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "menus", :link_url => "/menus", :order_no => 99)
id_menu_old << [41]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Exportaciones", :link_url => "?", :order_no => 1)
id_menu_old << [42]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "SIJP", :link_url => "/sijp", :order_no => 1)
id_menu_old << [43]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Estadisticas", :link_url => "?", :order_no => 1)
id_menu_old << [44]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Centros de Costos", :link_url => "/centro_costos", :order_no => 1)
id_menu_old << [45]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Conceptos de liquidacion", :link_url => "?", :order_no => 1)
id_menu_old << [46]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Haberes", :link_url => "/estadistica_haberes", :order_no => 1)
id_menu_old << [47]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Retenciones", :link_url => "/retenciones", :order_no => 1)
id_menu_old << [48]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Empleados", :link_url => "?", :order_no => 1)
id_menu_old << [49]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Resumen de liquidaciones", :link_url => "/resumen_liquidaciones", :order_no => 1)
id_menu_old << [50]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Conceptos de liquidacion", :link_url => "/estaditica_empleado_concepto", :order_no => 1)
id_menu_old << [51]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Graficas", :link_url => "?", :order_no => 1)
id_menu_old << [52]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Liquidacion Automatica", :link_url => "?", :order_no => 1)
id_menu_old << [53]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Tipos de Documento Adjunto", :link_url => "/associated_document_types", :order_no => 1)
id_menu_old << [55]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Parentesco", :link_url => "/kinships", :order_no => 1)
id_menu_old << [56]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Tablas AFIP", :link_url => "?", :order_no => 1)
id_menu_old << [58]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Actividades", :link_url => "/sicoss_activities", :order_no => 1)
id_menu_old << [59]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Condicion", :link_url => "/sicoss_conditions", :order_no => 1)
id_menu_old << [60]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Modalidad de Contrato", :link_url => "/sicoss_contract_modes", :order_no => 1)
id_menu_old << [61]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Codigo de Siniestrado", :link_url => "/sicoss_damageds", :order_no => 1)
id_menu_old << [62]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Localidad", :link_url => "/sicoss_locations", :order_no => 1)
id_menu_old << [63]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Zona / Reduccion", :link_url => "/sicoss_reduction_zones", :order_no => 1)
id_menu_old << [64]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Tipo de Regimen", :link_url => "/sicoss_regimen_types", :order_no => 1)
id_menu_old << [65]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Situacion", :link_url => "/sicoss_situations", :order_no => 1)
id_menu_old << [67]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Tipo de Empleador", :link_url => "/sicoss_employer_types", :order_no => 1)
id_menu_old << [68]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Formato de Transferecia SiCOSS", :link_url => "/sicoss_formats", :order_no => 99)
id_menu_old << [69]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Complemento SICOSS Empresa", :link_url => "/sicoss_format_employers", :order_no => 77)
id_menu_old << [71]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Codigos", :link_url => "/employer_contribution_concepts", :order_no => 1)
id_menu_old << [13]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Consorcios", :link_url => "/consortia", :order_no => 99)
id_menu_old << [77]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Tipos de Recibos", :link_url => "/tipo_recibos", :order_no => 1)
id_menu_old << [35]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Grupo de retenciones", :link_url => "/group_retentions", :order_no => 1)
id_menu_old << [10]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Actividad", :link_url => "/activities", :order_no => 1)
id_menu_old << [57]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Causa de egreso", :link_url => "/causa_egresos", :order_no => 88)
id_menu_old << [70]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Tipos de Email", :link_url => "/email_types", :order_no => 85)
id_menu_old << [72]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Numeradores", :link_url => "/numeradors", :order_no => 99)
id_menu_old << [74]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Tipos de Remuneraciones", :link_url => "/remuneration_types", :order_no => 1)
id_menu_old << [32]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Modalidades de Contratacion", :link_url => "/contract_modes", :order_no => 1)
id_menu_old << [19]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Tablas de Contratacion", :link_url => "?", :order_no => 3)
id_menu_old << [75]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Centros de Costos", :link_url => "/cost_centers", :order_no => 1)
id_menu_old << [20]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Tareas", :link_url => "/tasks", :order_no => 1)
id_menu_old << [34]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Categorias", :link_url => "/categories", :order_no => 1)
id_menu_old << [37]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Secciones", :link_url => "/sections", :order_no => 1)
id_menu_old << [33]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Ocupacion", :link_url => "/employments", :order_no => 84)
id_menu_old << [73]
id_menu_new << [new_reg.id]
new_reg=Menu.create!(:parent_id => 1, :name => "Administradoras", :link_url => "/companies", :order_no => 98)
id_menu_old << [76]
id_menu_new << [new_reg.id]
id_country_old = []
id_country_new = []
new_reg=Country.create!(:detalle => "Argentina", :company_id => nil)
id_country_old << [1]
id_country_new << [new_reg.id]
new_reg=Country.create!(:detalle => "Italia", :company_id => nil)
id_country_old << [2]
id_country_new << [new_reg.id]
new_reg=Country.create!(:detalle => "España", :company_id => nil)
id_country_old << [3]
id_country_new << [new_reg.id]
new_reg=Country.create!(:detalle => "Uruguay", :company_id => nil)
id_country_old << [4]
id_country_new << [new_reg.id]
new_reg=Country.create!(:detalle => "Mi Pais", :company_id => nil)
id_country_old << [5]
id_country_new << [new_reg.id]
id_province_old = []
id_province_new = []
new_reg=Province.create!(:detalle => "Buenos Aires", :company_id => nil)
id_province_old << [1]
id_province_new << [new_reg.id]
new_reg=Province.create!(:detalle => "Santa Fé", :company_id => nil)
id_province_old << [2]
id_province_new << [new_reg.id]
new_reg=Province.create!(:detalle => "Cordoba", :company_id => nil)
id_province_old << [3]
id_province_new << [new_reg.id]
new_reg=Province.create!(:detalle => "Mi Provincia", :company_id => nil)
id_province_old << [4]
id_province_new << [new_reg.id]
id_company_old = []
id_company_new = []
new_reg=Company.create!(:name => "Pepsi", :code => nil, :razon_social => nil, :calle => nil, :altura => nil, :codigo_postal => nil, :location_id => nil, :province_id => nil, :latitude => nil, :longitude => nil, :telefono => nil, :contacto => nil, :email => nil, :cuit => nil, :numero_inscripcion => nil, :caja => nil, :ultima_hoja_libro => nil, :imprimir_hasta_hoja_libro => nil, :observaciones => nil)
id_company_old << [2]
id_company_new << [new_reg.id]
new_reg=Company.create!(:name => "Coca Cola", :code => "koke", :razon_social => "The Coca-Cola Company", :calle => "Helguera", :altura => "4847", :codigo_postal => "1419", :location_id => nil, :province_id => id_province_new[ id_province_old.index(1)], :latitude => nil, :longitude => nil, :telefono => "4573-4409", :contacto => "pablo", :email => "esta@pro.com", :cuit => "30-1234567-1", :numero_inscripcion => "no tiene", :caja => "industria", :ultima_hoja_libro => 1, :imprimir_hasta_hoja_libro => 100, :observaciones => sfdfd)
id_company_old << [1]
id_company_new << [new_reg.id]
=end

id_company_old = []
id_company_new = []
id_company_old << [1]
id_company_new << [Company.find(1).id]

Location.delete_all()

id_location_old = []
id_location_new = []
new_reg=Location.create!(:detalle => "Capital Federal", :company_id => Company.find(1).id)
id_location_old << [1]
id_location_new << [new_reg.id]
new_reg=Location.create!(:detalle => "La Plata", :company_id => Company.find(1).id)
id_location_old << [2]
id_location_new << [new_reg.id]
new_reg=Location.create!(:detalle => "San Martin", :company_id => Company.find(1).id)
id_location_old << [3]
id_location_new << [new_reg.id]
new_reg=Location.create!(:detalle => "San Isidro", :company_id => Company.find(1).id)
id_location_old << [4]
id_location_new << [new_reg.id]
new_reg=Location.create!(:detalle => "Mi Localidad", :company_id => Company.find(1).id)
id_location_old << [5]
id_location_new << [new_reg.id]

=begin
id_province_old = []
id_province_new = []
new_reg=Province.create!(:detalle => "Buenos Aires", :company_id => Company.find(1).id)
id_province_old << [1]
id_province_new << [new_reg.id]
new_reg=Province.create!(:detalle => "Santa Fé", :company_id => Company.find(1).id)
id_province_old << [2]
id_province_new << [new_reg.id]
new_reg=Province.create!(:detalle => "Cordoba", :company_id => Company.find(1).id)
id_province_old << [3]
id_province_new << [new_reg.id]
new_reg=Province.create!(:detalle => "Mi Provincia", :company_id => Company.find(1).id)
id_province_old << [4]
id_province_new << [new_reg.id]
=end

id_group_remuneration_old = []
id_group_remuneration_new = []
new_reg=GroupRemuneration.create!(:detalle => "enfermeros", :company_id => Company.find(1).id)
id_group_remuneration_old << [1]
id_group_remuneration_new << [new_reg.id]
new_reg=GroupRemuneration.create!(:detalle => "DETALLE1", :company_id => Company.find(1).id)
id_group_remuneration_old << [2]
id_group_remuneration_new << [new_reg.id]
new_reg=GroupRemuneration.create!(:detalle => "Sueldo * Hs * extras * asistencia", :company_id => Company.find(1).id)
id_group_remuneration_old << [3]
id_group_remuneration_new << [new_reg.id]
id_group_retention_old = []
id_group_retention_new = []
new_reg=GroupRetention.create!(:detalle => "Osde", :company_id => Company.find(1).id)
id_group_retention_old << [1]
id_group_retention_new << [new_reg.id]
new_reg=GroupRetention.create!(:detalle => "UOM", :company_id => Company.find(1).id)
id_group_retention_old << [2]
id_group_retention_new << [new_reg.id]
new_reg=GroupRetention.create!(:detalle => "UOCRA", :company_id => Company.find(1).id)
id_group_retention_old << [3]
id_group_retention_new << [new_reg.id]

AccountingImputation.delete_all()

id_accounting_imputation_old = []
id_accounting_imputation_new = []
new_reg=AccountingImputation.create!(:detalle => "sueldos pabellon 1", :company_id => Company.find(1).id)
id_accounting_imputation_old << [1]
id_accounting_imputation_new << [new_reg.id]
new_reg=AccountingImputation.create!(:detalle => "Sueldos Administracion", :company_id => Company.find(1).id)
id_accounting_imputation_old << [2]
id_accounting_imputation_new << [new_reg.id]
new_reg=AccountingImputation.create!(:detalle => "otra mas", :company_id => Company.find(1).id)
id_accounting_imputation_old << [4]
id_accounting_imputation_new << [new_reg.id]
new_reg=AccountingImputation.create!(:detalle => "Mi Cuenta Contable", :company_id => Company.find(1).id)
id_accounting_imputation_old << [5]
id_accounting_imputation_new << [new_reg.id]

id_data_to_ask_old = []
id_data_to_ask_new = []
new_reg=DataToAsk.create!(:detalle => "Ninguno", :cantidad => false, :importe => false, :company_id => Company.find(1).id)
id_data_to_ask_old << [1]
id_data_to_ask_new << [new_reg.id]
new_reg=DataToAsk.create!(:detalle => "Cantidad", :cantidad => true, :importe => false, :company_id => Company.find(1).id)
id_data_to_ask_old << [2]
id_data_to_ask_new << [new_reg.id]
new_reg=DataToAsk.create!(:detalle => "Importe", :cantidad => false, :importe => true, :company_id => Company.find(1).id)
id_data_to_ask_old << [3]
id_data_to_ask_new << [new_reg.id]
new_reg=DataToAsk.create!(:detalle => "Cantidad e Importe", :cantidad => true, :importe => true, :company_id => Company.find(1).id)
id_data_to_ask_old << [4]
id_data_to_ask_new << [new_reg.id]
new_reg=DataToAsk.create!(:detalle => "Mi Dato (no se a que se refiere)", :cantidad => true, :importe => true, :company_id => Company.find(1).id)
id_data_to_ask_old << [5]
id_data_to_ask_new << [new_reg.id]
id_category_old = []

Category.delete_all()

id_category_new = []
new_reg=Category.create!(:detalle => "Administrativo", :importe => 6000.0, :company_id => Company.find(1).id, :horas => 200.0, :codigo => "ADM")
id_category_old << [1]
id_category_new << [new_reg.id]
new_reg=Category.create!(:detalle => "Mi Categoria", :importe => 12000.0, :company_id => Company.find(1).id, :horas => 200.0, :codigo => "c3")
id_category_old << [4]
id_category_new << [new_reg.id]
new_reg=Category.create!(:detalle => "Director", :importe => 12000.0, :company_id => Company.find(1).id, :horas => 200.0, :codigo => "dr")
id_category_old << [2]
id_category_new << [new_reg.id]
new_reg=Category.create!(:detalle => "Enfermero", :importe => 3000.0, :company_id => Company.find(1).id, :horas => 180.0, :codigo => "enf")
id_category_old << [3]
id_category_new << [new_reg.id]

id_retention_concept_old = []
id_retention_concept_new = []
new_reg=RetentionConcept.create!(:codigo => "002", :detalle => "Obra Social", :statistical_value => nil, :accounting_imputation_id => nil, :prioridad => nil, :formula_calculo_valor => "0.03 * @haberescondescuento", :acumuladores_valor => "@retenciones", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(1)], :company_id => Company.find(1).id, :auxiliar => false)
id_retention_concept_old << [2]
id_retention_concept_new << [new_reg.id]
new_reg=RetentionConcept.create!(:codigo => "003", :detalle => "importe", :statistical_value => nil, :accounting_imputation_id => nil, :prioridad => nil, :formula_calculo_valor => "@haberescondescuento * 0.02", :acumuladores_valor => "@retenciones", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(3)], :company_id => Company.find(1).id, :auxiliar => false)
id_retention_concept_old << [3]
id_retention_concept_new << [new_reg.id]
new_reg=RetentionConcept.create!(:codigo => "004", :detalle => "cantidad e importe", :statistical_value => nil, :accounting_imputation_id => nil, :prioridad => nil, :formula_calculo_valor => "importe *  cantidad", :acumuladores_valor => "@retenciones", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(4)], :company_id => Company.find(1).id, :auxiliar => false)
id_retention_concept_old << [4]
id_retention_concept_new << [new_reg.id]
new_reg=RetentionConcept.create!(:codigo => "888", :detalle => "Adicional Obra Social", :statistical_value => 1, :accounting_imputation_id => id_accounting_imputation_new[ id_accounting_imputation_old.index(4)], :prioridad => 99, :formula_calculo_valor => "1", :acumuladores_valor => "1", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(1)], :company_id => Company.find(1).id, :auxiliar => false)
id_retention_concept_old << [5]
id_retention_concept_new << [new_reg.id]
new_reg=RetentionConcept.create!(:codigo => "001", :detalle => "Jubilacion", :statistical_value => 1, :accounting_imputation_id => nil, :prioridad => 1, :formula_calculo_valor => "@haberescondescuento * 0.11", :acumuladores_valor => "@retenciones", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(1)], :company_id => Company.find(1).id, :auxiliar => false)
id_retention_concept_old << [1]
id_retention_concept_new << [new_reg.id]

id_remunerative_concept_old = []
id_remunerative_concept_new = []
new_reg=RemunerativeConcept.create!(:codigo => "004", :detalle => "premio asistencia", :porcentual_asistencia => false, :prioridad_calculo => 2, :statistical_value => nil, :grupo_ganancias_id => nil, :accounting_imputation_id => nil, :concepto_asociado_haber_id => nil, :concepto_asociado_retencion_id => nil, :concepto_asociado_haber_2_id => nil, :concepto_asociado_retencion_2_id => nil, :acumuladores_valor => "@basico @haberescondescuento", :acumuladores_cantidad => "", :calculo_valor => " @basico * 0.2", :calculo_cantidad => "", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(1)], :cantidad_en_recibo => nil, :company_id => Company.find(1).id, :auxiliar => false)
id_remunerative_concept_old << [4]
id_remunerative_concept_new << [new_reg.id]
new_reg=RemunerativeConcept.create!(:codigo => "603", :detalle => "Proporcional del mes trabajado", :porcentual_asistencia => false, :prioridad_calculo => 1, :statistical_value => nil, :grupo_ganancias_id => nil, :accounting_imputation_id => nil, :concepto_asociado_haber_id => nil, :concepto_asociado_retencion_id => nil, :concepto_asociado_haber_2_id => nil, :concepto_asociado_retencion_2_id => nil, :acumuladores_valor => "@haberescondescuento", :acumuladores_cantidad => "", :calculo_valor => "(@mejor_remuneracion_habitual_anual / 30) * (30 - @dias_trabajados_mes)", :calculo_cantidad => "30 - @dias_trabajados_mes", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(1)], :cantidad_en_recibo => nil, :company_id => Company.find(1).id, :auxiliar => false)
id_remunerative_concept_old << [13]
id_remunerative_concept_new << [new_reg.id]
new_reg=RemunerativeConcept.create!(:codigo => "605", :detalle => "SAC proporcional", :porcentual_asistencia => false, :prioridad_calculo => 1, :statistical_value => nil, :grupo_ganancias_id => nil, :accounting_imputation_id => nil, :concepto_asociado_haber_id => nil, :concepto_asociado_retencion_id => nil, :concepto_asociado_haber_2_id => nil, :concepto_asociado_retencion_2_id => nil, :acumuladores_valor => "@haberescondescuento", :acumuladores_cantidad => "", :calculo_valor => "(@mejor_remuneracion_habitual_anual / 360) * @dias_trabajados_semestre", :calculo_cantidad => "@dias_trabajados_semestre", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(1)], :cantidad_en_recibo => nil, :company_id => Company.find(1).id, :auxiliar => false)
id_remunerative_concept_old << [15]
id_remunerative_concept_new << [new_reg.id]
new_reg=RemunerativeConcept.create!(:codigo => "606", :detalle => "SAC sobre Vacaciones no Gozadas", :porcentual_asistencia => false, :prioridad_calculo => 2, :statistical_value => nil, :grupo_ganancias_id => nil, :accounting_imputation_id => nil, :concepto_asociado_haber_id => nil, :concepto_asociado_retencion_id => nil, :concepto_asociado_haber_2_id => nil, :concepto_asociado_retencion_2_id => nil, :acumuladores_valor => "@haberescondescuento", :acumuladores_cantidad => "", :calculo_valor => "(@mejor_remuneracion_habitual_anual / 360) * @dias_vacaciones_no_gozadas", :calculo_cantidad => "@dias_vacaciones_no_gozadas", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(1)], :cantidad_en_recibo => nil, :company_id => Company.find(1).id, :auxiliar => false)
id_remunerative_concept_old << [16]
id_remunerative_concept_new << [new_reg.id]
new_reg=RemunerativeConcept.create!(:codigo => "607", :detalle => "SAC sobre Preaviso", :porcentual_asistencia => false, :prioridad_calculo => 2, :statistical_value => nil, :grupo_ganancias_id => nil, :accounting_imputation_id => nil, :concepto_asociado_haber_id => nil, :concepto_asociado_retencion_id => nil, :concepto_asociado_haber_2_id => nil, :concepto_asociado_retencion_2_id => nil, :acumuladores_valor => "@haberescondescuento", :acumuladores_cantidad => "", :calculo_valor => "(@mejor_remuneracion_habitual_anual / 360) * @cantidad_indemnizacion_falta_preaviso", :calculo_cantidad => "@cantidad_indemnizacion_falta_preaviso", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(1)], :cantidad_en_recibo => nil, :company_id => Company.find(1).id, :auxiliar => false)
id_remunerative_concept_old << [17]
id_remunerative_concept_new << [new_reg.id]
new_reg=RemunerativeConcept.create!(:codigo => "608", :detalle => "SAC sobre Integracion del mes de despido", :porcentual_asistencia => false, :prioridad_calculo => 2, :statistical_value => nil, :grupo_ganancias_id => nil, :accounting_imputation_id => nil, :concepto_asociado_haber_id => nil, :concepto_asociado_retencion_id => nil, :concepto_asociado_haber_2_id => nil, :concepto_asociado_retencion_2_id => nil, :acumuladores_valor => "@haberescondescuento", :acumuladores_cantidad => "", :calculo_valor => "(@mejor_remuneracion_habitual_semestre / 360) * (30 - @dias_trabajados_mes)", :calculo_cantidad => "30 - @dias_trabajados_mes", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(1)], :cantidad_en_recibo => nil, :company_id => Company.find(1).id, :auxiliar => false)
id_remunerative_concept_old << [18]
id_remunerative_concept_new << [new_reg.id]
new_reg=RemunerativeConcept.create!(:codigo => "005", :detalle => "Antiguedad", :porcentual_asistencia => false, :prioridad_calculo => 1, :statistical_value => nil, :grupo_ganancias_id => nil, :accounting_imputation_id => nil, :concepto_asociado_haber_id => nil, :concepto_asociado_retencion_id => nil, :concepto_asociado_haber_2_id => nil, :concepto_asociado_retencion_2_id => nil, :acumuladores_valor => " @haberescondescuento", :acumuladores_cantidad => "", :calculo_valor => "@antiguedad * 69.06", :calculo_cantidad => "@antiguedad", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(1)], :cantidad_en_recibo => "", :company_id => Company.find(1).id, :auxiliar => false)
id_remunerative_concept_old << [5]
id_remunerative_concept_new << [new_reg.id]
new_reg=RemunerativeConcept.create!(:codigo => "162", :detalle => "Hotas Extras al 100% Sabados", :porcentual_asistencia => false, :prioridad_calculo => 20, :statistical_value => nil, :grupo_ganancias_id => nil, :accounting_imputation_id => nil, :concepto_asociado_haber_id => nil, :concepto_asociado_retencion_id => nil, :concepto_asociado_haber_2_id => nil, :concepto_asociado_retencion_2_id => nil, :acumuladores_valor => "@haberescondescuento", :acumuladores_cantidad => "", :calculo_valor => "(@haberesparaextras / 200) * 2 * novedad_haber:cantidad", :calculo_cantidad => "novedad_haber:cantidad", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(2)], :cantidad_en_recibo => "novedad_haber:cantidad", :company_id => Company.find(1).id, :auxiliar => false)
id_remunerative_concept_old << [36]
id_remunerative_concept_new << [new_reg.id]
new_reg=RemunerativeConcept.create!(:codigo => "110", :detalle => "Dia Feriado Nacional", :porcentual_asistencia => false, :prioridad_calculo => 20, :statistical_value => nil, :grupo_ganancias_id => nil, :accounting_imputation_id => nil, :concepto_asociado_haber_id => nil, :concepto_asociado_retencion_id => nil, :concepto_asociado_haber_2_id => nil, :concepto_asociado_retencion_2_id => nil, :acumuladores_valor => "@haberescondescuento", :acumuladores_cantidad => "", :calculo_valor => "novedad_haber:cantidad * 153.72", :calculo_cantidad => "novedad_haber:cantidd", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(2)], :cantidad_en_recibo => "novedad_haber:cantidad", :company_id => Company.find(1).id, :auxiliar => false)
id_remunerative_concept_old << [34]
id_remunerative_concept_new << [new_reg.id]
new_reg=RemunerativeConcept.create!(:codigo => "150", :detalle => "Dias Vacaciones", :porcentual_asistencia => false, :prioridad_calculo => 30, :statistical_value => nil, :grupo_ganancias_id => nil, :accounting_imputation_id => nil, :concepto_asociado_haber_id => nil, :concepto_asociado_retencion_id => nil, :concepto_asociado_haber_2_id => nil, :concepto_asociado_retencion_2_id => nil, :acumuladores_valor => "@haberescondescuento", :acumuladores_cantidad => "", :calculo_valor => "( @haberescondescuento / 25) * novedad_haber:cantidad", :calculo_cantidad => "novedad_haber:cantidad", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(2)], :cantidad_en_recibo => "novedad_haber:cantidad", :company_id => Company.find(1).id, :auxiliar => false)
id_remunerative_concept_old << [41]
id_remunerative_concept_new << [new_reg.id]
new_reg=RemunerativeConcept.create!(:codigo => "601", :detalle => "Preaviso", :porcentual_asistencia => false, :prioridad_calculo => 90, :statistical_value => nil, :grupo_ganancias_id => nil, :accounting_imputation_id => nil, :concepto_asociado_haber_id => nil, :concepto_asociado_retencion_id => nil, :concepto_asociado_haber_2_id => nil, :concepto_asociado_retencion_2_id => nil, :acumuladores_valor => "@haberessindescuento", :acumuladores_cantidad => "", :calculo_valor => "novedad_haber:cantidad *  @mejor_remuneracion_habitual_anual", :calculo_cantidad => "novedad_haber:cantidad", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(2)], :cantidad_en_recibo => "novedad_haber:cantidad", :company_id => Company.find(1).id, :auxiliar => false)
id_remunerative_concept_old << [11]
id_remunerative_concept_new << [new_reg.id]
new_reg=RemunerativeConcept.create!(:codigo => "401", :detalle => "Aguinaldo", :porcentual_asistencia => false, :prioridad_calculo => 99, :statistical_value => nil, :grupo_ganancias_id => nil, :accounting_imputation_id => nil, :concepto_asociado_haber_id => nil, :concepto_asociado_retencion_id => nil, :concepto_asociado_haber_2_id => nil, :concepto_asociado_retencion_2_id => nil, :acumuladores_valor => "@haberescondescuento", :acumuladores_cantidad => "", :calculo_valor => "@mejor_remuneracion_semestre / 180 * @dias_trabajados_semestre", :calculo_cantidad => "@dias_trabajados_semestre", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(1)], :cantidad_en_recibo => "", :company_id => Company.find(1).id, :auxiliar => false)
id_remunerative_concept_old << [7]
id_remunerative_concept_new << [new_reg.id]
new_reg=RemunerativeConcept.create!(:codigo => "605", :detalle => "Indemnizacion por despido ", :porcentual_asistencia => false, :prioridad_calculo => 90, :statistical_value => nil, :grupo_ganancias_id => nil, :accounting_imputation_id => nil, :concepto_asociado_haber_id => nil, :concepto_asociado_retencion_id => nil, :concepto_asociado_haber_2_id => nil, :concepto_asociado_retencion_2_id => nil, :acumuladores_valor => "@haberescondescuento", :acumuladores_cantidad => "", :calculo_valor => "@cantidad_sueldos_indemnizacion_despido *  @mejor_remuneracion_habitual_anual", :calculo_cantidad => "@cantidad_sueldos_indemnizacion_despido", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(1)], :cantidad_en_recibo => "", :company_id => Company.find(1).id, :auxiliar => false)
id_remunerative_concept_old << [10]
id_remunerative_concept_new << [new_reg.id]
new_reg=RemunerativeConcept.create!(:codigo => "600", :detalle => "Integracion mes despido", :porcentual_asistencia => false, :prioridad_calculo => 1, :statistical_value => nil, :grupo_ganancias_id => nil, :accounting_imputation_id => nil, :concepto_asociado_haber_id => nil, :concepto_asociado_retencion_id => nil, :concepto_asociado_haber_2_id => nil, :concepto_asociado_retencion_2_id => nil, :acumuladores_valor => "@haberessindecuentos", :acumuladores_cantidad => "", :calculo_valor => "(@mejor_remuneracion_habitual_anual / 30) * @dias_trabajados_mes", :calculo_cantidad => "@dias_trabajados_mes", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(1)], :cantidad_en_recibo => "", :company_id => Company.find(1).id, :auxiliar => false)
id_remunerative_concept_old << [12]
id_remunerative_concept_new << [new_reg.id]
new_reg=RemunerativeConcept.create!(:codigo => "610", :detalle => "Vacaciones no Gozadas", :porcentual_asistencia => false, :prioridad_calculo => 1, :statistical_value => nil, :grupo_ganancias_id => nil, :accounting_imputation_id => nil, :concepto_asociado_haber_id => nil, :concepto_asociado_retencion_id => nil, :concepto_asociado_haber_2_id => nil, :concepto_asociado_retencion_2_id => nil, :acumuladores_valor => "@haberessindescuento", :acumuladores_cantidad => "", :calculo_valor => "@dias_vacaciones_no_gozadas * (@mejor_remuneracion_habitual_anual / 25)", :calculo_cantidad => "@dias_vacaciones_no_gozadas", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(1)], :cantidad_en_recibo => "", :company_id => Company.find(1).id, :auxiliar => false)
id_remunerative_concept_old << [14]
id_remunerative_concept_new << [new_reg.id]
new_reg=RemunerativeConcept.create!(:codigo => "007", :detalle => "que es este codigo¿", :porcentual_asistencia => false, :prioridad_calculo => 1, :statistical_value => nil, :grupo_ganancias_id => nil, :accounting_imputation_id => nil, :concepto_asociado_haber_id => nil, :concepto_asociado_retencion_id => nil, :concepto_asociado_haber_2_id => nil, :concepto_asociado_retencion_2_id => nil, :acumuladores_valor => "@haberescondescuento", :acumuladores_cantidad => "", :calculo_valor => "novedad_haber:importe", :calculo_cantidad => "novedad_haber:cantidad", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(2)], :cantidad_en_recibo => "novedad_haber:cantidad", :company_id => Company.find(1).id, :auxiliar => false)
id_remunerative_concept_old << [22]
id_remunerative_concept_new << [new_reg.id]
new_reg=RemunerativeConcept.create!(:codigo => "001", :detalle => "Sueldo Basico", :porcentual_asistencia => false, :prioridad_calculo => 1, :statistical_value => 1, :grupo_ganancias_id => nil, :accounting_imputation_id => nil, :concepto_asociado_haber_id => nil, :concepto_asociado_retencion_id => nil, :concepto_asociado_haber_2_id => nil, :concepto_asociado_retencion_2_id => nil, :acumuladores_valor => "@basico   @haberescondescuento @remuneracion_habitual", :acumuladores_cantidad => "", :calculo_valor => "@sueldo", :calculo_cantidad => "1", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(1)], :cantidad_en_recibo => "", :company_id => Company.find(1).id, :auxiliar => false)
id_remunerative_concept_old << [1]
id_remunerative_concept_new << [new_reg.id]
new_reg=RemunerativeConcept.create!(:codigo => "115", :detalle => "Horas Feriados Nacionales", :porcentual_asistencia => false, :prioridad_calculo => 20, :statistical_value => nil, :grupo_ganancias_id => nil, :accounting_imputation_id => nil, :concepto_asociado_haber_id => nil, :concepto_asociado_retencion_id => nil, :concepto_asociado_haber_2_id => nil, :concepto_asociado_retencion_2_id => nil, :acumuladores_valor => "@haberescondescuento", :acumuladores_cantidad => "", :calculo_valor => "(@haberesparaextras / 200) * 2 * novedad_haber:cantidad", :calculo_cantidad => "novedad_haber:cantidad", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(2)], :cantidad_en_recibo => "novedad_haber:cantidad", :company_id => Company.find(1).id, :auxiliar => false)
id_remunerative_concept_old << [35]
id_remunerative_concept_new << [new_reg.id]
new_reg=RemunerativeConcept.create!(:codigo => "163", :detalle => "Hotas Extras al 100% Domingos", :porcentual_asistencia => false, :prioridad_calculo => 20, :statistical_value => nil, :grupo_ganancias_id => nil, :accounting_imputation_id => nil, :concepto_asociado_haber_id => nil, :concepto_asociado_retencion_id => nil, :concepto_asociado_haber_2_id => nil, :concepto_asociado_retencion_2_id => nil, :acumuladores_valor => "@haberescondescuento", :acumuladores_cantidad => "", :calculo_valor => "(@haberesparaextras / 200) * 2 * novedad_haber:cantidad", :calculo_cantidad => "novedad_haber:cantidad", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(2)], :cantidad_en_recibo => "novedad_haber:cantidad", :company_id => Company.find(1).id, :auxiliar => false)
id_remunerative_concept_old << [37]
id_remunerative_concept_new << [new_reg.id]
new_reg=RemunerativeConcept.create!(:codigo => "015", :detalle => "Adicional", :porcentual_asistencia => false, :prioridad_calculo => 1, :statistical_value => nil, :grupo_ganancias_id => nil, :accounting_imputation_id => nil, :concepto_asociado_haber_id => nil, :concepto_asociado_retencion_id => nil, :concepto_asociado_haber_2_id => nil, :concepto_asociado_retencion_2_id => nil, :acumuladores_valor => "@haberescondescuento", :acumuladores_cantidad => "", :calculo_valor => "novedad_haber:importe ", :calculo_cantidad => "", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(3)], :cantidad_en_recibo => "", :company_id => Company.find(1).id, :auxiliar => false)
id_remunerative_concept_old << [20]
id_remunerative_concept_new << [new_reg.id]
new_reg=RemunerativeConcept.create!(:codigo => "499", :detalle => "Dias Vacaciones", :porcentual_asistencia => false, :prioridad_calculo => 0, :statistical_value => nil, :grupo_ganancias_id => nil, :accounting_imputation_id => nil, :concepto_asociado_haber_id => nil, :concepto_asociado_retencion_id => nil, :concepto_asociado_haber_2_id => nil, :concepto_asociado_retencion_2_id => nil, :acumuladores_valor => "@basico @haberescondescuento", :acumuladores_cantidad => "", :calculo_valor => "@sueldo / 25 * novedad_haber:cantidad", :calculo_cantidad => "@dias_vacaciones", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(2)], :cantidad_en_recibo => "", :company_id => Company.find(1).id, :auxiliar => false)
id_remunerative_concept_old << [8]
id_remunerative_concept_new << [new_reg.id]
new_reg=RemunerativeConcept.create!(:codigo => "700", :detalle => "Adicional Personalizado", :porcentual_asistencia => false, :prioridad_calculo => nil, :statistical_value => nil, :grupo_ganancias_id => nil, :accounting_imputation_id => nil, :concepto_asociado_haber_id => nil, :concepto_asociado_retencion_id => nil, :concepto_asociado_haber_2_id => nil, :concepto_asociado_retencion_2_id => nil, :acumuladores_valor => "@haberessindescuento", :acumuladores_cantidad => "", :calculo_valor => "novedad_haber:importe ", :calculo_cantidad => "", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(3)], :cantidad_en_recibo => "", :company_id => Company.find(1).id, :auxiliar => false)
id_remunerative_concept_old << [19]
id_remunerative_concept_new << [new_reg.id]
new_reg=RemunerativeConcept.create!(:codigo => "010", :detalle => "Plus Retiro de Residuos", :porcentual_asistencia => false, :prioridad_calculo => 1, :statistical_value => nil, :grupo_ganancias_id => nil, :accounting_imputation_id => nil, :concepto_asociado_haber_id => nil, :concepto_asociado_retencion_id => nil, :concepto_asociado_haber_2_id => nil, :concepto_asociado_retencion_2_id => nil, :acumuladores_valor => "@haberescondescuento", :acumuladores_cantidad => "", :calculo_valor => "novedad_haber:cantidad * 6.29", :calculo_cantidad => "novedad_haber:cantidad", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(2)], :cantidad_en_recibo => "novedad_haber:cantidad", :company_id => Company.find(1).id, :auxiliar => false)
id_remunerative_concept_old << [23]
id_remunerative_concept_new << [new_reg.id]
new_reg=RemunerativeConcept.create!(:codigo => "011", :detalle => "Plus Mantenimiento Jardin", :porcentual_asistencia => false, :prioridad_calculo => 1, :statistical_value => nil, :grupo_ganancias_id => nil, :accounting_imputation_id => nil, :concepto_asociado_haber_id => nil, :concepto_asociado_retencion_id => nil, :concepto_asociado_haber_2_id => nil, :concepto_asociado_retencion_2_id => nil, :acumuladores_valor => "@haberescondescuento", :acumuladores_cantidad => "", :calculo_valor => "novedad_haber:cantidad * 85.95", :calculo_cantidad => "novedad_haber:cantidad", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(2)], :cantidad_en_recibo => "novedad_haber:cantidad", :company_id => Company.find(1).id, :auxiliar => false)
id_remunerative_concept_old << [24]
id_remunerative_concept_new << [new_reg.id]
new_reg=RemunerativeConcept.create!(:codigo => "012", :detalle => "Plus Limpieza Cocheras", :porcentual_asistencia => false, :prioridad_calculo => 1, :statistical_value => nil, :grupo_ganancias_id => nil, :accounting_imputation_id => nil, :concepto_asociado_haber_id => nil, :concepto_asociado_retencion_id => nil, :concepto_asociado_haber_2_id => nil, :concepto_asociado_retencion_2_id => nil, :acumuladores_valor => "@haberescondescuento", :acumuladores_cantidad => "", :calculo_valor => "novedad_haber:cantidad * 85.95", :calculo_cantidad => "novedad_haber:cantidad", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(2)], :cantidad_en_recibo => "novedad_haber:cantidad", :company_id => Company.find(1).id, :auxiliar => false)
id_remunerative_concept_old << [25]
id_remunerative_concept_new << [new_reg.id]
new_reg=RemunerativeConcept.create!(:codigo => "006", :detalle => "Valor Vivienda", :porcentual_asistencia => false, :prioridad_calculo => 1, :statistical_value => nil, :grupo_ganancias_id => nil, :accounting_imputation_id => nil, :concepto_asociado_haber_id => nil, :concepto_asociado_retencion_id => nil, :concepto_asociado_haber_2_id => nil, :concepto_asociado_retencion_2_id => nil, :acumuladores_valor => "@haberescondescuento", :acumuladores_cantidad => "novedad_haber:cantidad", :calculo_valor => "novedad_haber:cantidad * 23.14", :calculo_cantidad => "novedad_haber:cantidad", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(2)], :cantidad_en_recibo => "", :company_id => Company.find(1).id, :auxiliar => false)
id_remunerative_concept_old << [26]
id_remunerative_concept_new << [new_reg.id]
new_reg=RemunerativeConcept.create!(:codigo => "015", :detalle => "Plus Movimientos de Coches", :porcentual_asistencia => false, :prioridad_calculo => 1, :statistical_value => nil, :grupo_ganancias_id => nil, :accounting_imputation_id => nil, :concepto_asociado_haber_id => nil, :concepto_asociado_retencion_id => nil, :concepto_asociado_haber_2_id => nil, :concepto_asociado_retencion_2_id => nil, :acumuladores_valor => "@haberescondescuento", :acumuladores_cantidad => "", :calculo_valor => "novedad_haber:cantidad * 127.28", :calculo_cantidad => "novedad_haber:cantidad", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(2)], :cantidad_en_recibo => "novedad_haber:cantidad", :company_id => Company.find(1).id, :auxiliar => false)
id_remunerative_concept_old << [27]
id_remunerative_concept_new << [new_reg.id]
new_reg=RemunerativeConcept.create!(:codigo => "101", :detalle => "Dias Inasistencia", :porcentual_asistencia => false, :prioridad_calculo => 10, :statistical_value => nil, :grupo_ganancias_id => nil, :accounting_imputation_id => nil, :concepto_asociado_haber_id => nil, :concepto_asociado_retencion_id => nil, :concepto_asociado_haber_2_id => nil, :concepto_asociado_retencion_2_id => nil, :acumuladores_valor => "@haberescondescuento", :acumuladores_cantidad => "novedad_haber:cantidad", :calculo_valor => "(@haberescondescuento / 30) * novedad_haber:cantidad * -1", :calculo_cantidad => "novedad_haber:cantidad", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(2)], :cantidad_en_recibo => "novedad_haber:cantidad", :company_id => Company.find(1).id, :auxiliar => false)
id_remunerative_concept_old << [28]
id_remunerative_concept_new << [new_reg.id]
new_reg=RemunerativeConcept.create!(:codigo => "120", :detalle => "Dias de suplencia", :porcentual_asistencia => false, :prioridad_calculo => 20, :statistical_value => nil, :grupo_ganancias_id => nil, :accounting_imputation_id => nil, :concepto_asociado_haber_id => nil, :concepto_asociado_retencion_id => nil, :concepto_asociado_haber_2_id => nil, :concepto_asociado_retencion_2_id => nil, :acumuladores_valor => "@haberescondescuento", :acumuladores_cantidad => "", :calculo_valor => "novedad_haber:cantidad * 153.72", :calculo_cantidad => "novedad_haber:cantidad", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(2)], :cantidad_en_recibo => "novedad_haber:cantidad", :company_id => Company.find(1).id, :auxiliar => false)
id_remunerative_concept_old << [29]
id_remunerative_concept_new << [new_reg.id]
new_reg=RemunerativeConcept.create!(:codigo => "123", :detalle => "Dias de suplencia al 100%", :porcentual_asistencia => false, :prioridad_calculo => 20, :statistical_value => nil, :grupo_ganancias_id => nil, :accounting_imputation_id => nil, :concepto_asociado_haber_id => nil, :concepto_asociado_retencion_id => nil, :concepto_asociado_haber_2_id => nil, :concepto_asociado_retencion_2_id => nil, :acumuladores_valor => "@haberescondescuento", :acumuladores_cantidad => "", :calculo_valor => "novedad_haber:cantidad * 307.44", :calculo_cantidad => "novedad_haber:cantidad", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(2)], :cantidad_en_recibo => "novedad_haber:cantidad", :company_id => Company.find(1).id, :auxiliar => false)
id_remunerative_concept_old << [30]
id_remunerative_concept_new << [new_reg.id]
new_reg=RemunerativeConcept.create!(:codigo => "125", :detalle => "Dias media suplencia", :porcentual_asistencia => false, :prioridad_calculo => 20, :statistical_value => nil, :grupo_ganancias_id => nil, :accounting_imputation_id => nil, :concepto_asociado_haber_id => nil, :concepto_asociado_retencion_id => nil, :concepto_asociado_haber_2_id => nil, :concepto_asociado_retencion_2_id => nil, :acumuladores_valor => "@haberescondescuento", :acumuladores_cantidad => "", :calculo_valor => "novedad_haber:cantidad * 76.86", :calculo_cantidad => "novedad_haber:cantidad", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(2)], :cantidad_en_recibo => "novedad_haber:cantidad", :company_id => Company.find(1).id, :auxiliar => false)
id_remunerative_concept_old << [31]
id_remunerative_concept_new << [new_reg.id]
new_reg=RemunerativeConcept.create!(:codigo => "167", :detalle => "Horas Extras al 50%", :porcentual_asistencia => false, :prioridad_calculo => 10, :statistical_value => nil, :grupo_ganancias_id => nil, :accounting_imputation_id => nil, :concepto_asociado_haber_id => nil, :concepto_asociado_retencion_id => nil, :concepto_asociado_haber_2_id => nil, :concepto_asociado_retencion_2_id => nil, :acumuladores_valor => "@haberescondescuento", :acumuladores_cantidad => "", :calculo_valor => "(@haberesparaextras / 200) * 1.5 * novedad_haber:cantidad", :calculo_cantidad => "novedad_haber:cantidad", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(2)], :cantidad_en_recibo => "novedad_haber:cantidad", :company_id => Company.find(1).id, :auxiliar => false)
id_remunerative_concept_old << [32]
id_remunerative_concept_new << [new_reg.id]
new_reg=RemunerativeConcept.create!(:codigo => "168", :detalle => "Horas Extras al 100%", :porcentual_asistencia => false, :prioridad_calculo => 20, :statistical_value => nil, :grupo_ganancias_id => nil, :accounting_imputation_id => nil, :concepto_asociado_haber_id => nil, :concepto_asociado_retencion_id => nil, :concepto_asociado_haber_2_id => nil, :concepto_asociado_retencion_2_id => nil, :acumuladores_valor => "@haberescondescuento", :acumuladores_cantidad => "", :calculo_valor => "(@haberesparaextras / 200) * 2 * novedad_haber:cantidad", :calculo_cantidad => "novedad_haber:cantidad", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(2)], :cantidad_en_recibo => "novedad_haber:cantidad", :company_id => Company.find(1).id, :auxiliar => false)
id_remunerative_concept_old << [33]
id_remunerative_concept_new << [new_reg.id]
new_reg=RemunerativeConcept.create!(:codigo => "105", :detalle => "Dia del Encargado (2 de Oct)", :porcentual_asistencia => false, :prioridad_calculo => 20, :statistical_value => nil, :grupo_ganancias_id => nil, :accounting_imputation_id => nil, :concepto_asociado_haber_id => nil, :concepto_asociado_retencion_id => nil, :concepto_asociado_haber_2_id => nil, :concepto_asociado_retencion_2_id => nil, :acumuladores_valor => "@haberescondescuento", :acumuladores_cantidad => "", :calculo_valor => "(@haberesparaextras / 25) * novedad_haber:cantidad", :calculo_cantidad => "novedad_haber:cantidad", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(2)], :cantidad_en_recibo => "novedad_haber:cantidad", :company_id => Company.find(1).id, :auxiliar => false)
id_remunerative_concept_old << [38]
id_remunerative_concept_new << [new_reg.id]
new_reg=RemunerativeConcept.create!(:codigo => "160", :detalle => "Horas Simples", :porcentual_asistencia => false, :prioridad_calculo => 20, :statistical_value => nil, :grupo_ganancias_id => nil, :accounting_imputation_id => nil, :concepto_asociado_haber_id => nil, :concepto_asociado_retencion_id => nil, :concepto_asociado_haber_2_id => nil, :concepto_asociado_retencion_2_id => nil, :acumuladores_valor => "@haberescondescuento", :acumuladores_cantidad => "", :calculo_valor => "(@haberesparaextras / 200)  * novedad_haber:cantidad", :calculo_cantidad => "novedad_haber:cantidad", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(2)], :cantidad_en_recibo => "novedad_haber:cantidad", :company_id => Company.find(1).id, :auxiliar => false)
id_remunerative_concept_old << [39]
id_remunerative_concept_new << [new_reg.id]
new_reg=RemunerativeConcept.create!(:codigo => "169", :detalle => "Horas Extras al 50% Sabados", :porcentual_asistencia => false, :prioridad_calculo => 20, :statistical_value => nil, :grupo_ganancias_id => nil, :accounting_imputation_id => nil, :concepto_asociado_haber_id => nil, :concepto_asociado_retencion_id => nil, :concepto_asociado_haber_2_id => nil, :concepto_asociado_retencion_2_id => nil, :acumuladores_valor => "@haberescondescuento", :acumuladores_cantidad => "", :calculo_valor => "(@haberesparaextras / 200) * 1.5 * novedad_haber:cantidad", :calculo_cantidad => "novedad_haber:cantidad", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(2)], :cantidad_en_recibo => "novedad_haber:cantidad", :company_id => Company.find(1).id, :auxiliar => false)
id_remunerative_concept_old << [40]
id_remunerative_concept_new << [new_reg.id]
new_reg=RemunerativeConcept.create!(:codigo => "151", :detalle => "Inasistencia p/Vacaciones", :porcentual_asistencia => false, :prioridad_calculo => 30, :statistical_value => nil, :grupo_ganancias_id => nil, :accounting_imputation_id => nil, :concepto_asociado_haber_id => nil, :concepto_asociado_retencion_id => nil, :concepto_asociado_haber_2_id => nil, :concepto_asociado_retencion_2_id => nil, :acumuladores_valor => "@haberescondescuento", :acumuladores_cantidad => "", :calculo_valor => "( @haberescondescuento / 30) * novedad_haber:cantidad", :calculo_cantidad => "novedad_haber:cantidad", :data_to_ask_id => id_data_to_ask_new[ id_data_to_ask_old.index(2)], :cantidad_en_recibo => "novedad_haber:cantidad", :company_id => Company.find(1).id, :auxiliar => false)
id_remunerative_concept_old << [21]
id_remunerative_concept_new << [new_reg.id]
