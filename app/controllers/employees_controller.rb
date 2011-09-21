class EmployeesController < ApplicationController
  before_filter :find_employee, :except => [:index, :new, :create]
  # GET /employees
  # GET /employees.xml
  def index
    #@employees = Employee.all
    @search = Employee.by_company(current_company.id).search(params[:search])
    @employees = @search.page(params[:page]).per(10)
    respond_to do |format|
      format.html # index.html.erbb
      format.xml  { render :xml => @employees }
    end
  end

  # GET /employees/1
  # GET /employees/1.xml
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @employee }
      format.pdf do
        dump_tmp_filename = Rails.root.join('tmp',@employee.cache_key)
          Dir.mkdir(dump_tmp_filename.dirname) unless File.directory?(dump_tmp_filename.dirname)
          file_map = Rails.root.join('tmp',rand.to_s[2..15]+'.png')
          file_photo = Rails.root.join('tmp',rand.to_s[2..15]+'.jpg')
          Dir.mkdir(file_map.dirname) unless File.directory?(file_map.dirname)
          Dir.mkdir(file_photo.dirname) unless File.directory?(file_map.dirname)
          print_ficha_pdf(dump_tmp_filename,file_map,file_photo,@employee)
          send_file(dump_tmp_filename, :type => :pdf, :disposition => 'attachment', :filename => "Ficha_de_personal.pdf")
          #File.delete(dump_tmp_filename)
      end
    end
  end

  # GET /employees/new
  # GET /employees/new.xml
  def new
    @employee = Employee.by_company(current_company.id).new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @employee }
    end
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.xml
  def create
    @employee = Employee.by_company(current_company.id).new(params[:employee])

    respond_to do |format|
      if @employee.save
        format.html { redirect_to(@employee, :notice => 'Employee was successfully created.') }
        format.xml  { render :xml => @employee, :status => :created, :location => @employee }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @employee.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /employees/1
  # PUT /employees/1.xml
  def update
    #raise params[:employee].inspect

    respond_to do |format|
      if @employee.update_attributes(params[:employee])
        format.html { redirect_to(@employee, :notice => 'Employee was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @employee.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.xml
  def destroy
    begin
      @employee.destroy
      flash[:success] = "successfully destroyed."
    rescue ActiveRecord::DeleteRestrictionError => e
      @employee.errors.add(:base, e)
      flash[:error] = "#{e}"
    ensure
      redirect_to employee_url
    end
  end

  def find_employee
      @employee = Employee.by_company(current_company.id).find(params[:id])
  end

# #################################################################################
  def print_ficha_pdf(filename, file_map , file_photo , entity)
    require 'prawn'
    @employee = entity

    img = "hsjd2.jpg"


    pdf = Prawn::Document.new(:left_margin => 35, :top_margin => 35,:page_size   => "LETTER")
                                #  :page_layout => :portrait)
    prawn_logo = "hsjd.jpg"
    logo_empresa ="CASA NUESTA SRA. DEL PILAR"
    logo_domicilio = "Julio A. Roca 501 - 6700-Lujan (BA)"
    logo_cuit = "C.U.I.T.: "+"30-67932805-7"
    logo_inscripcion = "Nro.Inscripcion: " + "21.757"
    logo_caja = "Caja: 11" + "Ex Caja Serv. Publico"

# Recuadro exterior
    pdf.bounding_box [1, 720], :width => 535, :height => 725 do
        pdf.stroke_bounds
    end

    pdf.stroke_rectangle [400,710], 100, 100

    photo = @employee.attachments.unscoped.where(:associated_document_type_id => 1).first()
    if photo.adjunto_content_type[0..4] = "image"
      open( file_photo, 'wb' ) { |file|
          file.write(photo.adjunto_file)
        }

      foto = file_photo.to_s
      pdf.image foto, :at => [405,705], :fit => [90,90]
    end
    pdf.draw_text "Ficha de Personal", :at => [200,725],:style => :bold, :size => 13
    pdf.draw_text "Legajo :", :at => [435,725],:style => :bold, :size => 13
    pdf.draw_text @employee.legajo[0..9], :at => [485,725],:style => :bold, :size => 16


    pdf.draw_text "Apellido y Nombre:", :at => [5,700], :size => 9
    pdf.draw_text @employee.apellido.strip+", "+@employee.nombre[0..30], :at => [90,700],:style => :bold, :size => 13

    pdf.draw_text "Documento:", :at => [5,680], :size => 9
    pdf.draw_text @employee.document_type.detalle.strip+" - "+@employee.numero_documento.to_i.to_s,
                  :at => [90,680],:style => :bold, :size => 9

    pdf.draw_text "Emitido por:", :at => [205,680], :size => 9
    pdf.draw_text @employee.issued.detalle.strip[0..20], :at => [290,680],:style => :bold, :size => 9

    pdf.draw_text "Sexo:", :at => [5,665], :size => 9
    pdf.draw_text (@employee.sexo == "M" ?  "Masculino" : "Femenino"), :at => [90,665],:style => :bold, :size => 10

    pdf.draw_text "Nacionalidad:", :at => [205,665], :size => 9
    pdf.draw_text @employee.nationality.detalle.strip[0..20], :at => [290,665],:style => :bold, :size => 10

    pdf.draw_text "Estado Civil:", :at => [5,650], :size => 9
    pdf.draw_text @employee.marital_status.detalle, :at => [90,650],:style => :bold, :size => 10

    pdf.draw_text "Fecha Nacimiento:", :at => [205,650], :size => 9
    pdf.draw_text @employee.fecha_nacimiento.strftime("%d/%m/%Y"), :at => [290,650],:style => :bold, :size => 10

    pdf.draw_text "Telefono:", :at => [5,635], :size => 9
    pdf.draw_text @employee.telefono, :at => [90,635],:style => :bold, :size => 10

    pdf.draw_text "Movil:", :at => [205,635], :size => 9
    pdf.draw_text @employee.movil, :at => [290,635],:style => :bold, :size => 10

    pdf.stroke_rectangle [10,610], 380, 3

    require 'net/http'

    Net::HTTP.start( 'maps.google.com' ) { |http|
      resp = http.get( '/maps/api/staticmap?size=450x300&sensor=false&zoom=16&markers=' + @employee.latitude.to_s + '%2C' +
                      @employee.longitude.to_s )
      open( file_map, 'wb' ) { |file|
        file.write(resp.body)
      }
    }

    foto = file_map.to_s
    pdf.stroke_rectangle [5,605], 156,106
    pdf.image foto, :at => [8,602], :fit => [150,150]
    pdf.draw_text "Domicilio", :at => [270,595], :size => 11, :style => :bold

    pdf.draw_text "Calle:", :at => [170,580], :size => 9
    pdf.draw_text @employee.calle, :at => [230,580],:style => :bold, :size => 10

    pdf.draw_text "Puerta:", :at => [350,580], :size => 9
    pdf.draw_text @employee.puerta, :at => [417,580],:style => :bold, :size => 10

    pdf.draw_text "Piso:", :at => [170,565], :size => 9
    pdf.draw_text @employee.piso, :at => [230,565],:style => :bold, :size => 10

    pdf.draw_text "Depto.:", :at => [350,565], :size => 9
    pdf.draw_text @employee.departamento, :at => [417,565],:style => :bold, :size => 10

    pdf.draw_text "Localidad:", :at => [170,550], :size => 9
    pdf.draw_text @employee.location.detalle[0..25], :at => [230,550],:style => :bold, :size => 10

    pdf.draw_text "Provincia:", :at => [350,550], :size => 9
    pdf.draw_text @employee.province.detalle[0..25], :at => [417,550],:style => :bold, :size => 10

    pdf.draw_text "Pais:", :at => [170,535], :size => 9
    pdf.draw_text @employee.country.detalle, :at => [230,535],:style => :bold, :size => 10

    pdf.draw_text "Cod.Postal:", :at => [350,535], :size => 9
    pdf.draw_text @employee.codigo_postal, :at => [417,535],:style => :bold, :size => 10

    pdf.draw_text "Ubicado sobre:", :at => [170,520], :size => 9
    pdf.draw_text (@employee.home_about_id.blank? ? '' : @employee.home_about.detalle), :at => [230,520],:style => :bold, :size => 10

    pdf.draw_text "Cuadras Asfalto:", :at => [350,520], :size => 9
    pdf.draw_text @employee.cuadras_asfalto, :at => [417,520],:style => :bold, :size => 10

    pdf.draw_text "E-Mail:", :at => [170,505], :size => 9
    pdf.draw_text @employee.email, :at => [230,505],:style => :bold, :size => 10

    pdf.draw_text "Tipo E-Mail:", :at => [350,505], :size => 9
    pdf.draw_text (@employee.email_type_id.blank? ? '' : @employee.email_type.detalle), :at => [417,505],:style => :bold, :size => 10

    pdf.stroke_rectangle [170,500], 360, 3

    pdf.draw_text "Categoria:", :at => [5,480], :size => 9
    pdf.draw_text @employee.category.detalle, :at => [90,480],:style => :bold, :size => 10

    pdf.draw_text "Seccion:", :at => [300,480], :size => 9
    pdf.draw_text @employee.section.detalle, :at => [385,480],:style => :bold, :size => 10

    pdf.draw_text "Tarea:", :at => [5,465], :size => 9
    pdf.draw_text @employee.task.detalle, :at => [90,465],:style => :bold, :size => 10

    pdf.draw_text "Lugar de Trabajo:", :at => [300,465], :size => 9
    pdf.draw_text @employee.place.detalle, :at => [385,465],:style => :bold, :size => 10

    pdf.draw_text "Ocupacion:", :at => [5,450], :size => 9
    pdf.draw_text @employee.employment.detalle, :at => [90,450],:style => :bold, :size => 10

    pdf.draw_text "Lugar de Trabajo:", :at => [300,450], :size => 9
    pdf.draw_text @employee.character_service.detalle, :at => [385,450],:style => :bold, :size => 10

    pdf.stroke_rectangle [5,440], 527, 3

    pdf.draw_text "Obra Social:", :at => [5,425], :size => 9
    pdf.draw_text @employee.health_insurance.detalle, :at => [90,425],:style => :bold, :size => 10

    pdf.draw_text "Plan:", :at => [300,425], :size => 9
    pdf.draw_text @employee.plan_osocial, :at => [385,425],:style => :bold, :size => 10

    pdf.draw_text "N. Afiliado:", :at => [5,410], :size => 9
    pdf.draw_text @employee.numero_afiliado_osocial, :at => [90,410],:style => :bold, :size => 10

    pdf.draw_text "Cargas Extras:", :at => [300,410], :size => 9
    pdf.draw_text @employee.cargas_extras_osocial, :at => [385,410],:style => :bold, :size => 10

    pdf.draw_text "Retencion Minima:", :at => [5,395], :size => 9
    pdf.draw_text @employee.retencion_minima_osocial, :at => [90,395],:style => :bold, :size => 10

    pdf.draw_text "Sindicato:", :at => [5,380], :size => 9
    pdf.draw_text @employee.labor_union.detalle, :at => [90,380],:style => :bold, :size => 10

    pdf.draw_text "N. Afiliado:", :at => [300,380], :size => 9
    pdf.draw_text @employee.numero_afiliado_sindicato, :at => [385,380],:style => :bold, :size => 10

    pdf.stroke_rectangle [5,365], 527, 3

    pdf.draw_text "N. Jubilacion:", :at => [5,350], :size => 9
    pdf.draw_text @employee.numero_jubilacion, :at => [90,350],:style => :bold, :size => 10

    pdf.draw_text "N. Ganancias:", :at => [300,350], :size => 9
    pdf.draw_text @employee.numero_ganancias, :at => [385,350],:style => :bold, :size => 10

    pdf.draw_text "C.U.I.T.:", :at => [5,335], :size => 9
    pdf.draw_text @employee.cuit, :at => [90,335],:style => :bold, :size => 10

    pdf.draw_text "C.U.I.L.:", :at => [300,335], :size => 9
    pdf.draw_text @employee.cuil, :at => [385,335],:style => :bold, :size => 10

    pdf.stroke_rectangle [5,320], 527, 3

    pdf.draw_text "Datos Contratacion", :at => [230,305], :size => 11, :style => :bold

    pdf.draw_text "Fecha de Ingreso.:", :at => [5,290], :size => 9
    pdf.draw_text @employee.fecha_ingreso.strftime("%d/%m/%Y"), :at => [100,290],:style => :bold, :size => 10

    pdf.draw_text "Fecha de Egreso:", :at => [300,290], :size => 9
    pdf.draw_text (@employee.fecha_egreso == nil ? ' ' : @employee.fecha_egreso.strftime("%d/%m/%Y")), :at => [385,290],:style => :bold, :size => 10

    pdf.draw_text "Modalidad:", :at => [5,275], :size => 9
    pdf.draw_text @employee.contract_mode.detalle, :at => [100,275],:style => :bold, :size => 10

    pdf.draw_text "Causa de Egreso:", :at => [300,275], :size => 9
    pdf.draw_text (@employee.causa_egreso_id == nil ? '' : @employee.causa_egreso.detalle), :at => [275,290],:style => :bold, :size => 10

    pdf.draw_text "Hs. Pactadas:", :at => [5,260], :size => 9
    pdf.draw_text @employee.horas_pactadas, :at => [100,260],:style => :bold, :size => 10

    pdf.draw_text "Rem.Fuera Convenio:", :at => [300,260], :size => 9
    if @employee.remuneracion_fuera_convenio.nil?
    else
      pdf.draw_text @employee.remuneracion_fuera_convenio, :at => [400,260],:style => :bold, :size => 10
    end

    pdf.draw_text "Tipo Remuneracion:", :at => [5,245], :size => 9
    pdf.draw_text @employee.remuneration_type.detalle, :at => [100,245],:style => :bold, :size => 10

    pdf.draw_text "Centro Costo:", :at => [300,245], :size => 9
    pdf.draw_text @employee.cost_center.detalle, :at => [400,245],:style => :bold, :size => 10

    pdf.draw_text "Grupo Remuneracion:", :at => [5,230], :size => 9
    pdf.draw_text @employee.group_remuneration.detalle, :at => [100,230],:style => :bold, :size => 10

    pdf.draw_text "Grupo Retenciones:", :at => [300,230], :size => 9
    pdf.draw_text @employee.group_retention.detalle, :at => [400,230],:style => :bold, :size => 10

    pdf.draw_text "Grupo Aportes:", :at => [5,215], :size => 9
    pdf.draw_text @employee.group_employer_contribution.detalle, :at => [100,215],:style => :bold, :size => 10

    pdf.draw_text "Anos Antig. Reconocida:", :at => [5,200], :size => 9
    pdf.draw_text @employee.antiguedad_reconocida_anos, :at => [100,200],:style => :bold, :size => 10

    pdf.draw_text "Meses Antig.Reconocida:", :at => [300,200], :size => 9
    pdf.draw_text @employee.antiguedad_reconocida_anos, :at => [400,200],:style => :bold, :size => 10

    pdf.draw_text "Imputacion Contable:", :at => [5,185], :size => 9
    pdf.draw_text @employee.accounting_imputation.detalle, :at => [100,185],:style => :bold, :size => 10

    pdf.stroke_rectangle [5,170], 527, 3

    pdf.draw_text "Aseguradora:", :at => [5,155], :size => 9
    pdf.draw_text (@employee.insurance_company_id.blank? ? '' : @employee.insurance_company.detalle), :at => [100,155],:style => :bold, :size => 10

    pdf.draw_text "Nro.Poliza:", :at => [300,155], :size => 9
    pdf.draw_text @employee.Seguro_numero_poliza, :at => [400,200],:style => :bold, :size => 10

    pdf.draw_text "Monto Asegurado:", :at => [5,140], :size => 9
    pdf.draw_text @employee.seguro_monto_asegurado, :at => [100,140],:style => :bold, :size => 10

    pdf.draw_text "Seguro Conyuge:", :at => [300,140], :size => 9
    pdf.draw_text @employee.seguro_conyuge, :at => [400,140],:style => :bold, :size => 10

    pdf.draw_text "Bco.Deposito Haberes:", :at => [5,125], :size => 9
    pdf.draw_text @employee.bank_deposit.detalle, :at => [100,125],:style => :bold, :size => 10

    pdf.draw_text "Tipo Cuenta:", :at => [300,125], :size => 9
    pdf.draw_text @employee.bank_deposit_account_type.detalle, :at => [400,125],:style => :bold, :size => 10

    pdf.draw_text "Nro.Cuenta Bancaria:", :at => [5,110], :size => 9
    pdf.draw_text @employee.deposito_banco_cuenta, :at => [100,110],:style => :bold, :size => 10

    pdf.draw_text "C.B.U.:", :at => [300,110], :size => 9
    pdf.draw_text @employee.deposito_banco_cbu, :at => [400,110],:style => :bold, :size => 10

    pdf.stroke_rectangle [5,95], 527, 3

    pdf.draw_text "Numero de Cofre:", :at => [5,80], :size => 9
    pdf.draw_text @employee.numero_cofre, :at => [100,80],:style => :bold, :size => 10

    pdf.draw_text "Numero Tarjeta Fichaje:", :at => [300,80], :size => 9
    pdf.draw_text @employee.id_card, :at => [400,80],:style => :bold, :size => 10

    pdf.draw_text "Matricula Nacional:", :at => [5,65], :size => 9
    pdf.draw_text @employee.matricula_nacional, :at => [100,65],:style => :bold, :size => 10

    pdf.draw_text "Matricula Provincial:", :at => [300,65], :size => 9
    pdf.draw_text @employee.matricula_provincial, :at => [400,65],:style => :bold, :size => 10

    pdf.draw_text "Discapacidad:", :at => [5,50], :size => 9
    pdf.draw_text (@employee.discapacidad == "N" ? "No" : "Si"), :at => [100,50],:style => :bold, :size => 10
    pdf.render_file(filename)
  end

# ###################################################################################
  def format_number(n)
    if n.nil?
      n = ""
    else
      n = n.truncate.to_s.gsub(/(.)(?=.{3}+$)/, %q(\1,))+"."+((n.abs-n.abs.truncate)*100).truncate.to_s.rjust(2,"0")
    end
  end

end
