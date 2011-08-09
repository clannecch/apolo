class ReciboSueldosController < ApplicationController
  before_filter :find_liquidacion

  # GET /recibo_sueldos
  # GET /recibo_sueldos.xml
  def index
    @recibo_sueldos = @liquidacion.recibo_sueldos.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @recibo_sueldos }
    end
  end

  # GET /recibo_sueldos/1
  # GET /recibo_sueldos/1.xml
  def show
    @recibo_sueldo =  @liquidacion.recibo_sueldos.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @recibo_sueldo }
      format.pdf do
        dump_tmp_filename = Rails.root.join('tmp',@recibo_sueldo.cache_key)
          Dir.mkdir(dump_tmp_filename.dirname) unless File.directory?(dump_tmp_filename.dirname)
          print_to_pdf(dump_tmp_filename,@recibo_sueldo)
          send_file(dump_tmp_filename, :type => :pdf, :disposition => 'attachment', :filename => "recibo_sueldo.pdf")
          #File.delete(dump_tmp_filename)
      end
    end
  end

  # GET /recibo_sueldos/new
  # GET /recibo_sueldos/new.xml
  def new
    @recibo_sueldo =  @liquidacion.recibo_sueldos.build
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @recibo_sueldo }
    end
  end

  # GET /recibo_sueldos/1/edit
  def edit
    @recibo_sueldo =  @liquidacion.recibo_sueldos.find(params[:id])
  end

  # POST /recibo_sueldos
  # POST /recibo_sueldos.xml
  def create
    @recibo_sueldo =  @liquidacion.recibo_sueldos.build(params[:recibo_sueldo])

    respond_to do |format|
      if @recibo_sueldo.save
        format.html { redirect_to([@liquidacion, @recibo_sueldo], :notice => 'Recibo sueldo was successfully created.') }
        format.xml  { render :xml => @recibo_sueldo, :status => :created, :location => @recibo_sueldo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @recibo_sueldo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /recibo_sueldos/1
  # PUT /recibo_sueldos/1.xml
  def update
    @recibo_sueldo = @liquidacion.recibo_sueldos.find(params[:id])

    respond_to do |format|
      if @recibo_sueldo.update_attributes(params[:recibo_sueldo])
        format.html { redirect_to([@liquidacion, @recibo_sueldo], :notice => 'Recibo sueldo was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @recibo_sueldo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /recibo_sueldos/1
  # DELETE /recibo_sueldos/1.xml
  def destroy
    @recibo_sueldo = @liquidacion.recibo_sueldos.find(params[:id])
    @recibo_sueldo.destroy

    respond_to do |format|
      format.html { redirect_to(liquidacion_recibo_sueldos_url(@liquidacion)) }
      format.xml  { head :ok }
    end
  end


  def calculo_recibo
#    se carga con los datos de un recibo
    @recibo_sueldo = @liquidacion.recibo_sueldos.find(params[:id])
# llama al metodo calcular recibo que esta en el modelo
    @recibo_sueldo.calcular_recibo
# Muestra un mensaje en el caso que este todo ok (@recibo_sueldo.errors.empty?)
    flash.now[:notice] = "calculado correctamente" if @recibo_sueldo.errors.empty?

# Se llama a el formulario con el mismo nombre del metodo para que muestre un resultado
    respond_to do |format|
      format.html # calculo_recibo.html.erb
    end
  end

=begin
  def print
    respond_to do |format|
      format.pdf do
        print_to_pdf()
      end
    end
  end
=end

#  numero.truncate parte entera
  #"456778904".gsub(/(.)(?=.{3}+$)/, %q(\1,))

  def print_to_pdf(filename,entity)
    require 'prawn'
    @recibo_sueldo = @liquidacion.recibo_sueldos.find(params[:id])


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

# Logo
    pdf.bounding_box [1, 720], :width => 135, :height => 120 do
        pdf.stroke_bounds
    end
    pdf.image prawn_logo, :at => [27,715], :width => 75

    pdf.font("Courier", :style => :bold)
    pdf.draw_text logo_empresa.center(26), :at => [5,638], :size => 8  # columna, linea, tamaño estilo
    pdf.draw_text logo_domicilio, :at => [7,631], :size => 5
    @len = logo_domicilio.length
    pdf.draw_text logo_cuit.center(@len), :at => [7,623], :size => 5
    pdf.draw_text logo_inscripcion.center(@len), :at => [7,615], :size => 5
    pdf.draw_text logo_caja.center(@len), :at => [7,609], :size => 5

# Primer columna
    pdf.bounding_box [136, 720], :width => 170, :height => 10 do
        pdf.stroke_bounds
    end
    pdf.draw_text "Apellido y Nombres".center(55), :at => [136,713], :size => 5  # columna, linea, tamaño estilo
    pdf.bounding_box [136, 710], :width => 170, :height => 30 do
        pdf.stroke_bounds
    end
pdf.draw_text [@recibo_sueldo.employee.apellido, @recibo_sueldo.employee.nombre].compact.join(', ')[0..35].center(35), :at => [136,693],:style => :bold, :size => 8  # columna, linea, tamaño estilo

    pdf.bounding_box [136, 680], :width => 170, :height => 10 do
        pdf.stroke_bounds
    end
    pdf.draw_text "Categoria".center(28), :at => [136,673], :size => 5  # columna, linea, tamaño estilo
    pdf.bounding_box [136, 670], :width => 170, :height => 30 do
        pdf.stroke_bounds
    end
pdf.draw_text @recibo_sueldo.employee.category.detalle[0..35].strip.center(30), :at => [136,653],:style => :bold, :size => 8  # columna, linea, tamaño estilo

    pdf.bounding_box [136, 640], :width => 170, :height => 10 do
        pdf.stroke_bounds
    end
    pdf.draw_text "Tarea".center(70), :at => [117,633], :size => 5  # columna, linea, tamaño estilo
    pdf.bounding_box [136, 630], :width => 170, :height => 30 do
        pdf.stroke_bounds
    end
pdf.draw_text @recibo_sueldo.employee.task.detalle[0..35].strip.center(30), :at => [136,613],:style => :bold, :size => 8  # columna, linea, tamaño estilo
#

    pdf.bounding_box [306, 720], :width => 70, :height => 10 do
        pdf.stroke_bounds
    end
    pdf.draw_text "Legajo".center(20), :at => [307,713], :size => 5  # columna, linea, tamaño estilo
    pdf.bounding_box [306, 710], :width => 70, :height => 30 do
        pdf.stroke_bounds
    end
pdf.draw_text @recibo_sueldo.employee.legajo.strip.center(14), :at => [307,693],:style => :bold, :size => 8  # columna, linea, tamaño estilo

    pdf.bounding_box [306, 680], :width => 70, :height => 10 do
        pdf.stroke_bounds
    end
    pdf.draw_text "Basico".center(20), :at => [307,673], :size => 5  # columna, linea, tamaño estilo
    pdf.bounding_box [306, 670], :width => 70, :height => 30 do
        pdf.stroke_bounds
    end
if @recibo_sueldo.employee.remuneracion_fuera_convenio != 0
  @basico = @recibo_sueldo.employee.remuneracion_fuera_convenio
else
  @basico = @recibo_sueldo.employee.category.importe
end
#gsub(/(.)(?=.{3}+$)/, %q(\1,))
pdf.draw_text @basico.to_s.center(14), :at => [307,653],:style => :bold, :size => 8  # columna, linea, tamaño estilo

    pdf.bounding_box [306, 640], :width => 70, :height => 10 do
        pdf.stroke_bounds
    end
    pdf.draw_text "Seccion".center(20), :at => [307,633], :size => 5  # columna, linea, tamaño estilo
    pdf.bounding_box [306, 630], :width => 70, :height => 30 do
        pdf.stroke_bounds
    end
pdf.draw_text @recibo_sueldo.employee.section.detalle.center(14), :at => [307,613],:style => :bold, :size => 8  # columna, linea, tamaño estilo

#

    pdf.bounding_box [376, 720], :width => 70, :height => 10 do
        pdf.stroke_bounds
    end
    pdf.draw_text "Fecha de Ingreso".center(20), :at => [377,713], :size => 5  # columna, linea, tamaño estilo
    pdf.bounding_box [376, 710], :width => 70, :height => 30 do
        pdf.stroke_bounds
    end
pdf.draw_text @recibo_sueldo.employee.fecha_ingreso.to_s.center(14), :at => [377,693],:style => :bold, :size => 8  # columna, linea, tamaño estilo

    pdf.bounding_box [376, 680], :width => 70, :height => 10 do
        pdf.stroke_bounds
    end
    pdf.draw_text "Fecha de Pago".center(20), :at => [376,673], :size => 5  # columna, linea, tamaño estilo
    pdf.bounding_box [376, 670], :width => 70, :height => 30 do
        pdf.stroke_bounds
    end
pdf.draw_text @liquidacion.fecha_liquidacion.to_s.center(14), :at => [377,653],:style => :bold, :size => 8  # columna, linea, tamaño estilo

    pdf.bounding_box [376, 640], :width => 70, :height => 10 do
        pdf.stroke_bounds
    end
    pdf.draw_text "Periodo Abonado".center(20), :at => [377,633], :size => 5  # columna, linea, tamaño estilo
    pdf.bounding_box [376, 630], :width => 70, :height => 30 do
        pdf.stroke_bounds
    end
#pdf.draw_text @liquidacion. .to_s.center(14), :at => [377,613],:style => :bold, :size => 8  # columna, linea, tamaño estilo
#

    pdf.bounding_box [446, 720], :width => 90, :height => 10 do
        pdf.stroke_bounds
    end
    pdf.draw_text "Tipo y Nro.Documento".center(30), :at => [442,713], :size => 5  # columna, linea, tamaño estilo
    pdf.bounding_box [446, 710], :width => 90, :height => 30 do
        pdf.stroke_bounds
    end

    pdf.bounding_box [446, 680], :width => 90, :height => 10 do
        pdf.stroke_bounds
    end
    pdf.draw_text "C.U.I.L.".center(30), :at => [442,673], :size => 5  # columna, linea, tamaño estilo
    pdf.bounding_box [446, 670], :width => 90, :height => 30 do
        pdf.stroke_bounds
    end

    pdf.bounding_box [446, 640], :width => 90, :height => 10 do
        pdf.stroke_bounds
    end
    pdf.draw_text "Centro de Costos".center(30), :at => [442,633], :size => 5  # columna, linea, tamaño estilo
    pdf.bounding_box [446, 630], :width => 90, :height => 30 do
        pdf.stroke_bounds
    end

# dibujo grillapara detalle
# Recuadro interno
    pdf.bounding_box [5, 595], :width => 525, :height => 500 do
        pdf.stroke_bounds
    end

    pdf.bounding_box [5, 595], :width => 190, :height => 10 do
        pdf.stroke_bounds
    end
    pdf.draw_text "DETALLE DE CONCEPTOS".center(53), :at => [5,588], :size => 6  # columna, linea, tamaño estilo
    pdf.bounding_box [5,585], :width => 190, :height => 440 do
      pdf.stroke_bounds
    end
#
    pdf.bounding_box [195, 595], :width => 50, :height => 10 do
        pdf.stroke_bounds
    end
    pdf.draw_text "CANT./ PORC.".center(14), :at => [195,588], :size => 6  # columna, linea, tamaño estilo
    pdf.bounding_box [195,585], :width => 50, :height => 440 do
      pdf.stroke_bounds
    end
#
    pdf.bounding_box [245, 595], :width => 95, :height => 10 do
        pdf.stroke_bounds
    end
    pdf.draw_text "HABERES CON APORTE".center(26), :at => [245,588], :size => 6  # columna, linea, tamaño estilo
    pdf.bounding_box [245,585], :width => 95, :height => 450 do
      pdf.stroke_bounds
    end
#
    pdf.bounding_box [340, 595], :width => 95, :height => 10 do
        pdf.stroke_bounds
    end
    pdf.draw_text "HABERES SIN APORTE".center(26), :at => [340,588], :size => 6  # columna, linea, tamaño estilo
    pdf.bounding_box [340,585], :width => 95, :height => 450 do
      pdf.stroke_bounds
    end

#
    pdf.bounding_box [435, 595], :width =>   95, :height => 10 do
        pdf.stroke_bounds
    end
    pdf.draw_text "DEDUCCIONES".center(26), :at => [435,588], :size => 6  # columna, linea, tamaño estilo
    pdf.bounding_box [435,585], :width => 95, :height => 450 do
      pdf.stroke_bounds
    end

# Linea de totales
#
    pdf.bounding_box [5, 145], :width =>   240, :height => 10 do
        pdf.stroke_bounds
    end
    pdf.draw_text "ULTIMO DEPOSITO DE CARGAS EXTRAS".center(67), :at => [5,138], :size => 6  # columna, linea, tamaño estilo

    pdf.bounding_box [5, 135], :width =>   525, :height => 10 do
        pdf.stroke_bounds
    end

    pdf.bounding_box [5, 135], :width =>   40, :height => 40 do
        pdf.stroke_bounds
    end
    pdf.draw_text "LAPSO".center(11), :at => [5,128], :size => 6  # columna, linea, tamaño estilo

    pdf.bounding_box [45, 135], :width =>   70, :height => 40 do
        pdf.stroke_bounds
    end
    pdf.draw_text "FECHA DEL DEPOSITO".center(19), :at => [45,128], :size => 6  # columna, linea, tamaño estilo

    pdf.bounding_box [115, 135], :width =>   130, :height => 40 do
        pdf.stroke_bounds
    end
    pdf.draw_text "BANCO".center(36), :at => [115,128], :size => 6  # columna, linea, tamaño estilo

    pdf.bounding_box [245, 135], :width =>   95, :height => 40 do
        pdf.stroke_bounds
    end
    pdf.draw_text "TOTAL HABERES C/APORTES".center(26), :at => [245,128], :size => 6  # columna, linea, tamaño estilo

    pdf.bounding_box [340, 135], :width =>   95, :height => 40 do
        pdf.stroke_bounds
    end
    pdf.draw_text "TOTAL HABERSES S/APORTES".center(26), :at => [340,128], :size => 6  # columna, linea, tamaño estilo


    pdf.bounding_box [435, 135], :width =>   95, :height => 40 do
        pdf.stroke_bounds
    end
    pdf.draw_text "TOTAL DEDUCCIONES".center(26), :at => [435,128], :size => 6  # columna, linea, tamaño estilo

    pdf.bounding_box [435, 95], :width =>   95, :height => 10 do
        pdf.stroke_bounds
    end
    pdf.draw_text "NETO A COBRAR".center(26), :at => [435,87], :size => 6  # columna, linea, tamaño estilo
    pdf.bounding_box [435, 85], :width =>   95, :height => 30 do
        pdf.stroke_bounds
    end


    pdf.draw_text "Recibi conforme la suma de Pesos:", :at => [5,85], :size => 5  # columna, linea, tamaño estilo

    pdf.draw_text "  En concepto de mis Haberes correspondientes al periodo arriba indicado y", :at => [5,44], :size => 5  # columna, linea, tamaño estilo
    pdf.draw_text "segun la presente liquidacion. Dejano constancia de haber recibido una", :at => [5,37], :size => 5  # columna, linea, tamaño estilo
    pdf.draw_text "copia fiel de este recibo de acuerdo a la ley 20.744(T.O.) - Art.140", :at => [5,30], :size => 5  # columna, linea, tamaño estilo

    pdf.draw_text "Importe depositado en "+"Banco del deposito", :at => [5,15], :size => 5  # columna, linea, tamaño estilo
    pdf.draw_text "Caja de ahorro Nro.: "+"caja de ahorro del empleado", :at => [5,8], :size => 5  # columna, linea, tamaño estilo



    pdf.draw_text "________________________________________", :at => [400,23], :size => 5  # columna, linea, tamaño estilo
    pdf.draw_text "Por NOMBRE DE LA EMPRESA".center(40), :at => [400,17], :size => 5  # columna, linea, tamaño estilo
    pdf.draw_text "Nombre del que firma".center(40), :at => [400,10], :size => 5  # columna, linea, tamaño estilo
    pdf.draw_text "cargo del que firma".center(40), :at => [400,3], :size => 5  # columna, linea, tamaño estilo

    @banda = 700
    pdf.render_file(filename)
  end


  protected

  def find_liquidacion
    raise "Debe ingresar una liquidacion!!!!!!!!!!!" if params[:liquidacion_id].blank?
    @liquidacion = Liquidacion.find(params[:liquidacion_id])
  end

end
