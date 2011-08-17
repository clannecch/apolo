class LiquidacionsController < ApplicationController
  before_filter :find_liquidacion, :except => [:index, :new, :create]

  # GET /liquidacions
  # GET /liquidacions.xml
  def index
    @search = Liquidacion.by_company(current_company.id).search(params[:search])
    @liquidacions = @search.page(params[:page]).per(10)

    respond_to do |format|
      format.html # indexoo.html.erb
      format.xml  { render :xml => @liquidacions }
    end
  end

  # GET /liquidacions/1
  # GET /liquidacions/1.xml
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @liquidacion }
      format.pdf do
        dump_tmp_filename = Rails.root.join('tmp',@liquidacion.cache_key)
          Dir.mkdir(dump_tmp_filename.dirname) unless File.directory?(dump_tmp_filename.dirname)
          print_libro_pdf(dump_tmp_filename,@liquidacion)
          send_file(dump_tmp_filename, :type => :pdf, :disposition => 'attachment', :filename => "librosueldos.pdf")
          #File.delete(dump_tmp_filename)
      end
    end
  end

  # GET /liquidacions/new
  # GET /liquidacions/new.xml
  def new
    @liquidacion = Liquidacion.by_company(current_company.id).new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @liquidacion }
    end
  end

  # GET /liquidacions/1/edit
  def edit
  end

  # POST /liquidacions
  # POST /liquidacions.xml
  def create
    @liquidacion = Liquidacion.by_company(current_company.id).new(params[:liquidacion])

    respond_to do |format|
      if @liquidacion.save
        format.html { redirect_to(@liquidacion, :notice => 'Liquidacion was successfully created.') }
        format.xml  { render :xml => @liquidacion, :status => :created, :location => @liquidacion }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @liquidacion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /liquidacions/1
  # PUT /liquidacions/1.xml
  def update

    respond_to do |format|
      if @liquidacion.update_attributes(params[:liquidacion])
        format.html { redirect_to(@liquidacion, :notice => 'Liquidacion was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @liquidacion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /liquidacions/1
  # DELETE /liquidacions/1.xml
  def destroy
    @liquidacion.destroy

    respond_to do |format|
      format.html { redirect_to(liquidacions_url) }
      format.xml  { head :ok }
    end
  end
  def find_liquidacion
      @liquidacion = Liquidacion.by_company(current_company.id).find(params[:id])
  end

# #################################################################################
  def print_libro_pdf(filename,entity)
    require 'prawn'
    @recibo_sueldos = @liquidacion.recibo_sueldos.all

    img = "hsjd2.jpg"

    pdf = Prawn::Document.new(:left_margin => 35, :top_margin => 35,:page_size   => "LETTER",
                              :background => img,
                              :page_layout => :landscape)
    prawn_logo = "hsjd.jpg"
    logo_empresa ="CASA NUESTA SRA. DEL PILAR"
    logo_domicilio = "Julio A. Roca 501 - 6700-Lujan (BA)"
    logo_cuit = "C.U.I.T.: "+"30-67932805-7"
    logo_inscripcion = "Nro.Inscripcion: " + "21.757"
    logo_caja = "Caja: 11" + "Ex Caja Serv. Publico"
    offset = 0

    primer_hoja = 0
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
          linea << [ '', '','','','']
          if h.remunerative_concept.acumuladores_valor.upcase.include?("SINDESCUENTO")
             haberes_sd = haberes_sd + 1
             linea[haberes_sd][3]   =    h.remunerative_concept.codigol.strip.ljust(6) + format_number(h.total).strip.rjust(20)
             total_haberes_sd = total_haberes_sd + h.total
          else
             haberes_cd = haberes_cd + 1
             linea[haberes_cd][2]   =    h.remunerative_concept.codigo.strip.ljust(6) + format_number(h.total).strip.rjust(20)
             total_haberes_cd = total_haberes_cd + h.total
          end
        end
      end

      r.detalle_recibo_retencions.each do |r|
        if r.total.to_f != 0
          retenciones = retenciones + 1
          if retenciones > haberes_cd and retenciones > heberes_sd
            linea << ['','' , '','','']
          end
          linea[retenciones][4]   =    r.retention_concept.codigo.to_s + "  " +format_number(r.total).rjust(20)
          total_retention = total_retention + r.total
        end
      end

      if haberes_cd >= 0 or haberes_sd  >= 0 or retenciones >= 0
        if offset < 20
          if primer_hoja == 0
            primer_hoja = 1
          else
            pdf.start_new_page
          end
          pdf.bounding_box [1, 550], :width => 730, :height => 550 do
              pdf.stroke_bounds
          end
          pdf.draw_text "Libro de Sueldos y Jornales Ley 20.744".center(200), :at => [5,560],:style => :bold, :size => 11
          pdf.draw_text ( logo_empresa.strip+" - "+logo_cuit.strip).center(250), :at => [5, 535], :size => 8, :style => :bold
          pdf.draw_text "Periodo de Liquidacion :", :at => [10,530], :size => 8
          pdf.draw_text @liquidacion.periodo.strftime("%m/%Y"), :at => [100, 530], :size => 8, :style => :bold
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
          pdf.draw_text "       C.U.I.L                Categoria             F. Egreso", :at => [46, 490], :size => 10
#          pdf.bounding_box [98, 500], :width => 30, :height => 15 do
#              pdf.stroke_bounds
#          end
          pdf.bounding_box [128, 500], :width => 85, :height => 15 do
              pdf.stroke_bounds
          end
#          pdf.bounding_box [213, 515], :width => 53, :height => 15 do
#                pdf.stroke_bounds
#          end
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

        linea[0][0] = r.employee.legajo.ljust(9) + " " +  (r.employee.apellido.strip+", "+r.employee.nombre.strip).ljust(39)
        linea[0][1] = r.employee.fecha_ingreso.strftime("%d/%m/%Y")
        if haberes_cd < 1 and haberes_sd < 1 and retenciones < 1
          linea << ['','' , '','','']
        end
        linea[1][0] = "             " + # r.employee.document_type.detalle[0..2].center(3) +
            " " + r.employee.cuil.strip.ljust(18)    +
            r.employee.category.detalle[0..17].ljust(19)

        if r.employee.fecha_egreso.nil?

        else
           linea[1][1] =  r.employee.fecha_egreso.strftime("%d/%m/%Y")
        end

        linea.each do |l|
          offset = offset - 10
          pdf.draw_text  l[0] , :at => [7, offset], :size => 10
          pdf.draw_text  l[1] , :at => [212, offset], :size => 10
          pdf.draw_text  l[2] , :at => [267, offset], :size => 10
          pdf.draw_text  l[3] , :at => [372, offset], :size => 10
          pdf.draw_text  l[4] , :at => [477, offset], :size => 10
        end
        pdf.draw_text  format_number(total_haberes_sd+total_haberes_cd-total_retention).strip.rjust(20) , :at => [570, offset], :size => 10
        pdf.draw_text  format_number(acumulado_anual(@liquidacion.periodo, r.employee_id) ).strip.rjust(20) , :at => [645, offset], :size => 10
        offset = offset -10
      end
    end
# Recuadro exterior


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

  def acumulado_anual(pl, employee_id)
    ntotalh = DetalleReciboHaber.joins([:recibo_sueldo => :liquidacion])
              .where(:recibo_sueldos => {:employee_id => employee_id})
              .where(:liquidacions => {:periodo => pl.beginning_of_year..pl.end_of_month}).sum(:total)

    ntotalr = DetalleReciboRetencion.joins([:recibo_sueldo => :liquidacion])
              .where(:recibo_sueldos => {:employee_id => employee_id})
              .where(:liquidacions => {:periodo => pl.beginning_of_year..pl.end_of_month}).sum(:total)
    return ntotalh - ntotalr
  end

end
