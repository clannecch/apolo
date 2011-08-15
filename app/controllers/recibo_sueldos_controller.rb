class ReciboSueldosController < ApplicationController
  before_filter :find_liquidacion

  # GET /recibo_sueldos
  # GET /recibo_sueldos.xml
  def index
#    @recibo_sueldos = @liquidacion.recibo_sueldos.all
    @search = @liquidacion.recibo_sueldos.search(params[:search])
    @recibo_sueldos = @search.page(params[:page])#.per(10)

    respond_to do |format|
      format.html
      format.xml  { render :xml => @recibo_sueldos }
      format.pdf do
        dump_tmp_filename = Rails.root.join('tmp',@recibo_sueldos.first.cache_key)
          Dir.mkdir(dump_tmp_filename.dirname) unless File.directory?(dump_tmp_filename.dirname)
          print_libro_pdf(dump_tmp_filename,@liquidacion)
          send_file(dump_tmp_filename, :type => :pdf, :disposition => 'attachment', :filename => "librosueldos.pdf")
          #File.delete(dump_tmp_filename)
      end
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
    pdf.draw_text "APELLIDO Y NOMBRES".center(55), :at => [136,713], :size => 5  # columna, linea, tamaño estilo
    pdf.bounding_box [136, 710], :width => 170, :height => 30 do
        pdf.stroke_bounds
    end

    pdf.bounding_box [136, 680], :width => 170, :height => 10 do
        pdf.stroke_bounds
    end
    pdf.draw_text "CATEGORIA".center(28), :at => [136,673], :size => 5  # columna, linea, tamaño estilo
    pdf.bounding_box [136, 670], :width => 170, :height => 30 do
        pdf.stroke_bounds
    end

    pdf.bounding_box [136, 640], :width => 170, :height => 10 do
        pdf.stroke_bounds
    end
    pdf.draw_text "TAREA".center(70), :at => [117,633], :size => 5  # columna, linea, tamaño estilo
    pdf.bounding_box [136, 630], :width => 170, :height => 30 do
        pdf.stroke_bounds
    end
#

    pdf.bounding_box [306, 720], :width => 70, :height => 10 do
        pdf.stroke_bounds
    end
    pdf.draw_text "LEGAJO".center(20), :at => [307,713], :size => 5  # columna, linea, tamaño estilo
    pdf.bounding_box [306, 710], :width => 70, :height => 30 do
        pdf.stroke_bounds
    end

    pdf.bounding_box [306, 680], :width => 70, :height => 10 do
        pdf.stroke_bounds
    end
    pdf.draw_text "BASICO".center(20), :at => [307,673], :size => 5  # columna, linea, tamaño estilo
    pdf.bounding_box [306, 670], :width => 70, :height => 30 do
        pdf.stroke_bounds
    end

    pdf.bounding_box [306, 640], :width => 70, :height => 10 do
        pdf.stroke_bounds
    end
    pdf.draw_text "SECCION".center(20), :at => [307,633], :size => 5  # columna, linea, tamaño estilo
    pdf.bounding_box [306, 630], :width => 70, :height => 30 do
        pdf.stroke_bounds
    end

#

    pdf.bounding_box [376, 720], :width => 70, :height => 10 do
        pdf.stroke_bounds
    end
    pdf.draw_text "FECHA DE INGRESO".center(20), :at => [377,713], :size => 5  # columna, linea, tamaño estilo
    pdf.bounding_box [376, 710], :width => 70, :height => 30 do
        pdf.stroke_bounds
    end

    pdf.bounding_box [376, 680], :width => 70, :height => 10 do
        pdf.stroke_bounds
    end
    pdf.draw_text "FECHA DE PAGO".center(20), :at => [376,673], :size => 5  # columna, linea, tamaño estilo
    pdf.bounding_box [376, 670], :width => 70, :height => 30 do
        pdf.stroke_bounds
    end

    pdf.bounding_box [376, 640], :width => 70, :height => 10 do
        pdf.stroke_bounds
    end
    pdf.draw_text "PERIODO ABONADO".center(20), :at => [377,633], :size => 5
    pdf.bounding_box [376, 630], :width => 70, :height => 30 do
        pdf.stroke_bounds
    end

#
    pdf.bounding_box [446, 720], :width => 90, :height => 10 do
        pdf.stroke_bounds
    end
    pdf.draw_text "TIPO Y NUMERO DE DOCUMENTO".center(30), :at => [442,713], :size => 5
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
    pdf.draw_text "CENTRO DE COSTO".center(30), :at => [442,633], :size => 5  # columna, linea, tamaño estilo
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

    pdf.bounding_box [5, 135], :width =>   45, :height => 40 do
        pdf.stroke_bounds
    end
    pdf.draw_text "LAPSO".center(15), :at => [5,128], :size => 6  # columna, linea, tamaño estilo

    pdf.bounding_box [50, 135], :width =>   70, :height => 40 do
        pdf.stroke_bounds
    end
    pdf.draw_text "FECHA DEL DEPOSITO".center(19), :at => [52,128], :size => 6  # columna, linea, tamaño estilo

    pdf.bounding_box [120, 135], :width =>   125, :height => 40 do
        pdf.stroke_bounds
    end
    pdf.draw_text "BANCO".center(36), :at => [120,128], :size => 6  # columna, linea, tamaño estilo

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

    pdf.draw_text [@recibo_sueldo.employee.apellido, @recibo_sueldo.employee.nombre].compact.join(', ')[0..28].center(28), :at => [138,693],:style => :bold, :size => 10
    pdf.draw_text @recibo_sueldo.employee.category.detalle[0..28].strip.center(28), :at => [136,653],:style => :bold, :size => 10
    pdf.draw_text @recibo_sueldo.employee.task.detalle[0..328].strip.center(28), :at => [136,613],:style => :bold, :size => 10
    pdf.draw_text @recibo_sueldo.employee.legajo.strip.center(11), :at => [307,693],:style => :bold, :size =>10
    if @recibo_sueldo.employee.remuneracion_fuera_convenio != 0
      @basico = @recibo_sueldo.employee.remuneracion_fuera_convenio
    else
      @basico = @recibo_sueldo.employee.category.importe
    end
    #n.truncate.to_s.gsub(/(.)(?=.{3}+$)/, %q(\1,))+"."+((n-n.truncate)*100).truncate.to_s
    #@basico = @basico.truncate.to_s.gsub(/(.)(?=.{3}+$)/, %q(\1,))+"."+((@basico-@basico.truncate)*100).truncate.to_s
    pdf.draw_text format_number(@basico).strip.center(11), :at => [307,653],:style => :bold, :size => 10
    pdf.draw_text @recibo_sueldo.employee.section.detalle.center(11), :at => [307,613],:style => :bold, :size => 10
    pdf.draw_text @recibo_sueldo.employee.fecha_ingreso.strftime("%d/%m/%Y").center(11), :at => [377,693],:style => :bold, :size => 10
    pdf.draw_text @liquidacion.fecha_liquidacion.strftime("%d/%m/%Y").center(11), :at => [377,653],:style => :bold, :size => 10
    pdf.draw_text @liquidacion.periodo.strftime("%m/%Y").center(11), :at => [377,613],:style => :bold, :size => 10
    pdf.draw_text (@recibo_sueldo.employee.document_type.detalle[0..5]+" "+@recibo_sueldo.employee.numero_documento.to_i.to_s).center(15), :at => [448,693],:style => :bold, :size => 10
    pdf.draw_text @recibo_sueldo.employee.cuil.center(15), :at => [446,650],:style => :bold, :size => 10
    pdf.draw_text @recibo_sueldo.employee.cost_center.detalle.center(15), :at => [446,613],:style => :bold, :size => 10
    offset = 570
    total_remunerative_concept_ca = 0
    total_remunerative_concept_sa = 0

    @recibo_sueldo.detalle_recibo_habers.each do |h|
      pdf.draw_text h.remunerative_concept.detalle[0..31], :at => [8,offset],:style => :bold, :size => 10
      pdf.draw_text format_number(h.cantidad_recibo).rjust(8), :at => [195,offset],:style => :bold, :size => 10
      if h.remunerative_concept.acumuladores_valor.upcase.include?("SINDESCUENTO")
        column = 340
        total_remunerative_concept_sa += h.total
      else
        column = 245
        total_remunerative_concept_ca += h.total
      end
      pdf.draw_text format_number(h.total).rjust(15), :at => [column,offset],:style => :bold, :size => 10
      offset = offset - 10
    end
    total_retention = 0
    @recibo_sueldo.detalle_recibo_retencions.each do |r|
      pdf.draw_text r.retention_concept.detalle[0..31], :at => [8,offset],:style => :bold, :size => 10
      pdf.draw_text format_number(r.cantidad).rjust(8), :at => [195,offset],:style => :bold, :size => 10
      pdf.draw_text format_number(r.total).rjust(15), :at => [435,offset],:style => :bold, :size => 10
      offset = offset - 10
      total_retention += r.total
    end
    pdf.draw_text @liquidacion.periodo_deposito.strftime("%m/%Y").rjust(6),
                                  :at => [7,108],:style => :bold, :size => 10
    pdf.draw_text @liquidacion.fecha_deposito.strftime("%d/%m/%Y"),
                                  :at => [53,108],:style => :bold, :size => 10

    if @liquidacion.bank_deposit.detalle.nil?
    offset=offset
    else
      pdf.draw_text @liquidacion.bank_deposit.detalle[0..21].center(21) ,
                                :at => [115,108],:style => :bold, :size => 10
    end
    pdf.draw_text format_number(total_remunerative_concept_ca).rjust(15), :at => [245,108],:style => :bold, :size => 10
    pdf.draw_text format_number(total_remunerative_concept_sa).rjust(15), :at => [340,108],:style => :bold, :size => 10
    pdf.draw_text format_number(total_retention).rjust(15), :at => [435,108],:style => :bold, :size => 10

    pdf.draw_text format_number(total_remunerative_concept_sa+total_remunerative_concept_ca-total_retention).rjust(15), :at => [435,65],:style => :bold, :size => 10
    pdf.draw_text numero_a_palabras(total_remunerative_concept_sa+total_remunerative_concept_ca-total_retention).capitalize , :at => [8,60],:style => :bold, :size => 10
    pdf.render_file(filename)
  end

# #################################################################################
  def print_libro_pdf(filename,entity)
    require 'prawn'
    @recibo_sueldos = @liquidacion.recibo_sueldos.all


    pdf = Prawn::Document.new(:left_margin => 35, :top_margin => 35,:page_size   => "LETTER",
                                :page_layout => :landscape)
    prawn_logo = "hsjd.jpg"
    logo_empresa ="CASA NUESTA SRA. DEL PILAR"
    logo_domicilio = "Julio A. Roca 501 - 6700-Lujan (BA)"
    logo_cuit = "C.U.I.T.: "+"30-67932805-7"
    logo_inscripcion = "Nro.Inscripcion: " + "21.757"
    logo_caja = "Caja: 11" + "Ex Caja Serv. Publico"
    hoja_inicial_pedida_en_vista = 101
    offset = 0

    hoja = hoja_inicial_pedida_en_vista
    linea_nombre = true
    linea_documento = true
    @recibo_sueldos.each do |r|
      linea = []

      haberes_cd= -1
      haberes_sd=-1
      retenciones= -1

      total_retention = 0
      total_haberes_cd = 0
      total_haberes_sd = 0

      r.detalle_recibo_habers.each do |h|
        if h.total.to_f != 0
          linea << [ '', '','','']
          if h.remunerative_concept.acumuladores_valor.upcase.include?("SINDESCUENTO")
             haberes_sd = haberes_sd + 1
             linea[haberes_sd][2]   =    h.remunerative_concept.codigol.strip.ljust(6) + format_number(h.total).strip.rjust(20)
             total_haberes_sd = total_haberes_sd + h.total
          else
             haberes_cd = haberes_cd + 1
             linea[haberes_cd][1]   =    h.remunerative_concept.codigo.strip.ljust(6) + format_number(h.total).strip.rjust(20)
             total_haberes_cd = total_haberes_cd + h.total
          end
        end
      end

      r.detalle_recibo_retencions.each do |r|
        if r.total.to_f != 0
          retenciones = retenciones + 1
          if retenciones > haberes_cd and retenciones > heberes_sd
            linea << ['','' , '','']
          end
          linea[retenciones][3]   =    r.retention_concept.codigo.to_s + "  "+format_number(r.total).rjust(20)
          total_retention = total_retention + r.total
        end
      end

      if haberes_cd >= 0 or haberes_sd  >= 0 or retenciones >= 0
        if offset < 20
          if hoja != hoja_inicial_pedida_en_vista
            pdf.start_new_page
          end
          pdf.bounding_box [1, 550], :width => 730, :height => 405 do
              pdf.stroke_bounds
          end
          pdf.draw_text "Libro de Sueldos y Jornales Ley 20.744".center(200), :at => [5,560],:style => :bold, :size => 11
          pdf.draw_text ( logo_empresa.strip+" - "+logo_cuit.strip).center(250), :at => [5, 535], :size => 8, :style => :bold
          pdf.draw_text "Periodo de Liquidacion :", :at => [10,530], :size => 8
          pdf.draw_text @liquidacion.periodo.strftime("%m/%Y"), :at => [100, 530], :size => 8, :style => :bold
          pdf.draw_text "Hoja :", :at => [680, 530], :size => 8
          pdf.draw_text hoja.to_s.rjust(5,'0'), :at => [702, 530], :size => 8, :style => :bold
          pdf.draw_text "Quincena:          -  Fecha de Liquidacion:", :at => [10, 520], :size => 8
          pdf.draw_text @liquidacion.quincena.to_s , :at => [50 , 520], :size => 8, :style => :bold
          pdf.draw_text @liquidacion.fecha_liquidacion.strftime("%d/%m/%Y") , :at => [160 , 520], :size => 8, :style => :bold

          pdf.bounding_box [5, 515], :width => 722, :height => 30 do
              pdf.stroke_bounds
          end
          pdf.draw_text "Legajo", :at => [10, 498], :size => 10
          pdf.bounding_box [45, 515], :width => 168, :height => 30 do
              pdf.stroke_bounds
          end
          pdf.draw_text "Apellido y nombre                   F. Ingreso", :at => [85, 505], :size => 10
          pdf.draw_text "Remuneraciones c/desc        Remuneraciones s/desc                Retenciones", :at => [276, 505], :size => 8
          pdf.bounding_box [45, 500], :width => 168, :height => 15 do
              pdf.stroke_bounds
          end
          pdf.draw_text "Documento  Nac.   E.Civ.   Categoria   F. Egreso", :at => [46, 490], :size => 10
          pdf.bounding_box [98, 500], :width => 30, :height => 15 do
              pdf.stroke_bounds
          end
          pdf.bounding_box [128, 500], :width => 30, :height => 15 do
              pdf.stroke_bounds
          end
          pdf.bounding_box [213, 515], :width => 53, :height => 15 do
                pdf.stroke_bounds
          end
          pdf.bounding_box [213, 500], :width => 53, :height => 15 do
              pdf.stroke_bounds
          end
          pdf.draw_text "Codigo        Importe          Codigo         Importe         Codigo        Importe", :at => [266, 490], :size => 9

          pdf.bounding_box [266, 500], :width => 30, :height => 15 do
              pdf.stroke_bounds
          end

          pdf.bounding_box [370, 515], :width => 105, :height => 30 do
             pdf.stroke_bounds
          end
          pdf.bounding_box [370, 500], :width => 30, :height => 15 do
              pdf.stroke_bounds
          end

          pdf.bounding_box [213, 500], :width => 362, :height => 15 do
             pdf.stroke_bounds
          end
          pdf.bounding_box [575, 515], :width => 74, :height => 30 do
              pdf.stroke_bounds
          end
          pdf.bounding_box [475, 500], :width => 30, :height => 15 do
              pdf.stroke_bounds
          end
          pdf.draw_text "T o t a l", :at => [590, 505], :size => 10
          pdf.draw_text "R e c i b o", :at => [587, 490], :size => 10
          pdf.draw_text "A c u m u l a d o", :at => [652, 505], :size => 10
          pdf.draw_text "    A n u a l    ", :at => [652, 490], :size => 10

          offset = 485
          linea_nombre = true
        end

        linea[0][0] = r.employee.legajo.ljust(9) + " " +  (r.employee.apellido.strip+", "+r.employee.nombre.strip).ljust(39) + "  " +
                  r.employee.fecha_ingreso.strftime("%d/%m/%Y")
        if haberes_cd < 1 and haberes_sd < 1 and retenciones < 1
          linea << ['','' , '','']
        end
        linea[1][0] = "             " + # r.employee.document_type.detalle[0..2].center(3) +
            " " + r.employee.numero_documento.to_i.to_s.strip.ljust(12)    +
             r.employee.nationality.detalle[0..3].ljust(6) +
             r.employee.marital_status.detalle[0..3].ljust(8) +
            r.employee.category.detalle[0..9].ljust(11)            +
            r.employee.fecha_egreso.strftime("%d/%m/%Y")

        linea.each do |l|
          offset = offset - 10
          pdf.draw_text  l[0] , :at => [7, offset], :size => 10
          pdf.draw_text  l[1] , :at => [267, offset], :size => 10
          pdf.draw_text  l[2] , :at => [372, offset], :size => 10
          pdf.draw_text  l[3] , :at => [477, offset], :size => 10
        end
        pdf.draw_text  format_number(total_haberes_sd+total_haberes_cd-total_retention).strip.rjust(20) , :at => [570, offset], :size => 10
        pdf.draw_text  format_number(acumulado_anual(@liquidacion_periodo, r.employee_id) ).strip.rjust(20) , :at => [645, offset], :size => 10

      end
    end
# Recuadro exterior


    pdf.render_file(filename)
  end

# ###################################################################################
  def acumulado_anual(pl, employee_id)
  ntotal = 999999
  return ntotal
  end


  def format_number(n)
    if n.nil?
      n = ""
    else
      n = n.truncate.to_s.gsub(/(.)(?=.{3}+$)/, %q(\1,))+"."+((n.abs-n.abs.truncate)*100).truncate.to_s.rjust(2,"0")
    end
  end

  def numero_a_palabras(numero)
    de_tres_en_tres = numero.to_i.to_s.reverse.scan(/\d{1,3}/).map{|n| n.reverse.to_i}

    millones = [
      {true => nil, false => nil},
      {true => 'millon', false => 'millones'},
      {true => "billon", false => "billones"},
      {true => "trillon", false => "trillones"}
    ]

    centena_anterior = 0
    contador = -1
    palabras = de_tres_en_tres.map do |numeros|
      contador += 1
      if contador%2 == 0
        centena_anterior = numeros
        [centena_a_palabras(numeros), millones[contador/2][numeros==1]].compact if numeros > 0
      elsif centena_anterior == 0
        [centena_a_palabras(numeros), "mil", millones[contador/2][false]].compact if numeros > 0
      else
        [centena_a_palabras(numeros), "mil"] if numeros > 0
      end
    end

    palabras.compact.reverse.join(' ') + " con "+((numero - numero.truncate)*100).to_i.to_s.rjust(2,"0") + "/100"
  end

  def centena_a_palabras(numero)
    especiales = {
      11 => 'once', 12 => 'doce', 13 => 'trece', 14 => 'catorce', 15 => 'quince',
      10 => 'diez', 20 => 'veinte', 100 => 'cien'
    }
    if especiales.has_key?(numero)
      return especiales[numero]
    end

    centenas = [nil, 'ciento', 'doscientos', 'trescientos', 'cuatrocientos', 'quinientos', 'seiscientos', 'setecientos', 'ochocientos', 'novecientos']
    decenas = [nil, 'dieci', 'veinti', 'treinta', 'cuarenta', 'cincuenta', 'sesenta', 'setenta', 'ochenta', 'noventa']
    unidades = [nil, 'un', 'dos', 'tres', 'cuatro', 'cinco', 'seis', 'siete', 'ocho', 'nueve']

    centena, decena, unidad = numero.to_s.rjust(3,'0').scan(/\d/).map{|i| i.to_i}

    palabras = []
    palabras << centenas[centena]

    if especiales.has_key?(decena*10 + unidad)
      palabras << especiales[decena*10 + unidad]
    else
      tmp = "#{decenas[decena]}#{' y ' if decena > 2 && unidad > 0}#{unidades[unidad]}"
      palabras << (tmp.blank? ? nil : tmp)
    end

    palabras.compact.join(' ')
  end
  protected

  def find_liquidacion
    raise "Debe ingresar una liquidacion!!!!!!!!!!!" if params[:liquidacion_id].blank?
    @liquidacion = Liquidacion.find(params[:liquidacion_id])
  end

end
