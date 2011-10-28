class LiquidacionsController < ApplicationController
  before_filter :find_liquidacion, :except => [:index, :new, :create, :control_by_company_list]

  # GET /liquidacions
  # GET /liquidacions.xml
  def index
    @search = Liquidacion.by_company(current_company.id).search(params[:search])
    @liquidacions = @search.page(params[:page]).per(10)

    respond_to do |format|
      format.html # indexoo.html.erb
      format.xml  { render :xml => @liquidacions }
#      format.text do
#        render :text => @liquidacions.first.periodo
#      end
    end
  end

  # GET /liquidacions/1
  # GET /liquidacions/1.xml
  def show

    respond_to do |format|
      format.html # show.html.erb
#      format.xml  { render :xml => @liquidacion }
      format.xml  do
        print_table('RemunerativeConcept')
      end

      format.pdf do
        dump_tmp_filename = Rails.root.join('tmp',@liquidacion.cache_key)
          Dir.mkdir(dump_tmp_filename.dirname) unless File.directory?(dump_tmp_filename.dirname)
          if print_libro_pdf(dump_tmp_filename,@liquidacion)
            send_file(dump_tmp_filename, :type => :pdf, :disposition => 'attachment', :filename => "librosueldos.pdf")
            File.delete(dump_tmp_filename) unless Rails.env.development?
          else
            redirect_to :action => 'show'
          end
      end

      format.json do
        dump_tmp_filename = Rails.root.join('tmp',@liquidacion.cache_key)
          Dir.mkdir(dump_tmp_filename.dirname) unless File.directory?(dump_tmp_filename.dirname)
          print_planilla_remuneraciones_pdf(dump_tmp_filename,@liquidacion)
          send_file(dump_tmp_filename, :type => :pdf, :disposition => 'attachment', :filename => "planilla_remuneraciones.pdf")
          File.delete(dump_tmp_filename) unless Rails.env.development?
      end

      format.text  do
        dump_tmp_filename = Rails.root.join('tmp',@liquidacion.cache_key)
        Dir.mkdir(dump_tmp_filename.dirname) unless File.directory?(dump_tmp_filename.dirname)
        prepara_sicoss(dump_tmp_filename,@liquidacion)
        send_file(dump_tmp_filename, :type => :text, :disposition => 'attachment', :filename => "sicoss_interfase.txt")
        File.delete(dump_tmp_filename) unless Rails.env.development?
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
        liquidar_employee

        format.html { redirect_to(@liquidacion, :notice => t('scaffold.notice.created', :item=> Liquidacion.model_name.human)) }
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
        format.html { redirect_to(@liquidacion, :notice => t('scaffold.notice.updated', :item=> Liquidacion.model_name.human)) }
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
    begin
      @liquidacion.destroy
      flash[:success] = "successfully destroyed."
    rescue ActiveRecord::DeleteRestrictionError => e
      @liquidacion.errors.add(:base, e)
      flash[:error] = "#{e}"
      redirect_to liquidacion_url
    else
      redirect_to liquidacions_url
    end
  end

  #[PVD] :: 2011-10-26 :: Listado de control de recibos de sueldo para MDQ...
  def control_by_company_list
    @liquidacions = Liquidacion.by_company(current_company.id).order("periodo desc")
    respond_to do |format|
      format.html {}
      format.xml  { head :ok }
      format.json {}
    end
  end

  #[PVD] :: 2011-10-26 :: Listado de los recibos de sueldo de una liquidacion
  def control_by_company
    respond_to do |format|
      format.html {}
      format.xml  { head :ok }
      format.json {}
    end
  end

  protected

  def find_liquidacion
      @liquidacion= Liquidacion.by_company(current_company.id).find(params[:id])
  end

  def liquidar_employee
    @employees = Employee.by_company(current_company.id).where(:fecha_egreso.blank?)
    Rails.logger.info("Cant="+@employees.count.to_s)

    @employees.each do |employee|
      Rails.logger.info("Employee="+employee.id.to_s)
      @recibo_sueldo = ReciboSueldo.new(:liquidacion_id => @liquidacion.id, :employee_id => employee.id)
      @recibo_sueldo.save
      @recibo_sueldo.calcular_recibo
    end
  end

# #################################################################################
  def print_planilla_remuneraciones_pdf(filename,liquidacion_actual)
  require 'prawn'


  empresa = OpenStruct.new({
                  :logo                   => "",
                  :empresa                => "",
                  :domicilio              => "",
                  :cuit                   => "",
                  :inscripcion            => "",
                  :caja                   => "",
                  :hoja                   => 0,
                  :imprimir_hasta_hoja    => 0
                  })

  @recibo_sueldos = liquidacion_actual.recibo_sueldos.all
  if !@recibo_sueldos.any?
    flash[:error] = "No existen Movimientos para Listar"
    return
  end

  pdf = Prawn::Document.new(:left_margin => 35, :top_margin => 35,:page_size   => "LETTER",
#                              :background => img,
                            :page_layout => :portrait)
  offset = 0
    pdf.draw_text "Planilla de Remuneraciones".center(100), :at => [5,745],:style => :bold, :size => 10


  logo_id = AssociatedDocumentType.where(:document_type => "L").first.id
  con_logo = false

  if @recibo_sueldos.first.employee.consortium_id.to_i > 0

    if !logo_id.nil? && !Rails.env.development?
#      attach = @recibo_sueldos.first.employee.consortium.attachments.unscoped.where(:associated_document_type_id => logo_id).first()
#      con_logo = true

    end
    empresa.empresa             = @recibo_sueldos.first.employee.consortium.razon_social
    empresa.domicilio           = @recibo_sueldos.first.employee.consortium.calle + ' ' +
                                  @recibo_sueldos.first.employee.consortium.altura
    empresa.domicilio2          = @recibo_sueldos.first.employee.consortium.codigo_postal+' '+
                                  @recibo_sueldos.first.employee.consortium.location.detalle+' ('+
                                  @recibo_sueldos.first.employee.consortium.province.detalle+")"
    empresa.cuit                = @recibo_sueldos.first.employee.consortium.cuit
    empresa.inscripcion         = @recibo_sueldos.first.employee.consortium.numero_inscripcion
    empresa.caja                = @recibo_sueldos.first.employee.consortium.caja
    empresa.hoja                = @recibo_sueldos.first.employee.consortium.ultima_hoja_libro.to_i
    empresa.imprimir_hasta_hoja = @recibo_sueldos.first.employee.consortium.imprimir_hasta_hoja_libro.to_i
  else
    if !logo_id.nil?
#     attach = current_company.attachments.unscoped.where(:associated_document_type_id => logo_id).first
#     con_logo = true

    end
    empresa.empresa             = current_company.razon_social
    empresa.domicilio           = current_company.calle + ' ' +
                                  current_company.altura
    empresa.domicilio2          = current_company.codigo_postal+' '+
                                  current_company.location.detalle+' ('+
                                  current_company.province.detalle+")"
    empresa.cuit                = current_company.cuit
    empresa.inscripcion         = current_company.numero_inscripcion
    empresa.caja                = current_company.caja
    empresa.hoja                = current_company.ultima_hoja_libro.to_i
    empresa.imprimir_hasta_hoja = current_company.imprimir_hasta_hoja_libro.to_i
  end
  if con_logo
    if attach.adjunto_content_type[0..4] = "image"
      file_logo= Rails.root.join('tmp',attach.adjunto_file_name)
      Dir.mkdir(file_logo.dirname) unless File.directory?(file_logo.dirname)

      open( file_logo, 'wb' ) { |file|
          file.write(attach.adjunto_file)
        }

      empresa.logo = file_logo.to_s
    end
  end
  pdf.repeat(:all, :dynamic => true) do
#    pdf.image empresa.logo, :at => [5,750], :width => 30
    pdf.draw_text "Planilla de Remuneraciones".center(100), :at => [5,745],:style => :bold, :size => 10
    pdf.draw_text empresa.empresa.center(200), :at => [100,745],:style => :bold, :size => 10
    pdf.draw_text "Periodo de Liquidacion: " + @liquidacion.periodo.strftime("%m/%Y"), :at => [40, 725]
    pdf.draw_text "Hoja Nro.: " + pdf.page_number.to_s.rjust(4,"0"), :at => [410, 725]
  end
  data = [["Legajo","N o m b r e","Categoria", "Remuneraciones Con Descuento", "Remuneraciones Sin Descuento","Retenciones","Total Recibo"],
       [] ]
  thaber_con_descuento = 0
  thaber_sin_descuento = 0
  tretencion = 0
  @recibo_sueldos.each do |r|
     retencion = r.total_retenciones
     haber_total = r.total_haberes
     haber_con_descuento = r.total_haberes_con_descuento
     haber_sin_descuento = haber_total - r.total_haberes_con_descuento
     # haber = ReciboSueldo.joins(:detalle_recibo_habers).where(:id => r.id).sum(:total)
     tretencion = tretencion + retencion
     thaber_sin_descuento +=  haber_sin_descuento
     thaber_con_descuento += haber_con_descuento

     data << [r.employee.legajo ,
              r.employee.full_name,
              r.employee.category.try(:detalle)[0..15],
              format_number(haber_con_descuento),
              format_number(haber_sin_descuento),
              format_number(retencion),
              format_number(haber_total-retencion)
     ]
  end
  data << ["" ,
           "T O T A L E S",
           "",
           format_number(thaber_con_descuento),
           format_number(thaber_sin_descuento),
           format_number(tretencion),
           format_number(thaber_con_descuento + thaber_sin_descuento - tretencion)
  ]

  pdf.table(data, :column_widths => [40, 170, 65, 65, 65, 65, 65],
           :cell_style => { :font => "Times-Roman",
                            :size => 9,:padding => [2,3,4,2],
                            :align =>  :left,
                            :valign => :center },
           :header => true ,
           :row_colors => ["F0F0F0", "FFFFCC"]
            )   do
    column(3..6).align = :right
    row(0).column(0..6).align = :center
  end

  pdf.render_file(filename)
  if con_logo
    File.delete(file_logo) unless Rails.env.development?
  end

end

# #################################################################################
=begin
  def print_libro_pdf(filename,entity)
    require 'prawn'
    @recibo_sueldos = @liquidacion.recibo_sueldos.all

    img = "public/images/hsjd2.jpg"

    pdf = Prawn::Document.new(:left_margin => 35, :top_margin => 35,:page_size   => "LETTER",
                              :background => img,
                              :page_layout => :landscape)
    prawn_logo = img      # "hsjd.jpg"
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

    pdf.render_file(filename)
  end
=end
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


# ###################################################################################

  def prepara_sicoss(filename,entity)
    sicoss_file = File.open(filename, 'w')
=begin
    offset =500
    @liquidacion.recibo_sueldos.each do |r|
      acumuladores = OpenStruct.new()
      resultado    = OpenStruct.new()
      registro = ""
      r.detalle_recibo_habers.each do |dhr|
        if !dhr.remunerative_concept.auxiliar
          dhr.remunerative_concept.acumuladores_valor.split(' ').each do |acumulador|
            acumulador.gsub!('@', '')
            acumuladores.send("#{acumulador}=", acumuladores.send(acumulador).to_f + dhr.total.to_f)
          end
        end
      end

      r.detalle_recibo_retencions.each do |dhr|
        if !dhr.retention_concept.auxiliar
          dhr.retention_concept.acumuladores_valor.split(' ').each do |acumulador|
            acumulador.gsub!('@', '')
            acumuladores.send("#{acumulador}=", acumuladores.send(acumulador).to_f + dhr.total.to_f)
          end
        end
      end
      SicossFormat.all.sort_by{ |p| p.position}.each do |f|
         formula = f.formula.strip.gsub(':', 'r.employee.').gsub('@', 'acumuladores.')
        if f.field_type == "N"
            multiplicador = (10 ** f.number_of_decimals).to_s # "1" + (f.number_of_decimals == 0 ? "" :  "0" * f.number_of_decimals)
            formula ="(sprintf '%."+f.number_of_decimals.to_s+"f', ("+
                      formula + "* "+ multiplicador + " - ("+
                      formula +" * " + multiplicador +
                      ").modulo(1)) / " + multiplicador +")"
        end

        if f.justifies == "C"
          formula=formula+".center("
        elsif f.justifies == "R"
            formula=formula+".rjust("
        else
            formula=formula+".ljust("
        end
        formula += f.field_length.to_s  + (f.fill_character.blank? ? '' : ', "' + f.fill_character+'"') +  ")"
        nombre = "posicion_"+f.position.to_s.rjust(2,"0")

        resultado.send("#{nombre}=", instance_eval(formula) )
        registro = registro +  instance_eval(formula).to_s

      end
      sicoss_file.puts registro
    end
=end

    procesadas = []
    primer_parent_id = true
    sicoss_file.puts "=begin"
    sicoss_file.puts Execute:"
    sicoss_file.puts   heroku console"
    sicoss_file.puts " load Rails.root.join('db/apolo-heroku.rb').to_s"
    sicoss_file.puts "=end"

    ["menu","country","province","company","location","province","group_remuneration","group_retention","accounting_imputation", "data_to_ask","category","retention_concept","remunerative_concept"].each do |entidadc|
      entidadc=entidadc.camelize
      entidad = eval(entidadc)
      data = entidad.all
      columnas = entidad.column_names
      sicoss_file.puts entidadc.camelize+".delete_all"
      sicoss_file.puts "id_"+entidadc.underscore+"_old = []"
      sicoss_file.puts "id_"+entidadc.underscore+"_new = []"
      data.each do |reg|
        str= ""
        columnas.each do |col|
          if ["created_at", "updated_at", "id"].exclude?(col)
            if col[col.length-3..col.length]=="_id"
              if col == "parent_id"
                pedazo = (primer_parent_id == true ? "nil" : "1")
                primer_parent_id = false
              else
                if procesadas.index(col.gsub("_id","")).nil?
                  pedazo = "nil"
                else
                  pedazo = eval("reg."+col).nil? ? 'nil' : "id_"+col.gsub("_id","")+"_new[ id_"+col.gsub("_id","")+"_old.index("+eval("reg."+col+".to_s")+")]"
                end
              end
            else
              case eval(entidadc+".columns_hash['"+col+"'].type")
                when :date
                  pedazo =  eval("reg."+col).nil? ? 'nil' : '"' +eval("reg."+col+".to_s")+ '"'
                when :string
                  pedazo = eval("reg."+col).nil? ? 'nil' : '"' + eval("reg."+col+".to_s") + '"'
                when :text
                  pedazo = eval("reg."+col).nil? ? 'nil' : '"' + eval("reg."+col+".to_s") + '"'
                when :decimal
                  pedazo =eval("reg."+col).nil? ? 'nil' : eval("reg."+col+".to_s")
                when :integer
                  pedazo =eval("reg."+col).nil? ? 'nil' : eval("reg."+col+".to_s")
                when :boolean
                  pedazo = eval("reg."+col+"? ? 'true' : 'false'")
                else
                  pedazo = eval("reg."+col).nil? ? 'nil' : eval("reg."+col+".to_s")
              end
            end
            str=str+":"+col+" => "+pedazo+", "
          end
        end
        sicoss_file.puts "new_reg="+entidadc.camelize+'.create!('+str[0, str.length - 2]+")"
        sicoss_file.puts "id_"+entidadc.underscore+"_old << " + reg.id.to_s
        sicoss_file.puts "id_"+entidadc.underscore+"_new << new_reg.id"
      end
      procesadas<< entidadc.underscore
      primer_parent_id = true
    end
    sicoss_file.close
  end
end

=begin
#   Detalle								                  Desde	tamaño		Sale de
01	CUIL								                    001		011			employee.cuil(0..10).rtrim(11)
02 	Apellido y nombre					              012		030			(employee.Apellido.strip + ','+ employee.Nombre)(0..29).rtrim(30)
03	Conyuge								                  042		001			employee.employee.familiar.conyugue_hijo
04	Cantidad Hijos						              043		002			employee.employee.familiar.conyugue_hijo
05	Codigo de Situacion					            045		002 ?
06	Codigo de COndicion					            047		002  ?
07	Codigo de Actividad					            049		003   ?
08	Codigo de Zona						              052		002    ?
09	Porcentaje de Aporte Acicional SS	      054		005    ACUMULADOR
10	Codigo de Modalidad de Contratacion	    059		003    EMPLOYEE.MODALIDAD
11	Codigo de Obra Social				            062		006    EMPLOYEE.HEALTH_INSURANCE.CODIGO
12	Cantidad de Adherentes				          068		002    EMPPLOYEE.CARGAS_EXTRAS
13	Remuneracion Total					            070		011    ACUMULADOR
14	Remuneracion Imponible 1			          081		010     ACUMULADOR
15	Asignaciones Familiares Pagadas		      091		009     ACUMULADOR
16	Importe Aporte Voluntario			          100		009     ACUMULADOR
17	Importe Adicional OS				            109		009     ACUMULADOR
18	Importe Exedentes Aportes SS		        119		009     ACUMULADOR
19	Importe Exedentes Aportes OS		        127		009     ACUMULADOR
20	Provincia Localidad					            136		050     ?
21	Remuneracion Imponible 2			          186		010     ACUMULADOR
22	Remuneracion Imponible 3			          196		010     ACUMULADOR
23	Remuneracion Imponible 4			          206		010     ACUMULADOR
24	Codigo de Siniestrado				            216		002     ?
25	Marca de Corresponde Reduccion		      218		001     ?
26	Capital de Recomposicion LRT		        219		009     ACUMULADOR
27	Tipo de EMpresa						              228		001     ?
28	Aporte Adicional de Obra Social		      229		009     ACUMULADOR
29	Regimen								                  238		001     ¿
30	Situacion de Revista 1				          239		002   ?
31	Dia inicio Situacion de Revista 1	      241		002   ?
32	Situacion de Revista 2				          243		002   ?
33	Dia inicio Situacion de Revista 2	      245		002   ?
34  Situacion de Revista 3				          247		002     ?
35	Dia inicio Situacion de Revista 3	      249		002   ?
36	Sueldo + Adicionales				            251		010     ACUMULADOR
37	SAC									                    261		010   ACUMULADOR
38	Horas Extra							                271		010   ACUMULADOR
39	Zona Desfavorable					              281		010   ¿
40	Vacaciones							                291		010   ACUMULADOR
41	Cantidad de Dias trabajados			        301		009   ACUMULADOR
42	Remuneracion Imponible 5			          310		010   ACUMULADOR
43	Trabajador COnvencionado 0=N0 1=Si	    320		001   ?
44	Remuneracion Imponible 6			          321		010   ACUMULADOR
45	Tipo de Operacion			                  331		001   ?
46	Adicionales							                332		010   ACUMULADOR
47	Premios								                  342		010   ACUMULADOR
48	Rem.Dec.788/5-Rem.Impon.8			          352		010   ACUMULADOR
49	Remuneracion Imponible 7			          362		010   ACUMULADOR
50  Cantidad de Horas Extras			          372		003   ACUMULADOR
51	Conceptos No Remunerativos			        375		010   ACUMULADOR
52	Maternidad							                385		010   ACUMULADOR
53	Rectificacion de Remuneracion		        395		009   ACUMULADOR
54	Remuneracion Imponible 9			          404		010   ACUMULADOR
55	Contribucion Tarea Diferencial (%)	    414		009   ACUMULADOR
56	Horas Trabajadas					              423		003   ACUMULADOR
57	Seguro Colectivo de Vida Obligatorio    426		001   ACUMULADOR

formato = ""
sicoss_format.all.each.order("position") do |f|
  formula = f.formula.strip
  if f.field_type == "N"
     if f.number_of_decimals > 0
       str = "( "+
                  "(" + formula + " * " + (10 * f.number_of_decimals).to_s + ") "+
              "- ( (" + formula + " * " + (10 * f.number_of_decimals).to_s + ").modulo(1) ) / " + (10 * f.number_of_decimals).to_s+
              ")"
     end
    formula=".to_s"
  end

  if f.justifies == "C"
    formula=formula+".center("
  elseif f.justifies == "D"
      formula=formula+".rjust("
  else
      formula=formula+".ljust("
  end
  formula += f.field_length.to_s  + (? f.fill_character.nil? ? '' : ', "'+f.fill_character+'"') +  ")"
  formato += formula

end

self.acumuladores = OpenStruct.new()
self.resultado    = OpenStruct.new()
@Liquidacion.recibo_sueldo.each do "r"
  r.detalle_recibo_haber.remunerative_concept.acumuladores_valor.split(' ').each do |acumulador|
    acumulador.gsub!('@', '')
    self.acumuladores.send("#{acumulador}=", self.acumuladores.send(acumulador).to_f + detalle_recibo_haber.total.to_f)
  end
  r.detalle_recibo_retencion_concept.acumuladores_valor.split(' ').each do |acumulador|
    acumulador.gsub!('@', '')
    self.acumuladores.send("#{acumulador}=", self.acumuladores.send(acumulador).to_f + detalle_recibo_haber.total.to_f)
  end
  sicoss_format.all.each.order("position") do |f|
    formula = f.formula.strip
    if f.field_type == "N"
       if f.number_of_decimals > 0
         str = "( "+
                    "(" + formula + " * " + (10 * f.number_of_decimals).to_s + ") "+
                "- ( (" + formula + " * " + (10 * f.number_of_decimals).to_s + ").modulo(1) ) / " + (10 * f.number_of_decimals).to_s+
                ")"
       end
      formula=".to_s"
    end

    if f.justifies == "C"
      formula=formula+".center("
    elseif f.justifies == "D"
        formula=formula+".rjust("
    else
        formula=formula+".ljust("
    end
    formula += f.field_length.to_s  + (? f.fill_character.nil? ? '' : ', "'+f.fill_character+'"') +  ")"
    nombre = "posicion_"+f.position.to_s.rtrim(2,"0")
    errors.add(:base, "#{nombre}="+nombre+ " formula = "+formula)
#    self.resultado.send("#{nombre}=", instance_eval(formula).to_f )

  end

end
=end
def print_libro_pdf(filename,liquidacion_actual)
  require 'prawn'

  empresa = OpenStruct.new({
                  :logo                   => "",
                  :empresa                => "",
                  :domicilio              => "",
                  :cuit                   => "",
                  :inscripcion            => "",
                  :caja                   => "",
                  :hoja                   => 0,
                  :imprimir_hasta_hoja    => 0
                  })

  @recibo_sueldos = liquidacion_actual.recibo_sueldos.all

  logo_id = AssociatedDocumentType.where(:document_type => "L").first.id
  con_logo = false
  if !@recibo_sueldos.any?
    flash[:error] = "No existen Movimientos para Listar"
    return
  end
  if @recibo_sueldos.first.employee.consortium_id.to_i > 0

    if !logo_id.nil?
#        attach = @recibo_sueldos.first.employee.consortium.attachments.unscoped.where(:associated_document_type_id => logo_id).first()
#       con_logo = true
    end
    empresa.empresa             = @recibo_sueldos.first.employee.consortium.razon_social
    empresa.domicilio           = @recibo_sueldos.first.employee.consortium.calle + ' ' +
                                  @recibo_sueldos.first.employee.consortium.altura
    empresa.domicilio2          = @recibo_sueldos.first.employee.consortium.codigo_postal+' '+
                                  @recibo_sueldos.first.employee.consortium.location.detalle+' ('+
                                  @recibo_sueldos.first.employee.consortium.province.detalle+")"
    empresa.cuit                = @recibo_sueldos.first.employee.consortium.cuit
    empresa.inscripcion         = @recibo_sueldos.first.employee.consortium.numero_inscripcion
    empresa.caja                = @recibo_sueldos.first.employee.consortium.caja
    empresa.hoja                = @recibo_sueldos.first.employee.consortium.ultima_hoja_libro.to_i
    empresa.imprimir_hasta_hoja = @recibo_sueldos.first.employee.consortium.imprimir_hasta_hoja_libro.to_i
  else
    if !logo_id.nil?
#      attach = current_company.attachments.unscoped.where(:associated_document_type_id => logo_id).first
#      con_logo = true
    end
    empresa.empresa             = current_company.razon_social
    empresa.domicilio           = current_company.calle + ' ' +
                                  current_company.altura
    empresa.domicilio2          = current_company.codigo_postal+' '+
                                  current_company.location.detalle+' ('+
                                  current_company.province.detalle+")"
    empresa.cuit                = current_company.cuit
    empresa.inscripcion         = current_company.numero_inscripcion
    empresa.caja                = current_company.caja
    empresa.hoja                = current_company.ultima_hoja_libro.to_i
    empresa.imprimir_hasta_hoja = current_company.imprimir_hasta_hoja_libro.to_i
  end
  if con_logo
    if attach.adjunto_content_type[0..4] = "image"
      file_logo= Rails.root.join('tmp',rand.to_s[2..15]+'.jpg')
      Dir.mkdir(file_logo.dirname) unless File.directory?(file_logo.dirname)

      open( file_logo, 'wb' ) { |file|
          file.write(attach.adjunto_file)
        }

      empresa.logo = file_logo.to_s
    end
  end
  pdf = Prawn::Document.new(:left_margin => 50, :top_margin => 35,:page_size   => "LETTER",
                            :page_layout => :portrait)

  offset = 0
  numero_de_hoja = empresa.hoja
  left = 10
  top = 670

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
      if h.total.to_f != 0 && !h.remunerative_concept.auxiliar
        if h.remunerative_concept.acumuladores_valor.upcase.include?("SINDESCUENTO")
          haberes_sd = haberes_sd + 1
          if haberes_sd >= linea.count
            linea << [ '', '','','','','','','']
          end
           linea[haberes_sd][4]   =    h.remunerative_concept.codigo
           linea[haberes_sd][5]   =    format_number(h.total).strip
           total_haberes_sd = total_haberes_sd + h.total
        else
           haberes_cd = haberes_cd + 1
           if haberes_cd >= linea.count
             linea << [ '', '','','','','','','']
           end
           linea[haberes_cd][2]   =    h.remunerative_concept.codigo
           linea[haberes_cd][3]   =    format_number(h.total).strip
           total_haberes_cd = total_haberes_cd + h.total
        end
      end
    end

    r.detalle_recibo_retencions.each do |r|
      if r.total.to_f != 0 && !r.retention_concept.auxiliar
        retenciones = retenciones + 1
        if retenciones >= linea.count
          linea << ['','','','','','','','']
        end
        linea[retenciones][6]    =    r.retention_concept.codigo.strip
        linea[retenciones][7]    =    format_number(r.total).strip
        total_retention = total_retention + r.total
      end
    end

    if haberes_cd != -1 || haberes_sd != -1 || retenciones != -1
      if offset-((linea.count+4))*10 < 20
        if numero_de_hoja != empresa.hoja
          pdf.start_new_page
        end

        numero_de_hoja += 1
        if numero_de_hoja >  empresa.imprimir_hasta_hoja
          numero_de_hoja = 1
        end
        top = 670
        pdf.draw_text "Registro Individual de Sueldos".center(170), :at => [5, top],:style => :bold, :size => 10
        top=top - 10
        pdf.draw_text "Ley 20.744-Art. 52".center(200), :at => [5, top], :size => 9
        top=top - 10

        pdf.draw_text "Hoja Nro:", :at => [460, top], :size => 8
        pdf.draw_text numero_de_hoja.to_s.rjust(empresa.imprimir_hasta_hoja.to_s.length,'0'), :at => [500, top], :size => 10, :style => :bold
        pdf.draw_text empresa.empresa.strip, :at => [left, top], :size => 8, :style => :bold
        top = top - 15
        pdf.draw_text "Periodo de Liquidacion :", :at => [200,top], :size => 8
        pdf.draw_text @liquidacion.periodo.strftime("%B de %Y"), :at => [300, top], :size => 8, :style => :bold
        pdf.draw_text empresa.domicilio.strip, :at => [left, top], :size => 8, :style => :bold
        top = top - 15
        pdf.draw_text empresa.domicilio2.strip, :at => [left, top], :size => 8, :style => :bold
        pdf.draw_text "Fecha :", :at => [430, top], :size => 8
        pdf.draw_text Time.now.strftime("%d/%m/%Y %H:%M hs."), :at => [460, top], :size => 8, :style => :bold
        pdf.draw_text "Quincena:", :at => [230, top], :size => 8
        pdf.draw_text @liquidacion.quincena.to_s , :at => [270 , top], :size => 8, :style => :bold
        top=top - 10
        pdf.bounding_box [left, top], :width => 530, :height => 30 do # legajo
            pdf.stroke_bounds
        end
        pdf.bounding_box [left+28, top], :width => 122, :height => 30 do # apellido ynombre cut y categoria
            pdf.stroke_bounds
        end
        pdf.bounding_box [left+190, top], :width => 90, :height => 30 do # remuneraciones con descuento
           pdf.stroke_bounds
        end
        pdf.bounding_box [left+280, top], :width => 90, :height => 30 do   # remiuneraciones sin descto
           pdf.stroke_bounds
        end
        pdf.bounding_box [left+370, top], :width => 90, :height => 30 do   # Total Neto
           pdf.stroke_bounds
        end
        top=top - 10
        pdf.draw_text "Apellido y nombre                   F. Ingreso", :at => [left+47, top], :size => 8 # linea 505
        pdf.draw_text "  Remuneraciones c/desc       Remuneraciones s/desc                Retenciones", :at => [left+192, top], :size => 7 # linea 505
        pdf.draw_text "T o t a l", :at => [left+480, top], :size => 8
        top = top - 5
        # 500
        pdf.bounding_box [left+28, top], :width => 60, :height => 15 do
            pdf.stroke_bounds
        end
#          pdf.bounding_box [98, 500], :width => 30, :height => 15 do
#              pdf.stroke_bounds
#          end
        pdf.bounding_box [left+88, top], :width => 62, :height => 15 do
            pdf.stroke_bounds
        end
#          pdf.bounding_box [213, 515], :width => 53, :height => 15 do
#                pdf.stroke_bounds
#          end
        pdf.bounding_box [left+150, top], :width => 40, :height => 15 do
            pdf.stroke_bounds
        end


        pdf.bounding_box [left+190, top], :width => 27, :height => 15 do
            pdf.stroke_bounds
        end

        pdf.bounding_box [left+217, top], :width => 92, :height => 15 do # importe remuneraciones c/des + codigo de remuneraciones s/desc
           pdf.stroke_bounds
        end
        pdf.bounding_box [left+309, top], :width => 92, :height => 15 do # importe remuneraciones s/des + codigo de remuneraciones s/desc
           pdf.stroke_bounds
        end
        pdf.bounding_box [left+401, top], :width => 59, :height => 15 do # box de importe retenciones
            pdf.stroke_bounds
        end
        top = top -2
        pdf.draw_text "Legajo", :at => [left+2, top ], :size => 8  # linea 498
        top=top -10
        pdf.draw_text "    C.U.I.L            Categoria          F. Egreso", :at => [46, top], :size => 8

        pdf.draw_text " N e t o", :at => [left+480, top], :size => 8
        pdf.draw_text "Codigo        Importe         Codigo         Importe        Codigo         Importe", :at => [left+190, top], :size => 8


        offset = top - 5
        linea_nombre = true
      end

      linea[0][0] = r.employee.legajo.ljust(9) + " " +  (r.employee.apellido.strip+", "+r.employee.nombre.strip).ljust(30)
      linea[0][1] = r.employee.fecha_ingreso.strftime("%d/%m/%Y")
      if linea.count < 2 #OJO
        linea << ['','','','','','','','']
      end
      if linea.count < 2 && !r.employee.fecha_egreso.nil?
        linea << ['','','','','','','','']
      end
      linea[1][0] = "             " + # r.employee.document_type.detalle[0..2].center(3) +
           r.employee.cuil.strip.ljust(14)    +
           r.employee.category.try(:detalle)[0..16].ljust(16)

      if r.employee.fecha_egreso.nil?
        linea[1][0] =  "E.Civil : "+r.employee.marital_status.try(:detalle)
      else
         linea[1][1] =  r.employee.fecha_egreso.strftime("%d/%m/%Y")
         linea[2][0] =  "             E.Civil : "+r.employee.marital_status.try(:detalle)
      end

      first_line = true
      linea.each do |l|
        offset = offset - 10
        pdf.draw_text  l[0] , :at => [left, offset], :size => 8
        pdf.draw_text  l[1] , :at => [left+150, offset], :size => 8
        pdf.draw_text  l[2] , :at => [left+193, offset], :size => 8
        pdf.text_box  l[3] , :at => [left+223, offset+7], :size => 8, :align => :right, :width => 50
        pdf.draw_text  l[4] , :at => [left+283, offset], :size => 8
        pdf.text_box  l[5] , :at => [left+313, offset+7], :size => 8, :align => :right, :width => 50,:height => 10
        pdf.draw_text  l[6] , :at => [left+373, offset], :size => 8
        pdf.text_box  l[7] , :at => [left+403, offset+7], :size => 8, :align => :right, :width => 50,:height => 10
      end
      offset = offset - 3
      pdf.text_box  format_number(total_haberes_sd).strip , :at => [left+223, offset], :size => 8, :align => :right, :width => 50,:height => 10
      pdf.text_box  format_number(total_haberes_cd).strip , :at => [left+313, offset], :size => 8, :align => :right, :width => 50,:height => 10
      pdf.text_box  format_number(total_retention).strip , :at => [left+403, offset], :size => 8, :align => :right, :width => 50,:height => 10
      pdf.text_box  format_number(total_haberes_sd+total_haberes_cd-total_retention).strip , :at => [left+480, offset], :size => 8, :align => :right, :width => 50,:height => 10
      offset = offset -10
      pdf.bounding_box [left, offset], :width => 530, :height => 2 do
          pdf.stroke_bounds
      end
      offset = offset -5
    end
  end

  if con_logo
    File.delete(file_logo) unless Rails.env.development?
  end
  pdf.render_file(filename)
end

