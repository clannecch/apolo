# TODO: Claudio por favor completa esto
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
#encoding: utf-8
=begin
Execute:
  heroku console
  load Rails.root.join('db/apolo-heroku.rb').to_s
=end
=begin
Country.create!(:code => 'AR', :detalle => 'Argentina')

ar_country_id = Country.where(:code => 'AR').first.id

ar_provincies = [{:code => 'AR01',:detalle => 'Buenos Aires',:country_id => ar_country_id},
  {:code => 'AR02',:detalle => 'Catamarca',:country_id => ar_country_id},
  {:code => 'AR03',:detalle => 'Chaco',:country_id => ar_country_id},
  {:code => 'AR04',:detalle => 'Chubut',:country_id => ar_country_id},
  {:code => 'AR05',:detalle => 'Cordoba',:country_id => ar_country_id},
  {:code => 'AR06',:detalle => 'Corrientes',:country_id => ar_country_id},
  {:code => 'AR07',:detalle => 'Distrito Federal',:country_id => ar_country_id},
  {:code => 'AR08',:detalle => 'Entre Rios',:country_id => ar_country_id},
  {:code => 'AR09',:detalle => 'Formosa',:country_id => ar_country_id},
  {:code => 'AR10',:detalle => 'Jujuy',:country_id => ar_country_id},
  {:code => 'AR11',:detalle => 'La Pampa',:country_id => ar_country_id},
  {:code => 'AR12',:detalle => 'La Rioja',:country_id => ar_country_id},
  {:code => 'AR13',:detalle => 'Medoza',:country_id => ar_country_id},
  {:code => 'AR14',:detalle => 'Misiones',:country_id => ar_country_id},
  {:code => 'AR15',:detalle => 'Neuquen',:country_id => ar_country_id},
  {:code => 'AR16',:detalle => 'Rio Negro',:country_id => ar_country_id},
  {:code => 'AR17',:detalle => 'Salta',:country_id => ar_country_id},
  {:code => 'AR18',:detalle => 'San Juan',:country_id => ar_country_id},
  {:code => 'AR19',:detalle => 'San Luis',:country_id => ar_country_id},
  {:code => 'AR20',:detalle => 'Santa Cruz',:country_id => ar_country_id},
  {:code => 'AR21',:detalle => 'Santa Fe',:country_id => ar_country_id},
  {:code => 'AR22',:detalle => 'Santiago del Estero',:country_id => ar_country_id},
  {:code => 'AR23',:detalle => 'Tierra del Fuego, Antartida e Islas del Atlantico',:country_id => ar_country_id},
  {:code => 'AR24',:detalle => 'Tucuman',:country_id => ar_country_id}]

ar_provincies.each do |province|
  $stderr.puts("create province #{province[:detalle]}...")
  Province.create!(:code => province[:code],
               :detalle => province[:detalle],
               :country_id => province[:country_id])
end
=end
province1 = Province.find(1).id

location1 = Location.create!(:detalle => "Villa Pueyrredon", :company_id => 1).id

company1 = Company.create!(:name => "Administracion 1", :code => "adm1", :razon_social => "Administracion SRL",
 :calle => "calle", :altura => "1234", :codigo_postal => "1419", :location_id => location1, :province_id => province1,
 :telefono => "44445555", :contacto => "", :email => "admin1@admin.com.ar", :cuit => "30123456780", :numero_inscripcion => "", :caja => "",
 :ultima_hoja_libro => 0, :imprimir_hasta_hoja_libro => 0, :observaciones => "")
 
company2 = Company.create!(:name => "Administracion 2", :code => "adm2", :razon_social => "Administracion SA",
 :calle => "Helguera", :altura => "4847", :codigo_postal => "1419", :location_id => location1, :province_id => province1,
 :telefono => "45551234", :contacto => "pablo", :email => "esta@pro.com", :cuit => "3012345671",
 :numero_inscripcion => "no tiene", :caja => "industria", :ultima_hoja_libro => 1, :imprimir_hasta_hoja_libro => 100,
 :observaciones => "sfdfd")

 menu1=Menu.create(:parent_id => nil, :name => "Maestros", :link_url => "", :order_no => 1)
 new_reg=Menu.create(:parent_id => menu1, :name => "Empleados", :link_url => "/employees", :order_no => 1)
 new_reg=Menu.create(:parent_id => menu1, :name => "liquidaciones", :link_url => "/liquidacions", :order_no => 2)

 menu2 = Menu.create(:parent_id => menu1, :name => "Conceptos de liquidacion", :link_url => "?", :order_no => 3)
 new_reg=Menu.create(:parent_id => menu2, :name => "Haberes", :link_url => "?", :order_no => 1)
 new_reg=Menu.create(:parent_id => menu2, :name => "Grupo de Remuneraciones", :link_url => "/group_remunerations", :order_no => 2)
 new_reg=Menu.create(:parent_id => menu2, :name => "Codigos", :link_url => "/remunerative_concepts", :order_no => 1)

 menu3 = Menu.create(:parent_id => menu1, :name => "Retenciones", :link_url => "?", :order_no => 1)
 new_reg=Menu.create(:parent_id => menu3, :name => "Retenciones", :link_url => "/retention_concepts", :order_no => 1)

 menu4 = Menu.create(:parent_id => menu1, :name => "Aportes Patronales", :link_url => "?", :order_no => 1)
 new_reg=Menu.create(:parent_id => menu4, :name => "Grupo de Aportes Patronales", :link_url => "/group_employer_contributions", :order_no => 3)

 menu5 = Menu.create(:parent_id => menu1, :name => "Bancos", :link_url => "?", :order_no => 1)
 new_reg=Menu.create(:parent_id => menu5, :name => "Bancos", :link_url => "/bank_deposits", :order_no => 1)
 new_reg=Menu.create(:parent_id => menu5, :name => "Tipos de Cuentas", :link_url => "/bank_deposit_account_types", :order_no => 2)

 menu6 = Menu.create(:parent_id => menu1, :name => "Tablas Varias", :link_url => "?", :order_no => 0)
 new_reg=Menu.create(:parent_id => menu6, :name => "Datos a Solicitar", :link_url => "/data_to_asks", :order_no => 1)
 new_reg=Menu.create(:parent_id => menu6, :name => "Tipos de Documentos", :link_url => "document_types", :order_no => 1)
 new_reg=Menu.create(:parent_id => menu6, :name => "Niveles de Educacion", :link_url => "/educational_levels", :order_no => 1)
 new_reg=Menu.create(:parent_id => menu6, :name => "Tipo de Calle", :link_url => "/home_abouts", :order_no => 1)
 new_reg=Menu.create(:parent_id => menu6, :name => "Lugares de emision de Documentos", :link_url => "/issueds", :order_no => 1)
 new_reg=Menu.create(:parent_id => menu6, :name => "Estados Civil", :link_url => "/marital_statuses", :order_no => 1)
 new_reg=Menu.create(:parent_id => menu6, :name => "Nacionalidades", :link_url => "/nationalities", :order_no => 1)
 new_reg=Menu.create(:parent_id => menu6, :name => "Lugares de Trabajo", :link_url => "/places", :order_no => 1)
 new_reg=Menu.create(:parent_id => menu6, :name => "Cuentas Contables", :link_url => "/accounting_imputations", :order_no => 1)
 new_reg=Menu.create(:parent_id => menu6, :name => "Obras Sociales", :link_url => "/health_insurances", :order_no => 1)
 new_reg=Menu.create(:parent_id => menu6, :name => "Aseguradoras", :link_url => "/insurance_companies", :order_no => 1)
 new_reg=Menu.create(:parent_id => menu6, :name => "Sindicatos", :link_url => "/labor_unions", :order_no => 1)
 new_reg=Menu.create(:parent_id => menu6, :name => "menus", :link_url => "/menus", :order_no => 99)
 
 menu7 = Menu.create(:parent_id => menu6, :name => "Ubicacion", :link_url => "?", :order_no => 1)
 new_reg=Menu.create(:parent_id => menu7, :name => "Paises", :link_url => "/countries", :order_no => 1)
 new_reg=Menu.create(:parent_id => menu7, :name => "Provincias", :link_url => "/provinces", :order_no => 1)
 new_reg=Menu.create(:parent_id => menu7, :name => "Localidades", :link_url => "/locations", :order_no => 1)

 menu8 = Menu.create(:parent_id => menu6, :name => "Exportaciones", :link_url => "?", :order_no => 1)
 new_reg=Menu.create(:parent_id => menu8, :name => "SIJP", :link_url => "/sijp", :order_no => 1)
 
 menu9 = Menu.create(:parent_id => menu6, :name => "Estadisticas", :link_url => "?", :order_no => 1)
 new_reg=Menu.create(:parent_id => menu9, :name => "Centros de Costos", :link_url => "/centro_costos", :order_no => 1)
 
 menu10 =Menu.create(:parent_id => menu6, :name => "Conceptos de liquidacion", :link_url => "?", :order_no => 1)
 new_reg=Menu.create(:parent_id => menu10, :name => "Haberes", :link_url => "/estadistica_haberes", :order_no => 1)
 new_reg=Menu.create(:parent_id => menu10, :name => "Retenciones", :link_url => "/retenciones", :order_no => 1)
 
 menu11 =Menu.create(:parent_id => menu6, :name => "Empleados", :link_url => "?", :order_no => 1)
 new_reg=Menu.create(:parent_id => menu11, :name => "Resumen de liquidaciones", :link_url => "/resumen_liquidaciones", :order_no => 1)
 new_reg=Menu.create(:parent_id => menu11, :name => "Conceptos de liquidacion", :link_url => "/estaditica_empleado_concepto", :order_no => 1)
 
 new_reg=Menu.create(:parent_id => menu6, :name => "Graficas", :link_url => "?", :order_no => 1)
 new_reg=Menu.create(:parent_id => menu6, :name => "Liquidacion Automatica", :link_url => "?", :order_no => 1)
 new_reg=Menu.create(:parent_id => menu6, :name => "Tipos de Documento Adjunto", :link_url => "/associated_document_types", :order_no => 1)
 new_reg=Menu.create(:parent_id => menu6, :name => "Parentesco", :link_url => "/kinships", :order_no => 1)
 new_reg=Menu.create(:parent_id => menu6, :name => "Tablas AFIP", :link_url => "?", :order_no => 1)
 new_reg=Menu.create(:parent_id => menu6, :name => "Actividades", :link_url => "/sicoss_activities", :order_no => 1)
 new_reg=Menu.create(:parent_id => menu6, :name => "Condicion", :link_url => "/sicoss_conditions", :order_no => 1)
 new_reg=Menu.create(:parent_id => menu6, :name => "Modalidad de Contrato", :link_url => "/sicoss_contract_modes", :order_no => 1)
 new_reg=Menu.create(:parent_id => menu6, :name => "Codigo de Siniestrado", :link_url => "/sicoss_damageds", :order_no => 1)
 new_reg=Menu.create(:parent_id => menu6, :name => "Localidad", :link_url => "/sicoss_locations", :order_no => 1)
 new_reg=Menu.create(:parent_id => menu6, :name => "Zona / Reduccion", :link_url => "/sicoss_reduction_zones", :order_no => 1)
 new_reg=Menu.create(:parent_id => menu6, :name => "Tipo de Regimen", :link_url => "/sicoss_regimen_types", :order_no => 1)
 new_reg=Menu.create(:parent_id => menu6, :name => "Situacion", :link_url => "/sicoss_situations", :order_no => 1)
 new_reg=Menu.create(:parent_id => menu6, :name => "Tipo de Empleador", :link_url => "/sicoss_employer_types", :order_no => 1)
 new_reg=Menu.create(:parent_id => menu6, :name => "Formato de Transferecia SiCOSS", :link_url => "/sicoss_formats", :order_no => 99)
 new_reg=Menu.create(:parent_id => menu6, :name => "Complemento SICOSS Empresa", :link_url => "/sicoss_format_employers", :order_no => 77)
 new_reg=Menu.create(:parent_id => menu6, :name => "Codigos", :link_url => "/employer_contribution_concepts", :order_no => 1)
 new_reg=Menu.create(:parent_id => menu6, :name => "Consorcios", :link_url => "/consortia", :order_no => 99)
 new_reg=Menu.create(:parent_id => menu6, :name => "Tipos de Recibos", :link_url => "/tipo_recibos", :order_no => 1)
 new_reg=Menu.create(:parent_id => menu6, :name => "Grupo de retenciones", :link_url => "/group_retentions", :order_no => 1)
 new_reg=Menu.create(:parent_id => menu6, :name => "Actividad", :link_url => "/activities", :order_no => 1)
 new_reg=Menu.create(:parent_id => menu6, :name => "Causa de egreso", :link_url => "/causa_egresos", :order_no => 88)
 new_reg=Menu.create(:parent_id => menu6, :name => "Tipos de Email", :link_url => "/email_types", :order_no => 85)
 new_reg=Menu.create(:parent_id => menu6, :name => "Numeradores", :link_url => "/numeradors", :order_no => 99)
 new_reg=Menu.create(:parent_id => menu6, :name => "Tipos de Remuneraciones", :link_url => "/remuneration_types", :order_no => 1)
 new_reg=Menu.create(:parent_id => menu6, :name => "Modalidades de Contratacion", :link_url => "/contract_modes", :order_no => 1)
 new_reg=Menu.create(:parent_id => menu6, :name => "Tablas de Contratacion", :link_url => "?", :order_no => 3)
 new_reg=Menu.create(:parent_id => menu6, :name => "Centros de Costos", :link_url => "/cost_centers", :order_no => 1)
 new_reg=Menu.create(:parent_id => menu6, :name => "Tareas", :link_url => "/tasks", :order_no => 1)
 new_reg=Menu.create(:parent_id => menu6, :name => "Categorias", :link_url => "/categories", :order_no => 1)
 new_reg=Menu.create(:parent_id => menu6, :name => "Secciones", :link_url => "/sections", :order_no => 1)
 new_reg=Menu.create(:parent_id => menu6, :name => "Ocupacion", :link_url => "/employments", :order_no => 84)
 new_reg=Menu.create(:parent_id => menu6, :name => "Administradoras", :link_url => "/companies", :order_no => 98)

=begin
Country.create({"detalle"=>"Argentina"})
Country.create({"detalle"=>"Italia"})
Country.create({"detalle"=>"Espana"})
=end

=begin
Country.all.each do |company|
  Employee.create(:name => 'zarasa', :country_id => company.id)
end

Issued.create({"detalle"=>"Capital Federal"})
Issued.create({"detalle"=>"Pcia. Bs. As."})
Issued.create({"detalle"=>"La Pampa"})

#1..10.each do |i|
RemunerativeConcept.create({"accounting_imputation_id"=>nil, 
	"acumuladores_cantidad"=>"", 
	"acumuladores_valor"=>"@basico @haberescondescuento @remuneracion_habitual", 
	"calculo_cantidad"=>"1", 
	"calculo_valor"=>"@sueldo", 
	"cantidad_en_recibo"=>nil, 
	"codigo"=>"001", 
	"concepto_asociado_haber_2_id"=>nil, 
	"concepto_asociado_haber_id"=>5, 
	"concepto_asociado_retencion_2_id"=>nil, 
	"concepto_asociado_retencion_id"=>nil, 
	"data_to_ask_id"=>1, # <-- aca pondriamos la var i 
	"detalle"=>"Sueldo Basico", 
	"grupo_ganancias_id"=>nil, 
	"porcentual_asistencia"=>false, 
	"prioridad_calculo"=>0, 
	"statistical_value"=>1})
#end
RemunerativeConcept.create({"accounting_imputation_id"=>nil, "acumuladores_cantidad"=>"", "acumuladores_valor"=>"@basico @haberescondescuento @aguinaldo  @aguinaldo", "calculo_cantidad"=>":cantidad", "calculo_valor"=>":cantidad*@valor_hora", "cantidad_en_recibo"=>nil, "codigo"=>"002", "concepto_asociado_haber_2_id"=>nil, "concepto_asociado_haber_id"=>4, "concepto_asociado_retencion_2_id"=>nil, "concepto_asociado_retencion_id"=>nil, "data_to_ask_id"=>2, "detalle"=>"Horas Normales", "grupo_ganancias_id"=>nil, "porcentual_asistencia"=>false, "prioridad_calculo"=>1, "statistical_value"=>0})
RemunerativeConcept.create({"accounting_imputation_id"=>nil, "acumuladores_cantidad"=>"@HorasTrabajadas", "acumuladores_valor"=>"@basico @haberescondescuento", "calculo_cantidad"=>"", "calculo_valor"=>"@valor_hora * :cantidad * 1.5", "cantidad_en_recibo"=>nil, "codigo"=>"003", "concepto_asociado_haber_2_id"=>nil, "concepto_asociado_haber_id"=>nil, "concepto_asociado_retencion_2_id"=>nil, "concepto_asociado_retencion_id"=>nil, "data_to_ask_id"=>2, "detalle"=>"Horas Extras al 50%", "grupo_ganancias_id"=>nil, "porcentual_asistencia"=>false, "prioridad_calculo"=>1, "statistical_value"=>nil})
RemunerativeConcept.create({"accounting_imputation_id"=>nil, "acumuladores_cantidad"=>"", "acumuladores_valor"=>"@basico @haberescondescuento", "calculo_cantidad"=>"", "calculo_valor"=>" @basico * 0.2", "cantidad_en_recibo"=>nil, "codigo"=>"004", "concepto_asociado_haber_2_id"=>nil, "concepto_asociado_haber_id"=>nil, "concepto_asociado_retencion_2_id"=>nil, "concepto_asociado_retencion_id"=>nil, "data_to_ask_id"=>1, "detalle"=>"premio asistencia", "grupo_ganancias_id"=>nil, "porcentual_asistencia"=>false, "prioridad_calculo"=>2, "statistical_value"=>nil})
RemunerativeConcept.create({"accounting_imputation_id"=>nil, "acumuladores_cantidad"=>"", "acumuladores_valor"=>" @haberescondescuento", "calculo_cantidad"=>"@antiguedad", "calculo_valor"=>"@basico * @antiguedad * 0.02", "cantidad_en_recibo"=>nil, "codigo"=>"005", "concepto_asociado_haber_2_id"=>nil, "concepto_asociado_haber_id"=>nil, "concepto_asociado_retencion_2_id"=>nil, "concepto_asociado_retencion_id"=>nil, "data_to_ask_id"=>1, "detalle"=>"Antiguedad", "grupo_ganancias_id"=>nil, "porcentual_asistencia"=>false, "prioridad_calculo"=>3, "statistical_value"=>nil})
RemunerativeConcept.create({"accounting_imputation_id"=>nil, "acumuladores_cantidad"=>"", "acumuladores_valor"=>"@basico @haberescondescuento @aguinaldo", "calculo_cantidad"=>":cantidad", "calculo_valor"=>":cantidad*@valor_hora*0.2", "cantidad_en_recibo"=>nil, "codigo"=>"006", "concepto_asociado_haber_2_id"=>nil, "concepto_asociado_haber_id"=>nil, "concepto_asociado_retencion_2_id"=>nil, "concepto_asociado_retencion_id"=>nil, "data_to_ask_id"=>2, "detalle"=>"Horas Extras al 100%", "grupo_ganancias_id"=>nil, "porcentual_asistencia"=>false, "prioridad_calculo"=>0, "statistical_value"=>nil})
RemunerativeConcept.create({"accounting_imputation_id"=>nil, "acumuladores_cantidad"=>"", "acumuladores_valor"=>"@haberescondescuento", "calculo_cantidad"=>"@dias_trabajados_semestre", "calculo_valor"=>"@mejor_remuneracion_semestre / 180 * @dias_trabajados_semestre", "cantidad_en_recibo"=>nil, "codigo"=>"500", "concepto_asociado_haber_2_id"=>nil, "concepto_asociado_haber_id"=>nil, "concepto_asociado_retencion_2_id"=>nil, "concepto_asociado_retencion_id"=>nil, "data_to_ask_id"=>1, "detalle"=>"Aguinaldo", "grupo_ganancias_id"=>nil, "porcentual_asistencia"=>false, "prioridad_calculo"=>99, "statistical_value"=>nil})
RemunerativeConcept.create({"accounting_imputation_id"=>nil, "acumuladores_cantidad"=>"", "acumuladores_valor"=>"@basico @haberescondescuento", "calculo_cantidad"=>"@dias_vacaciones", "calculo_valor"=>"@sueldo / 25 * @dias_vacaciones", "cantidad_en_recibo"=>nil, "codigo"=>"499", "concepto_asociado_haber_2_id"=>nil, "concepto_asociado_haber_id"=>nil, "concepto_asociado_retencion_2_id"=>nil, "concepto_asociado_retencion_id"=>nil, "data_to_ask_id"=>1, "detalle"=>"Dias Vacaciones", "grupo_ganancias_id"=>nil, "porcentual_asistencia"=>false, "prioridad_calculo"=>0, "statistical_value"=>nil})
RemunerativeConcept.create({"accounting_imputation_id"=>nil, "acumuladores_cantidad"=>"", "acumuladores_valor"=>"@basico @haberescondescuento", "calculo_cantidad"=>":cantidad", "calculo_valor"=>"(@sueldo / 25) * :cantidad", "cantidad_en_recibo"=>nil, "codigo"=>"007", "concepto_asociado_haber_2_id"=>nil, "concepto_asociado_haber_id"=>nil, "concepto_asociado_retencion_2_id"=>nil, "concepto_asociado_retencion_id"=>nil, "data_to_ask_id"=>2, "detalle"=>"Dias Vacaciones (MANUAL)", "grupo_ganancias_id"=>nil, "porcentual_asistencia"=>false, "prioridad_calculo"=>1, "statistical_value"=>nil})
RemunerativeConcept.create({"accounting_imputation_id"=>nil, "acumuladores_cantidad"=>"", "acumuladores_valor"=>"@haberescondescuento", "calculo_cantidad"=>"@cantidad_sueldos_indemnizacion_despido", "calculo_valor"=>"@cantidad_sueldos_indemnizacion_despido *  @mejor_remuneracion_habitual_anual", "cantidad_en_recibo"=>nil, "codigo"=>"600", "concepto_asociado_haber_2_id"=>nil, "concepto_asociado_haber_id"=>nil, "concepto_asociado_retencion_2_id"=>nil, "concepto_asociado_retencion_id"=>nil, "data_to_ask_id"=>1, "detalle"=>"Indemnizacion por despido ", "grupo_ganancias_id"=>nil, "porcentual_asistencia"=>false, "prioridad_calculo"=>90, "statistical_value"=>nil})
RemunerativeConcept.create({"accounting_imputation_id"=>nil, "acumuladores_cantidad"=>"", "acumuladores_valor"=>"@haberescondescuento", "calculo_cantidad"=>"@cantidad_indemnizacion_falta_preaviso", "calculo_valor"=>"@cantidad_indemnizacion_falta_preaviso *  @mejor_remuneracion_habitual_anual", "cantidad_en_recibo"=>nil, "codigo"=>"601", "concepto_asociado_haber_2_id"=>nil, "concepto_asociado_haber_id"=>nil, "concepto_asociado_retencion_2_id"=>nil, "concepto_asociado_retencion_id"=>nil, "data_to_ask_id"=>1, "detalle"=>"Indemnizacion sustitutiva del Preaviso", "grupo_ganancias_id"=>nil, "porcentual_asistencia"=>false, "prioridad_calculo"=>90, "statistical_value"=>nil})
RemunerativeConcept.create({"accounting_imputation_id"=>nil, "acumuladores_cantidad"=>"", "acumuladores_valor"=>"@haberescondescuento", "calculo_cantidad"=>"@dias_trabajados_mes", "calculo_valor"=>"(@mejor_remuneracion_habitual_anual / 30) * @dias_trabajados_mes", "cantidad_en_recibo"=>nil, "codigo"=>"602", "concepto_asociado_haber_2_id"=>nil, "concepto_asociado_haber_id"=>nil, "concepto_asociado_retencion_2_id"=>nil, "concepto_asociado_retencion_id"=>nil, "data_to_ask_id"=>1, "detalle"=>"Integracion mes despido", "grupo_ganancias_id"=>nil, "porcentual_asistencia"=>false, "prioridad_calculo"=>1, "statistical_value"=>nil})
RemunerativeConcept.create({"accounting_imputation_id"=>nil, "acumuladores_cantidad"=>"", "acumuladores_valor"=>"@haberescondescuento", "calculo_cantidad"=>"30 - @dias_trabajados_mes", "calculo_valor"=>"(@mejor_remuneracion_habitual_anual / 30) * (30 - @dias_trabajados_mes)", "cantidad_en_recibo"=>nil, "codigo"=>"603", "concepto_asociado_haber_2_id"=>nil, "concepto_asociado_haber_id"=>nil, "concepto_asociado_retencion_2_id"=>nil, "concepto_asociado_retencion_id"=>nil, "data_to_ask_id"=>1, "detalle"=>"Proporcional del mes trabajado", "grupo_ganancias_id"=>nil, "porcentual_asistencia"=>false, "prioridad_calculo"=>1, "statistical_value"=>nil})
RemunerativeConcept.create({"accounting_imputation_id"=>nil, "acumuladores_cantidad"=>"", "acumuladores_valor"=>"@haberescondescuento", "calculo_cantidad"=>"@dias_vacaciones_no_gozadas", "calculo_valor"=>"@dias_vacaciones_no_gozadas * (@mejor_remuneracion_habitual_anual / 25)", "cantidad_en_recibo"=>nil, "codigo"=>"604", "concepto_asociado_haber_2_id"=>nil, "concepto_asociado_haber_id"=>nil, "concepto_asociado_retencion_2_id"=>nil, "concepto_asociado_retencion_id"=>nil, "data_to_ask_id"=>1, "detalle"=>"Indemnizacion por Vacaciones no Gozadas", "grupo_ganancias_id"=>nil, "porcentual_asistencia"=>false, "prioridad_calculo"=>1, "statistical_value"=>nil})
RemunerativeConcept.create({"accounting_imputation_id"=>nil, "acumuladores_cantidad"=>"", "acumuladores_valor"=>"@haberescondescuento", "calculo_cantidad"=>"@dias_trabajados_semestre", "calculo_valor"=>"(@mejor_remuneracion_habitual_anual / 360) * @dias_trabajados_semestre", "cantidad_en_recibo"=>nil, "codigo"=>"605", "concepto_asociado_haber_2_id"=>nil, "concepto_asociado_haber_id"=>nil, "concepto_asociado_retencion_2_id"=>nil, "concepto_asociado_retencion_id"=>nil, "data_to_ask_id"=>1, "detalle"=>"SAC proporcional", "grupo_ganancias_id"=>nil, "porcentual_asistencia"=>false, "prioridad_calculo"=>1, "statistical_value"=>nil})
RemunerativeConcept.create({"accounting_imputation_id"=>nil, "acumuladores_cantidad"=>"", "acumuladores_valor"=>"@haberescondescuento", "calculo_cantidad"=>"@dias_vacaciones_no_gozadas", "calculo_valor"=>"(@mejor_remuneracion_habitual_anual / 360) * @dias_vacaciones_no_gozadas", "cantidad_en_recibo"=>nil, "codigo"=>"606", "concepto_asociado_haber_2_id"=>nil, "concepto_asociado_haber_id"=>nil, "concepto_asociado_retencion_2_id"=>nil, "concepto_asociado_retencion_id"=>nil, "data_to_ask_id"=>1, "detalle"=>"SAC sobre Vacaciones no Gozadas", "grupo_ganancias_id"=>nil, "porcentual_asistencia"=>false, "prioridad_calculo"=>2, "statistical_value"=>nil})
RemunerativeConcept.create({"accounting_imputation_id"=>nil, "acumuladores_cantidad"=>"", "acumuladores_valor"=>"@haberescondescuento", "calculo_cantidad"=>"@cantidad_indemnizacion_falta_preaviso", "calculo_valor"=>"(@mejor_remuneracion_habitual_anual / 360) * @cantidad_indemnizacion_falta_preaviso", "cantidad_en_recibo"=>nil, "codigo"=>"607", "concepto_asociado_haber_2_id"=>nil, "concepto_asociado_haber_id"=>nil, "concepto_asociado_retencion_2_id"=>nil, "concepto_asociado_retencion_id"=>nil, "data_to_ask_id"=>1, "detalle"=>"SAC sobre Preaviso", "grupo_ganancias_id"=>nil, "porcentual_asistencia"=>false, "prioridad_calculo"=>2, "statistical_value"=>nil})
RemunerativeConcept.create({"accounting_imputation_id"=>nil, "acumuladores_cantidad"=>"", "acumuladores_valor"=>"@haberescondescuento", "calculo_cantidad"=>"30 - @dias_trabajados_mes", "calculo_valor"=>"(@mejor_remuneracion_habitual_semestre / 360) * (30 - @dias_trabajados_mes)", "cantidad_en_recibo"=>nil, "codigo"=>"608", "concepto_asociado_haber_2_id"=>nil, "concepto_asociado_haber_id"=>nil, "concepto_asociado_retencion_2_id"=>nil, "concepto_asociado_retencion_id"=>nil, "data_to_ask_id"=>1, "detalle"=>"SAC sobre Integracion del mes de despido", "grupo_ganancias_id"=>nil, "porcentual_asistencia"=>false, "prioridad_calculo"=>2, "statistical_value"=>nil})

RemunerationType.create({"detalle"=>"x Hora"})
RemunerationType.create({"detalle"=>"x Dia"})
RemunerationType.create({"detalle"=>"x Mes"})

Liquidacion.create({"bank_deposit_id"=>2, "fecha_cierre"=>Wed, 22 Jun 2011, "fecha_deposito"=>Wed, 22 Jun 2011, "fecha_liquidacion"=>Sun, 01 May 2011, "periodo"=>Sat, 01 Jan 2011, "periodo_deposito"=>Wed, 01 Dec 2010, "quincena"=>2, "techo_retenciones"=>nil, "tipo_recibo_id"=>1})
Liquidacion.create({"bank_deposit_id"=>nil, "fecha_cierre"=>Thu, 14 Jul 2011, "fecha_deposito"=>Tue, 28 Jun 2011, "fecha_liquidacion"=>Tue, 28 Jun 2011, "periodo"=>Mon, 01 Aug 2011, "periodo_deposito"=>Fri, 01 Jul 2011, "quincena"=>2, "techo_retenciones"=>nil, "tipo_recibo_id"=>2})

EducationalLevel.create({"detalle"=>"Sin Educacion"})
EducationalLevel.create({"detalle"=>"Primaria -Incompleta"})
EducationalLevel.create({"detalle"=>"Primaria Completa"})
EducationalLevel.create({"detalle"=>"Primaria en Curso"})

EmployerContributionConcept.create({"accounting_imputation_id"=>nil, "acumuladores_valor"=>nil, "codigo"=>"001", "detalle"=>"Obra Social", "formula_calculo_valor"=>nil, "prioridad"=>nil, "statistical_value"=>nil})

Province.create({"detalle"=>"Buenos Aires"})
Province.create({"detalle"=>"Santa Fé"})
Province.create({"detalle"=>"Cordoba"})

DataToAsk.create({"cantidad"=>false, "detalle"=>"Ninguno", "importe"=>false})
DataToAsk.create({"cantidad"=>true, "detalle"=>"Cantidad", "importe"=>false})
DataToAsk.create({"cantidad"=>false, "detalle"=>"Importe", "importe"=>true})
DataToAsk.create({"cantidad"=>true, "detalle"=>"Cantidad e Importe", "importe"=>true})

RetentionConcept.create({"accounting_imputation_id"=>nil, "acumuladores_valor"=>"@retenciones", "codigo"=>"001", "data_to_ask_id"=>1, "detalle"=>"Jubilacion", "formula_calculo_valor"=>"@haberescondescuento * 0.11", "prioridad"=>0, "statistical_value"=>1})
RetentionConcept.create({"accounting_imputation_id"=>nil, "acumuladores_valor"=>"@retenciones", "codigo"=>"002", "data_to_ask_id"=>2, "detalle"=>"Obra Social", "formula_calculo_valor"=>".3 * @RemuneracionesConDescuento", "prioridad"=>nil, "statistical_value"=>nil})
RetentionConcept.create({"accounting_imputation_id"=>nil, "acumuladores_valor"=>"@retenciones", "codigo"=>"003", "data_to_ask_id"=>3, "detalle"=>"importe", "formula_calculo_valor"=>"@haberescondescuento * 0.02", "prioridad"=>nil, "statistical_value"=>nil})
RetentionConcept.create({"accounting_imputation_id"=>nil, "acumuladores_valor"=>"@retenciones", "codigo"=>"004", "data_to_ask_id"=>4, "detalle"=>"cantidad e importe", "formula_calculo_valor"=>"importe *  cantidad", "prioridad"=>nil, "statistical_value"=>nil})

Section.create({"detalle"=>"Pabellon 1"})
Section.create({"detalle"=>"Administracion"})
Section.create({"detalle"=>"Farmacia"})

TipoRecibo.create({"detalle"=>"Liquidacion Normal"})
TipoRecibo.create({"detalle"=>"Segunda Liquidacion"})
TipoRecibo.create({"detalle"=>"Aguinaldo"})
TipoRecibo.create({"detalle"=>"Vacaciones"})

Task.create({"detalle"=>"Director Administrativo"})
Task.create({"detalle"=>"Enfermero "})
Task.create({"detalle"=>"Administrativo"})

Activity.create({"detalle"=>"estudiante"})
Activity.create({"detalle"=>"ama de casa"})
Activity.create({"detalle"=>"nueva actividad"})

CostCenter.create({"detalle"=>"Administracion"})
CostCenter.create({"detalle"=>"Pabellon 1"})
CostCenter.create({"detalle"=>"Pabellon 2"})
CostCenter.create({"detalle"=>""})

GroupRemuneration.create({"detalle"=>"enfermeros"})
GroupRemuneration.create({"detalle"=>"DETALLE1"})
GroupRemuneration.create({"detalle"=>"UNO MAS"})

Employment.create({"detalle"=>"Director Administrativo"})
Employment.create({"detalle"=>"Jardinero"})
Employment.create({"detalle"=>"enfermero/a"})

HealthInsurance.create({"detalle"=>"OSDE"})
HealthInsurance.create({"detalle"=>"PAMI"})
HealthInsurance.create({"detalle"=>"Medicus"})

dni = DocumentType.create({"detalle"=>"D.N.I"})
ci = DocumentType.create({"detalle"=>"C.I."})
pasaporte = DocumentType.create({"detalle"=>"Pasaporte"})

InsuranceBeneficiary.create({"apellido"=>"Annecchini", "document_type_id"=> dni.id, "employee_id"=>nil, "fecha_nacimiento"=>nil, "nombre"=>"Claudio", "numero_documento"=>1234567})
InsuranceBeneficiary.create({"apellido"=>"juan", "document_type_id"=>2, "employee_id"=>nil, "fecha_nacimiento"=>nil, "nombre"=>"pelugo", "numero_documento"=>121212})
InsuranceBeneficiary.create({"apellido"=>"ANNE", "document_type_id"=>1, "employee_id"=>1, "fecha_nacimiento"=>Tue, 01 Jul 2008, "nombre"=>"AGU", "numero_documento"=>12121})

Employee.create({"Seguro_numero_poliza"=>"932212", "accounting_imputation_id"=>2, "antiguedad_reconocida_anos"=>0, "antiguedad_reconocida_meses"=>0, "apellido"=>"Annecchini", "bank_deposit_account_type_id"=>2, "bank_deposit_id"=>2, "calle"=>"Pje. Juan Pablo Duarte", "cargas_extras_osocial"=>0, "category_id"=>1, "causa_egreso_id"=>1, "character_service_id"=>1, "codigo_postal"=>"1419", "contract_mode_id"=>2, "cost_center_id"=>3, "country_id"=>1, "cuadras_asfalto"=>2, "cuil"=>"20-", "cuit"=>"30-", "departamento"=>"No Aplica", "deposito_banco_cbu"=>"cbu1", "deposito_banco_cuenta"=>"cta1", "discapacidad"=>"N", "document_type_id"=>1, "domicilio_avenida_cercana"=>"DE LOS DE ACA", "domicilio_avenida_cercana_altura"=>1111, "domicilio_entre_calle_derecha"=>"aquella", "domicilio_entre_calle_izquierda"=>"esta", "domicilio_entre_calles_detras"=>"la otrA", "educational_level_id"=>2, "email"=>"annecchini@gmail.com", "email_type_id"=>2, "employment_id"=>1, "fecha_egreso"=>Thu, 10 Feb 2011, "fecha_ingreso"=>Sun, 11 Nov 2001, "fecha_nacimiento"=>Wed, 01 Jul 1981, "foto"=>nil, "group_employer_contribution_id"=>2, "group_remuneration_id"=>1, "group_retention_id"=>3, "health_insurance_id"=>1, "home_about_id"=>3, "horas_pactadas"=>#<BigDecimal:b3baaa0,'0.2E3',4(8)>, "id_card"=>123, "insurance_company_id"=>2, "issued_id"=>1, "labor_union_id"=>1, "legajo"=>"0001", "location_id"=>1, "marital_status_id"=>2, "matricula_nacional"=>"mn 1", "matricula_provincial"=>"no 2", "movil"=>"15-5858-7676", "nationality_id"=>1, "nombre"=>"Claudio Lorenzo ", "numero_afiliado_osocial"=>"1234", "numero_afiliado_sindicato"=>"567890", "numero_cofre"=>"321", "numero_documento"=>#<BigDecimal:b3b93a8,'0.12792911E8',8(12)>, "numero_ganancias"=>"8734ºº", "numero_jubilacion"=>"1209", "piso"=>"PB", "place_id"=>1, "plan_osocial"=>"210", "province_id"=>1, "puerta"=>"4819", "remuneracion_fuera_convenio"=>#<BigDecimal:b3b8804,'0.2E4',4(8)>, "remuneration_type_id"=>3, "retencion_minima_osocial"=>#<BigDecimal:b3b84bc,'0.22E2',4(8)>, "section_id"=>1, "seguro_conyuge"=>"s", "seguro_monto_asegurado"=>#<BigDecimal:b3b7f30,'0.22222E4',8(12)>, "sexo"=>"M", "task_id"=>1, "telefono"=>"4573-0413"})
Employee.create({"Seguro_numero_poliza"=>"", "accounting_imputation_id"=>1, "antiguedad_reconocida_anos"=>0, "antiguedad_reconocida_meses"=>0, "apellido"=>"Petek", "bank_deposit_account_type_id"=>nil, "bank_deposit_id"=>nil, "calle"=>"Pasaje Juan P. Duarte", "cargas_extras_osocial"=>nil, "category_id"=>1, "causa_egreso_id"=>nil, "character_service_id"=>nil, "codigo_postal"=>"", "contract_mode_id"=>1, "cost_center_id"=>3, "country_id"=>nil, "cuadras_asfalto"=>nil, "cuil"=>"", "cuit"=>"", "departamento"=>"", "deposito_banco_cbu"=>"", "deposito_banco_cuenta"=>"kkk", "discapacidad"=>"N", "document_type_id"=>2, "domicilio_avenida_cercana"=>"", "domicilio_avenida_cercana_altura"=>nil, "domicilio_entre_calle_derecha"=>"", "domicilio_entre_calle_izquierda"=>"", "domicilio_entre_calles_detras"=>"", "educational_level_id"=>nil, "email"=>"eapps@ap.com", "email_type_id"=>nil, "employment_id"=>nil, "fecha_egreso"=>Fri, 13 May 2011, "fecha_ingreso"=>Fri, 13 May 2011, "fecha_nacimiento"=>Fri, 13 May 2011, "foto"=>nil, "group_employer_contribution_id"=>2, "group_remuneration_id"=>2, "group_retention_id"=>2, "health_insurance_id"=>1, "home_about_id"=>nil, "horas_pactadas"=>#<BigDecimal:b33bc28,'0.2E3',4(8)>, "id_card"=>nil, "insurance_company_id"=>nil, "issued_id"=>1, "labor_union_id"=>nil, "legajo"=>"002", "location_id"=>nil, "marital_status_id"=>2, "matricula_nacional"=>"", "matricula_provincial"=>"", "movil"=>"15-5858-7675", "nationality_id"=>nil, "nombre"=>"Luis Marcelo ", "numero_afiliado_osocial"=>"", "numero_afiliado_sindicato"=>"", "numero_cofre"=>"", "numero_documento"=>#<BigDecimal:b33aad0,'0.12792911E8',8(12)>, "numero_ganancias"=>"", "numero_jubilacion"=>"", "piso"=>"", "place_id"=>nil, "plan_osocial"=>"", "province_id"=>nil, "puerta"=>"4819", "remuneracion_fuera_convenio"=>#<BigDecimal:b33a1d4,'0.232323E6',8(12)>, "remuneration_type_id"=>3, "retencion_minima_osocial"=>#<BigDecimal:b33a080,'0.0',4(8)>, "section_id"=>nil, "seguro_conyuge"=>"", "seguro_monto_asegurado"=>#<BigDecimal:b339cc0,'0.0',4(8)>, "sexo"=>"M", "task_id"=>nil, "telefono"=>"4573-4409"})
Employee.create({"Seguro_numero_poliza"=>"", "accounting_imputation_id"=>2, "antiguedad_reconocida_anos"=>nil, "antiguedad_reconocida_meses"=>1, "apellido"=>"Guardiola", "bank_deposit_account_type_id"=>2, "bank_deposit_id"=>1, "calle"=>"cuenca", "cargas_extras_osocial"=>1, "category_id"=>1, "causa_egreso_id"=>1, "character_service_id"=>1, "codigo_postal"=>"", "contract_mode_id"=>1, "cost_center_id"=>1, "country_id"=>1, "cuadras_asfalto"=>nil, "cuil"=>"1212", "cuit"=>"", "departamento"=>"", "deposito_banco_cbu"=>"", "deposito_banco_cuenta"=>"1212", "discapacidad"=>"N", "document_type_id"=>1, "domicilio_avenida_cercana"=>"", "domicilio_avenida_cercana_altura"=>nil, "domicilio_entre_calle_derecha"=>"", "domicilio_entre_calle_izquierda"=>"", "domicilio_entre_calles_detras"=>"", "educational_level_id"=>1, "email"=>"lguardiola@gmail.com", "email_type_id"=>nil, "employment_id"=>2, "fecha_egreso"=>nil, "fecha_ingreso"=>Fri, 01 Jul 2011, "fecha_nacimiento"=>Fri, 24 Dec 1971, "foto"=>nil, "group_employer_contribution_id"=>2, "group_remuneration_id"=>1, "group_retention_id"=>2, "health_insurance_id"=>1, "home_about_id"=>nil, "horas_pactadas"=>nil, "id_card"=>nil, "insurance_company_id"=>nil, "issued_id"=>1, "labor_union_id"=>2, "legajo"=>"003", "location_id"=>1, "marital_status_id"=>1, "matricula_nacional"=>"", "matricula_provincial"=>"", "movil"=>"15", "nationality_id"=>1, "nombre"=>"Luis", "numero_afiliado_osocial"=>"1212", "numero_afiliado_sindicato"=>"1212", "numero_cofre"=>"", "numero_documento"=>#<BigDecimal:b2d2638,'0.12792912E8',8(12)>, "numero_ganancias"=>"", "numero_jubilacion"=>"", "piso"=>"", "place_id"=>3, "plan_osocial"=>"210", "province_id"=>1, "puerta"=>"2200", "remuneracion_fuera_convenio"=>nil, "remuneration_type_id"=>1, "retencion_minima_osocial"=>#<BigDecimal:b2d1ad0,'0.0',4(8)>, "section_id"=>1, "seguro_conyuge"=>"", "seguro_monto_asegurado"=>nil, "sexo"=>"M", "task_id"=>2, "telefono"=>"no tiene"})
Employee.create({"Seguro_numero_poliza"=>"", "accounting_imputation_id"=>2, "antiguedad_reconocida_anos"=>nil, "antiguedad_reconocida_meses"=>1, "apellido"=>"Vandiest", "bank_deposit_account_type_id"=>1, "bank_deposit_id"=>2, "calle"=>"cuenca", "cargas_extras_osocial"=>1, "category_id"=>1, "causa_egreso_id"=>1, "character_service_id"=>1, "codigo_postal"=>"", "contract_mode_id"=>1, "cost_center_id"=>1, "country_id"=>1, "cuadras_asfalto"=>nil, "cuil"=>"1212", "cuit"=>"", "departamento"=>"", "deposito_banco_cbu"=>"", "deposito_banco_cuenta"=>"1212", "discapacidad"=>"N", "document_type_id"=>1, "domicilio_avenida_cercana"=>"", "domicilio_avenida_cercana_altura"=>nil, "domicilio_entre_calle_derecha"=>"", "domicilio_entre_calle_izquierda"=>"", "domicilio_entre_calles_detras"=>"", "educational_level_id"=>1, "email"=>"lguardiola@gmail.com", "email_type_id"=>nil, "employment_id"=>2, "fecha_egreso"=>nil, "fecha_ingreso"=>Fri, 01 Jul 2011, "fecha_nacimiento"=>Fri, 24 Dec 1971, "foto"=>nil, "group_employer_contribution_id"=>2, "group_remuneration_id"=>1, "group_retention_id"=>2, "health_insurance_id"=>1, "home_about_id"=>nil, "horas_pactadas"=>nil, "id_card"=>nil, "insurance_company_id"=>nil, "issued_id"=>1, "labor_union_id"=>2, "legajo"=>"004", "location_id"=>1, "marital_status_id"=>1, "matricula_nacional"=>"", "matricula_provincial"=>"", "movil"=>"15", "nationality_id"=>1, "nombre"=>"Pablo", "numero_afiliado_osocial"=>"1212", "numero_afiliado_sindicato"=>"1212", "numero_cofre"=>"", "numero_documento"=>#<BigDecimal:b1dc404,'0.12792913E8',8(12)>, "numero_ganancias"=>"", "numero_jubilacion"=>"", "piso"=>"", "place_id"=>3, "plan_osocial"=>"210", "province_id"=>1, "puerta"=>"2200", "remuneracion_fuera_convenio"=>nil, "remuneration_type_id"=>1, "retencion_minima_osocial"=>#<BigDecimal:b1db93c,'0.0',4(8)>, "section_id"=>1, "seguro_conyuge"=>"", "seguro_monto_asegurado"=>nil, "sexo"=>"M", "task_id"=>2, "telefono"=>"no tiene"})

CharacterService.create({"detalle"=>"Caracter 1"})
CharacterService.create({"detalle"=>"Caracter 2"})
CharacterService.create({"detalle"=>"Caracter 3"})

GroupRetention.create({"detalle"=>"Osde"})
GroupRetention.create({"detalle"=>"UOM"})
GroupRetention.create({"detalle"=>"UOCRA"})

HomeAbout.create({"detalle"=>"Asfalto"})
HomeAbout.create({"detalle"=>"Tierra"})
HomeAbout.create({"detalle"=>"Mejorado"})

BankDeposit.create({"detalle"=>"Nacion"})
BankDeposit.create({"detalle"=>"Provincia"})
BankDeposit.create({"detalle"=>"Santander Rio"})

AccountingImputation.create({"detalle"=>"sueldos pabellon 1"})
AccountingImputation.create({"detalle"=>"Sueldos Administracion"})
AccountingImputation.create({"detalle"=>"otra mas"})

Location.create({"detalle"=>"Capital Federal"})
Location.create({"detalle"=>"La Plata"})
Location.create({"detalle"=>"San Martin"})

Place.create({"detalle"=>"Centro"})
Place.create({"detalle"=>"Lujan"})
Place.create({"detalle"=>"Hospital de Dia"})

InsuranceCompany.create({"detalle"=>"La Caja"})
InsuranceCompany.create({"detalle"=>"La Segunda"})

LaborUnion.create({"detalle"=>"Sin Sindicato"})
LaborUnion.create({"detalle"=>"UOCRA"})
LaborUnion.create({"detalle"=>"UOM"})

Nationality.create({"detalle"=>"Argentina"})
Nationality.create({"detalle"=>"Italiana"})
Nationality.create({"detalle"=>"Española"})

ReciboSueldo.create({"employee_id"=>1, "fecha_recibo"=>Fri, 24 Jun 2011, "liquidacion_id"=>2, "mensaje_recibo"=>"", "observaciones"=>""})
ReciboSueldo.create({"employee_id"=>1, "fecha_recibo"=>Fri, 01 Jul 2011, "liquidacion_id"=>3, "mensaje_recibo"=>"", "observaciones"=>""})

GroupEmployerContribution.create({"detalle"=>"OSDE"})
GroupEmployerContribution.create({"detalle"=>"Osecac"})
GroupEmployerContribution.create({"detalle"=>"Jubilados"})

DetalleReciboRetencion.create({"cantidad"=>nil, "cost_center_id"=>nil, "detalle"=>"", "importe"=>nil, "recibo_sueldo_id"=>24, "retention_concept_id"=>1, "total"=>#<BigDecimal:afe7978,'0.42504E3',8(12)>})
DetalleReciboRetencion.create({"cantidad"=>nil, "cost_center_id"=>3, "detalle"=>nil, "importe"=>nil, "recibo_sueldo_id"=>30, "retention_concept_id"=>1, "total"=>nil})
DetalleReciboRetencion.create({"cantidad"=>nil, "cost_center_id"=>3, "detalle"=>nil, "importe"=>nil, "recibo_sueldo_id"=>31, "retention_concept_id"=>1, "total"=>nil})
DetalleReciboRetencion.create({"cantidad"=>nil, "cost_center_id"=>3, "detalle"=>nil, "importe"=>nil, "recibo_sueldo_id"=>32, "retention_concept_id"=>1, "total"=>nil})
DetalleReciboRetencion.create({"cantidad"=>nil, "cost_center_id"=>3, "detalle"=>nil, "importe"=>nil, "recibo_sueldo_id"=>33, "retention_concept_id"=>1, "total"=>nil})
DetalleReciboRetencion.create({"cantidad"=>nil, "cost_center_id"=>3, "detalle"=>"", "importe"=>nil, "recibo_sueldo_id"=>34, "retention_concept_id"=>1, "total"=>#<BigDecimal:aeb382c,'0.2503314814 814815E3',20(20)>})
DetalleReciboRetencion.create({"cantidad"=>nil, "cost_center_id"=>nil, "detalle"=>"", "importe"=>#<BigDecimal:aeafaec,'0.1E2',4(8)>, "recibo_sueldo_id"=>28, "retention_concept_id"=>3, "total"=>#<BigDecimal:aeaf4ac,'0.5989680000 0000006E2',20(24)>})

ContractMode.create({"detalle"=>"Personal Fijo"})
ContractMode.create({"detalle"=>"Contratado"})

Category.create({"detalle"=>"Administrativo", "importe"=>nil})
Category.create({"detalle"=>"Director", "importe"=>nil})
Category.create({"detalle"=>"Enfermero", "importe"=>nil})

EmployeeFamiliar.create({"acta"=>"", "activity_id"=>nil, "apellido"=>"a", "comuna"=>"", "country_id"=>nil, "cuil"=>"", "cuit"=>"", "document_type_id"=>nil, "employee_id"=>1, "fecha_nacimiento"=>Thu, 16 Jun 2011, "folio"=>"", "health_insurance_id"=>nil, "nombre"=>"b", "numero_documento"=>1, "province_id"=>nil, "tomo"=>""})
EmployeeFamiliar.create({"acta"=>"", "activity_id"=>nil, "apellido"=>"guardiola", "comuna"=>"", "country_id"=>nil, "cuil"=>"", "cuit"=>"", "document_type_id"=>nil, "employee_id"=>1, "fecha_nacimiento"=>Sun, 23 Jan 2011, "folio"=>"", "health_insurance_id"=>nil, "nombre"=>"luis", "numero_documento"=>121212, "province_id"=>nil, "tomo"=>""})
EmployeeFamiliar.create({"acta"=>"sss", "activity_id"=>nil, "apellido"=>"otro", "comuna"=>"dd", "country_id"=>1, "cuil"=>"dddd", "cuit"=>"dd", "document_type_id"=>nil, "employee_id"=>1, "fecha_nacimiento"=>Sat, 01 Jul 2006, "folio"=>"444", "health_insurance_id"=>1, "nombre"=>"mas", "numero_documento"=>232, "province_id"=>1, "tomo"=>"222"})

DetalleReciboHaber.create({"cantidad"=>nil, "cantidad_recibo"=>nil, "cost_center_id"=>3, "detalle"=>"premio asistencia", "importe"=>nil, "recibo_sueldo_id"=>24, "remunerative_concept_id"=>4, "total"=>#<BigDecimal:b899148,'0.46E3',4(8)>})
DetalleReciboHaber.create({"cantidad"=>#<BigDecimal:b83c40c,'0.15E2',4(8)>, "cantidad_recibo"=>nil, "cost_center_id"=>3, "detalle"=>"horas", "importe"=>nil, "recibo_sueldo_id"=>24, "remunerative_concept_id"=>2, "total"=>#<BigDecimal:b83a580,'0.15E3',4(8)>})
DetalleReciboHaber.create({"cantidad"=>#<BigDecimal:b809318,'0.1E2',4(8)>, "cantidad_recibo"=>nil, "cost_center_id"=>nil, "detalle"=>"horas al 50", "importe"=>nil, "recibo_sueldo_id"=>24, "remunerative_concept_id"=>3, "total"=>#<BigDecimal:b807374,'0.15E3',4(8)>})
DetalleReciboHaber.create({"cantidad"=>nil, "cantidad_recibo"=>nil, "cost_center_id"=>nil, "detalle"=>"sueldo", "importe"=>nil, "recibo_sueldo_id"=>24, "remunerative_concept_id"=>1, "total"=>#<BigDecimal:b7c4844,'0.2E4',4(8)>})
DetalleReciboHaber.create({"cantidad"=>nil, "cantidad_recibo"=>nil, "cost_center_id"=>nil, "detalle"=>"", "importe"=>nil, "recibo_sueldo_id"=>24, "remunerative_concept_id"=>5, "total"=>#<BigDecimal:b7a3dc4,'0.1104E4',4(8)>})
DetalleReciboHaber.create({"cantidad"=>nil, "cantidad_recibo"=>nil, "cost_center_id"=>3, "detalle"=>nil, "importe"=>nil, "recibo_sueldo_id"=>25, "remunerative_concept_id"=>4, "total"=>nil})
DetalleReciboHaber.create({"cantidad"=>nil, "cantidad_recibo"=>nil, "cost_center_id"=>3, "detalle"=>nil, "importe"=>nil, "recibo_sueldo_id"=>25, "remunerative_concept_id"=>2, "total"=>nil})
DetalleReciboHaber.create({"cantidad"=>nil, "cantidad_recibo"=>nil, "cost_center_id"=>3, "detalle"=>nil, "importe"=>nil, "recibo_sueldo_id"=>26, "remunerative_concept_id"=>1, "total"=>nil})
DetalleReciboHaber.create({"cantidad"=>nil, "cantidad_recibo"=>nil, "cost_center_id"=>3, "detalle"=>nil, "importe"=>nil, "recibo_sueldo_id"=>26, "remunerative_concept_id"=>3, "total"=>nil})
DetalleReciboHaber.create({"cantidad"=>nil, "cantidad_recibo"=>nil, "cost_center_id"=>3, "detalle"=>nil, "importe"=>nil, "recibo_sueldo_id"=>26, "remunerative_concept_id"=>2, "total"=>nil})
DetalleReciboHaber.create({"cantidad"=>nil, "cantidad_recibo"=>nil, "cost_center_id"=>3, "detalle"=>nil, "importe"=>nil, "recibo_sueldo_id"=>26, "remunerative_concept_id"=>5, "total"=>nil})
DetalleReciboHaber.create({"cantidad"=>nil, "cantidad_recibo"=>nil, "cost_center_id"=>3, "detalle"=>nil, "importe"=>nil, "recibo_sueldo_id"=>26, "remunerative_concept_id"=>4, "total"=>nil})
DetalleReciboHaber.create({"cantidad"=>nil, "cantidad_recibo"=>nil, "cost_center_id"=>3, "detalle"=>nil, "importe"=>nil, "recibo_sueldo_id"=>27, "remunerative_concept_id"=>1, "total"=>nil})
DetalleReciboHaber.create({"cantidad"=>nil, "cantidad_recibo"=>nil, "cost_center_id"=>3, "detalle"=>nil, "importe"=>nil, "recibo_sueldo_id"=>27, "remunerative_concept_id"=>3, "total"=>nil})
DetalleReciboHaber.create({"cantidad"=>nil, "cantidad_recibo"=>nil, "cost_center_id"=>3, "detalle"=>nil, "importe"=>nil, "recibo_sueldo_id"=>27, "remunerative_concept_id"=>2, "total"=>nil})
DetalleReciboHaber.create({"cantidad"=>nil, "cantidad_recibo"=>nil, "cost_center_id"=>3, "detalle"=>nil, "importe"=>nil, "recibo_sueldo_id"=>27, "remunerative_concept_id"=>5, "total"=>nil})
DetalleReciboHaber.create({"cantidad"=>nil, "cantidad_recibo"=>nil, "cost_center_id"=>3, "detalle"=>nil, "importe"=>nil, "recibo_sueldo_id"=>27, "remunerative_concept_id"=>4, "total"=>nil})
DetalleReciboHaber.create({"cantidad"=>nil, "cantidad_recibo"=>#<BigDecimal:b5a2b9c,'0.1E1',4(8)>, "cost_center_id"=>3, "detalle"=>"", "importe"=>nil, "recibo_sueldo_id"=>28, "remunerative_concept_id"=>1, "total"=>#<BigDecimal:b590b54,'0.2E4',4(8)>})
DetalleReciboHaber.create({"cantidad"=>#<BigDecimal:b58d7d8,'0.1E1',4(8)>, "cantidad_recibo"=>nil, "cost_center_id"=>3, "detalle"=>"", "importe"=>nil, "recibo_sueldo_id"=>28, "remunerative_concept_id"=>3, "total"=>#<BigDecimal:b581690,'0.15E2',4(8)>})
DetalleReciboHaber.create({"cantidad"=>nil, "cantidad_recibo"=>#<BigDecimal:b57dfa4,'0.9E1',4(8)>, "cost_center_id"=>3, "detalle"=>"", "importe"=>nil, "recibo_sueldo_id"=>28, "remunerative_concept_id"=>5, "total"=>#<BigDecimal:b57c5dc,'0.4568400000 0000003E3',20(24)>})
DetalleReciboHaber.create({"cantidad"=>nil, "cantidad_recibo"=>nil, "cost_center_id"=>3, "detalle"=>"", "importe"=>nil, "recibo_sueldo_id"=>28, "remunerative_concept_id"=>4, "total"=>#<BigDecimal:b570958,'0.423E3',4(8)>})
DetalleReciboHaber.create({"cantidad"=>#<BigDecimal:b5377c0,'0.1E2',4(8)>, "cantidad_recibo"=>#<BigDecimal:b5371a8,'0.1E2',4(8)>, "cost_center_id"=>nil, "detalle"=>"", "importe"=>nil, "recibo_sueldo_id"=>28, "remunerative_concept_id"=>2, "total"=>#<BigDecimal:b503c2c,'0.1E3',4(8)>})
DetalleReciboHaber.create({"cantidad"=>nil, "cantidad_recibo"=>#<BigDecimal:b4f2ad0,'0.1E1',4(8)>, "cost_center_id"=>3, "detalle"=>"", "importe"=>nil, "recibo_sueldo_id"=>29, "remunerative_concept_id"=>1, "total"=>#<BigDecimal:b4f1c70,'0.2E4',4(8)>})
DetalleReciboHaber.create({"cantidad"=>nil, "cantidad_recibo"=>#<BigDecimal:b4cfbfc,'0.11E2',4(8)>, "cost_center_id"=>3, "detalle"=>"", "importe"=>nil, "recibo_sueldo_id"=>29, "remunerative_concept_id"=>5, "total"=>#<BigDecimal:b4cea18,'0.9548000000 000001E3',20(20)>})
DetalleReciboHaber.create({"cantidad"=>#<BigDecimal:b4bc6c4,'0.1E2',4(8)>, "cantidad_recibo"=>#<BigDecimal:b4bc390,'0.1E2',4(8)>, "cost_center_id"=>nil, "detalle"=>"", "importe"=>nil, "recibo_sueldo_id"=>29, "remunerative_concept_id"=>6, "total"=>#<BigDecimal:b4bb210,'0.2E2',4(8)>})
DetalleReciboHaber.create({"cantidad"=>nil, "cantidad_recibo"=>#<BigDecimal:b447ae0,'0.4E2',4(8)>, "cost_center_id"=>nil, "detalle"=>"", "importe"=>nil, "recibo_sueldo_id"=>29, "remunerative_concept_id"=>7, "total"=>#<BigDecimal:b446604,'0.2222222222 222222E2',20(20)>})
DetalleReciboHaber.create({"cantidad"=>nil, "cantidad_recibo"=>#<BigDecimal:b432028,'0.28E2',4(8)>, "cost_center_id"=>nil, "detalle"=>"", "importe"=>nil, "recibo_sueldo_id"=>29, "remunerative_concept_id"=>8, "total"=>#<BigDecimal:b430994,'0.224E4',4(8)>})
DetalleReciboHaber.create({"cantidad"=>#<BigDecimal:b42d050,'0.1E1',4(8)>, "cantidad_recibo"=>#<BigDecimal:b42ce34,'0.1E1',4(8)>, "cost_center_id"=>nil, "detalle"=>"", "importe"=>nil, "recibo_sueldo_id"=>29, "remunerative_concept_id"=>9, "total"=>#<BigDecimal:b42bbc4,'0.8E2',4(8)>})
DetalleReciboHaber.create({"cantidad"=>nil, "cantidad_recibo"=>#<BigDecimal:b427e48,'0.11E2',4(8)>, "cost_center_id"=>nil, "detalle"=>"", "importe"=>nil, "recibo_sueldo_id"=>29, "remunerative_concept_id"=>10, "total"=>#<BigDecimal:b427218,'0.22E5',8(12)>})
DetalleReciboHaber.create({"cantidad"=>nil, "cantidad_recibo"=>#<BigDecimal:b423a8c,'0.2E1',4(8)>, "cost_center_id"=>nil, "detalle"=>"", "importe"=>nil, "recibo_sueldo_id"=>29, "remunerative_concept_id"=>11, "total"=>#<BigDecimal:b422308,'0.4E4',4(8)>})
DetalleReciboHaber.create({"cantidad"=>nil, "cantidad_recibo"=>#<BigDecimal:b41f0a4,'0.1E2',4(8)>, "cost_center_id"=>nil, "detalle"=>"", "importe"=>nil, "recibo_sueldo_id"=>29, "remunerative_concept_id"=>12, "total"=>#<BigDecimal:b3fa7a4,'0.6666666666 666667E3',20(20)>})
DetalleReciboHaber.create({"cantidad"=>nil, "cantidad_recibo"=>#<BigDecimal:b3f293c,'0.2E2',4(8)>, "cost_center_id"=>nil, "detalle"=>"", "importe"=>nil, "recibo_sueldo_id"=>29, "remunerative_concept_id"=>13, "total"=>#<BigDecimal:b3f1884,'0.1333333333 3333335E4',20(24)>})
DetalleReciboHaber.create({"cantidad"=>nil, "cantidad_recibo"=>#<BigDecimal:b3b8930,'0.3111111111 111111E1',20(20)>, "cost_center_id"=>nil, "detalle"=>"", "importe"=>nil, "recibo_sueldo_id"=>29, "remunerative_concept_id"=>14, "total"=>#<BigDecimal:b3b0280,'0.2488888888 8888889E3',20(24)>})
DetalleReciboHaber.create({"cantidad"=>nil, "cantidad_recibo"=>#<BigDecimal:b3ac9a0,'0.4E2',4(8)>, "cost_center_id"=>nil, "detalle"=>"", "importe"=>nil, "recibo_sueldo_id"=>29, "remunerative_concept_id"=>15, "total"=>#<BigDecimal:b3abb2c,'0.2222222222 2222223E3',20(24)>})
DetalleReciboHaber.create({"cantidad"=>nil, "cantidad_recibo"=>#<BigDecimal:b3aa40c,'0.3111111111 111111E1',20(20)>, "cost_center_id"=>nil, "detalle"=>"", "importe"=>nil, "recibo_sueldo_id"=>29, "remunerative_concept_id"=>16, "total"=>#<BigDecimal:b3a9d90,'0.1728395061 728395E2',20(20)>})
DetalleReciboHaber.create({"cantidad"=>nil, "cantidad_recibo"=>#<BigDecimal:b3a8508,'0.2E2',4(8)>, "cost_center_id"=>nil, "detalle"=>"", "importe"=>nil, "recibo_sueldo_id"=>29, "remunerative_concept_id"=>18, "total"=>#<BigDecimal:b3a7810,'0.1111111111 1111111E3',20(24)>})
DetalleReciboHaber.create({"cantidad"=>nil, "cantidad_recibo"=>nil, "cost_center_id"=>3, "detalle"=>nil, "importe"=>nil, "recibo_sueldo_id"=>30, "remunerative_concept_id"=>1, "total"=>nil})
DetalleReciboHaber.create({"cantidad"=>nil, "cantidad_recibo"=>nil, "cost_center_id"=>3, "detalle"=>nil, "importe"=>nil, "recibo_sueldo_id"=>30, "remunerative_concept_id"=>5, "total"=>nil})
DetalleReciboHaber.create({"cantidad"=>nil, "cantidad_recibo"=>nil, "cost_center_id"=>nil, "detalle"=>nil, "importe"=>nil, "recibo_sueldo_id"=>30, "remunerative_concept_id"=>1, "total"=>nil})
DetalleReciboHaber.create({"cantidad"=>nil, "cantidad_recibo"=>nil, "cost_center_id"=>nil, "detalle"=>nil, "importe"=>nil, "recibo_sueldo_id"=>30, "remunerative_concept_id"=>2, "total"=>nil})
DetalleReciboHaber.create({"cantidad"=>nil, "cantidad_recibo"=>nil, "cost_center_id"=>nil, "detalle"=>nil, "importe"=>nil, "recibo_sueldo_id"=>30, "remunerative_concept_id"=>3, "total"=>nil})
DetalleReciboHaber.create({"cantidad"=>nil, "cantidad_recibo"=>nil, "cost_center_id"=>3, "detalle"=>nil, "importe"=>nil, "recibo_sueldo_id"=>30, "remunerative_concept_id"=>5, "total"=>nil})
DetalleReciboHaber.create({"cantidad"=>nil, "cantidad_recibo"=>nil, "cost_center_id"=>3, "detalle"=>nil, "importe"=>nil, "recibo_sueldo_id"=>30, "remunerative_concept_id"=>4, "total"=>nil})
DetalleReciboHaber.create({"cantidad"=>nil, "cantidad_recibo"=>nil, "cost_center_id"=>3, "detalle"=>nil, "importe"=>nil, "recibo_sueldo_id"=>31, "remunerative_concept_id"=>1, "total"=>nil})
DetalleReciboHaber.create({"cantidad"=>nil, "cantidad_recibo"=>nil, "cost_center_id"=>3, "detalle"=>nil, "importe"=>nil, "recibo_sueldo_id"=>31, "remunerative_concept_id"=>5, "total"=>nil})
DetalleReciboHaber.create({"cantidad"=>nil, "cantidad_recibo"=>nil, "cost_center_id"=>nil, "detalle"=>nil, "importe"=>nil, "recibo_sueldo_id"=>31, "remunerative_concept_id"=>1, "total"=>nil})
DetalleReciboHaber.create({"cantidad"=>nil, "cantidad_recibo"=>nil, "cost_center_id"=>nil, "detalle"=>nil, "importe"=>nil, "recibo_sueldo_id"=>31, "remunerative_concept_id"=>2, "total"=>nil})
DetalleReciboHaber.create({"cantidad"=>nil, "cantidad_recibo"=>nil, "cost_center_id"=>nil, "detalle"=>nil, "importe"=>nil, "recibo_sueldo_id"=>31, "remunerative_concept_id"=>3, "total"=>nil})
DetalleReciboHaber.create({"cantidad"=>nil, "cantidad_recibo"=>nil, "cost_center_id"=>3, "detalle"=>nil, "importe"=>nil, "recibo_sueldo_id"=>31, "remunerative_concept_id"=>5, "total"=>nil})
DetalleReciboHaber.create({"cantidad"=>nil, "cantidad_recibo"=>nil, "cost_center_id"=>3, "detalle"=>nil, "importe"=>nil, "recibo_sueldo_id"=>31, "remunerative_concept_id"=>4, "total"=>nil})
DetalleReciboHaber.create({"cantidad"=>nil, "cantidad_recibo"=>nil, "cost_center_id"=>3, "detalle"=>nil, "importe"=>nil, "recibo_sueldo_id"=>32, "remunerative_concept_id"=>1, "total"=>nil})
DetalleReciboHaber.create({"cantidad"=>nil, "cantidad_recibo"=>nil, "cost_center_id"=>3, "detalle"=>nil, "importe"=>nil, "recibo_sueldo_id"=>32, "remunerative_concept_id"=>5, "total"=>nil})
DetalleReciboHaber.create({"cantidad"=>nil, "cantidad_recibo"=>nil, "cost_center_id"=>3, "detalle"=>nil, "importe"=>nil, "recibo_sueldo_id"=>33, "remunerative_concept_id"=>1, "total"=>nil})
DetalleReciboHaber.create({"cantidad"=>nil, "cantidad_recibo"=>nil, "cost_center_id"=>3, "detalle"=>nil, "importe"=>nil, "recibo_sueldo_id"=>33, "remunerative_concept_id"=>5, "total"=>nil})
DetalleReciboHaber.create({"cantidad"=>nil, "cantidad_recibo"=>nil, "cost_center_id"=>nil, "detalle"=>nil, "importe"=>nil, "recibo_sueldo_id"=>33, "remunerative_concept_id"=>4, "total"=>nil})
DetalleReciboHaber.create({"cantidad"=>nil, "cantidad_recibo"=>#<BigDecimal:b18e218,'0.1E1',4(8)>, "cost_center_id"=>3, "detalle"=>"", "importe"=>nil, "recibo_sueldo_id"=>34, "remunerative_concept_id"=>1, "total"=>#<BigDecimal:b18d110,'0.2E4',4(8)>})
DetalleReciboHaber.create({"cantidad"=>nil, "cantidad_recibo"=>#<BigDecimal:b189da8,'0.9E1',4(8)>, "cost_center_id"=>3, "detalle"=>"", "importe"=>nil, "recibo_sueldo_id"=>34, "remunerative_concept_id"=>5, "total"=>#<BigDecimal:b12289c,'0.36E3',4(8)>})
DetalleReciboHaber.create({"cantidad"=>nil, "cantidad_recibo"=>#<BigDecimal:b1199b8,'-0.1516666666 6666666E2',20(24)>, "cost_center_id"=>nil, "detalle"=>"", "importe"=>nil, "recibo_sueldo_id"=>34, "remunerative_concept_id"=>16, "total"=>#<BigDecimal:b1192d8,'-0.8425925925 925925E2',20(20)>})

BankDepositAccountType.create({"detalle"=>"Caja de Ahorro"})
BankDepositAccountType.create({"detalle"=>"Cuenta Corriente"})

MaritalStatus.create({"detalle"=>"Soltero"})
MaritalStatus.create({"detalle"=>"Casado"})
MaritalStatus.create({"detalle"=>"Viudo"})
=end
