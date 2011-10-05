class RemunerativeConceptsController < ApplicationController

  before_filter :find_remunerative_concept , :except => [:index, :new, :create]
  # GET /remunerative_concepts
  # GET /remunerative_concepts.xml
  def index
    # la docu general de todo esto esta en http://metautonomo.us/projects/metasearch/
    @search = RemunerativeConcept.by_company(current_company.id).search(params[:search])
    @remunerative_concepts = @search.page(params[:page]).per(10)

    respond_to do |format|
      format.html # indexoo.html.erb
      format.xml  { render :xml => @remunerative_concepts }
    end
  end

  # GET /remunerative_concepts/1
  # GET /remunerative_concepts/1.xml
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @remunerative_concept}
      format.pdf do
        dump_tmp_filename = Rails.root.join('tmp',@remunerative_concept.cache_key)
          Dir.mkdir(dump_tmp_filename.dirname) unless File.directory?(dump_tmp_filename.dirname)
          print_remunerative_concepts_pdf(dump_tmp_filename,@remunerative_concept)
          send_file(dump_tmp_filename, :type => :pdf, :disposition => 'attachment', :filename => "remunerative_concept.pdf")
          File.delete(dump_tmp_filename) unless Rails.env.development?
      end
      format.json do
        dump_tmp_filename = Rails.root.join('tmp',@remunerative_concept.cache_key)
          Dir.mkdir(dump_tmp_filename.dirname) unless File.directory?(dump_tmp_filename.dirname)
          recibos_afectados_pdf(dump_tmp_filename,@remunerative_concept)
          send_file(dump_tmp_filename, :type => :pdf, :disposition => 'attachment', :filename => "recibos_afectados.pdf")
          File.delete(dump_tmp_filename) unless Rails.env.development?
      end

    end
  end

  # GET /remunerative_concepts/new
  # GET /remunerative_concepts/new.xml
  def new
    @remunerative_concept = RemunerativeConcept.by_company(current_company.id).new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @remunerative_concept }
    end
  end

  # GET /remunerative_concepts/1/edit
  def edit
  end

  # POST /remunerative_concepts
  # POST /remunerative_concepts.xml
  def create
    @remunerative_concept = RemunerativeConcept.by_company(current_company.id).new(params[:remunerative_concept])

    respond_to do |format|
      if @remunerative_concept.save
        format.html { redirect_to(@remunerative_concept, :notice => 'Remunerative concept was successfully created.') }
        format.xml  { render :xml => @remunerative_concept, :status => :created, :location => @remunerative_concept }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @remunerative_concept.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /remunerative_concepts/1
  # PUT /remunerative_concepts/1.xml
  def update
    respond_to do |format|
      if @remunerative_concept.update_attributes(params[:remunerative_concept])
        if @remunerative_concept.cambio_algo
          format.html {redirect_to notify_changes_remunerative_concept_url}
        else
          format.html { redirect_to(@remunerative_concept, :notice => 'Remunerative concept was successfully updated.') }
          format.xml  { head :ok }
        end
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @remunerative_concept.errors, :status => :unprocessable_entity }
      end
    end
    Rails.logger.info("salio Cambio algokk=")
  end

  # DELETE /remunerative_concepts/1
  # DELETE /remunerative_concepts/1.xml
  def destroy
    begin
      @remunerative_concept.destroy
      flash[:success] = "successfully destroyed."
    rescue ActiveRecord::DeleteRestrictionError => e
      @remunerative_concept.errors.add(:base, e)
      flash[:error] = "#{e}"
      redirect_to remunerative_concept_url
    else
      redirect_to remunerative_concepts_url
    end
  end

  def find_remunerative_concept
      @remunerative_concept = RemunerativeConcept.by_company(current_company.id).find(params[:id])
  end


  def calculate_changes
    @remunerative_concept.calculate_changes
    flash[:success] = "Calculado correctamente"
    respond_to do |format|
      format.html {redirect_to notify_changes_remunerative_concept_url}
    end
  end
# ----
# #################################################################################
  def recibos_afectados_pdf(filename,entity)
    require 'prawn'

    img = "hsjd2.jpg"

    pdf = Prawn::Document.new(:left_margin => 35, :top_margin => 35,:page_size   => "LETTER",
#                              :background => img,
                              :page_layout => :landscape)

    pdf.repeat(:all, :dynamic => true) do
      pdf.draw_text ("Legajos afectados por el cambio de calculo del concepto "+entity.codigo+" - "+entity.detalle).center(200), :at => [5,560],:style => :bold, :size => 11
      pdf.draw_text "Hoja Nro.: " + pdf.page_number.to_s.rjust(4,"0"), :at => [610, 550]
    end
    data = [["Periodo","legajo","Apellido y nombre"],
         [] ]

    Liquidacion.where(:fecha_cierre.nil?).each do |l|
      recibos=ReciboSueldo.joins(:detalle_recibo_habers).where(:liquidacion_id => l.id).where("detalle_recibo_habers.remunerative_concept_id" => entity.id)
      recibos.each do |r|
        data << [l.periodo.strftime("%m/%Y") ,
                 r.legajo,
                 r.employee.full_name
                 ]
      end
    end

    pdf.table(data, :column_widths => [40, 100, 250],
             :cell_style => { :font => "Times-Roman",:size => 10,:padding => [4, 04,04,4], :align => :center, :valign => :center },
             :header => true ,
             :row_colors => ["F0F0F0", "FFFFCC"])


    pdf.render_file(filename)
  end

# #################################################################################
  def print_remunerative_concepts_pdf(filename,entity)
    require 'prawn'
    @remunerative_concepts = RemunerativeConcept.by_company(current_company.id).all
    img = "hsjd2.jpg"

    pdf = Prawn::Document.new(:left_margin => 35, :top_margin => 35,:page_size   => "LETTER",
#                              :background => img,
                              :page_layout => :landscape)
    prawn_logo = "hsjd.jpg"
    logo_empresa ="CASA NUESTA SRA. DEL PILAR"
    logo_domicilio = "Julio A. Roca 501 - 6700-Lujan (BA)"
    logo_cuit = "C.U.I.T.: "+"30-67932805-7"
    logo_inscripcion = "Nro.Inscripcion: " + "21.757"
    logo_caja = "Caja: 11" + "Ex Caja Serv. Publico"
    offset = 0

    pdf.repeat(:all, :dynamic => true) do
      pdf.draw_text "Conceptos de Haberes".center(200), :at => [5,560],:style => :bold, :size => 11
      pdf.draw_text ("Empresa "+logo_empresa).center(200), :at => [5,550],:style => :bold, :size => 11
      pdf.draw_text "Hoja Nro.: " + pdf.page_number.to_s.rjust(4,"0"), :at => [610, 550]
      pdf.image prawn_logo, :at => [5,570], :width => 30

    end
    data = [["Codigo","D e t a l l e","prio ri dad", "Dato a Pedir","Valor Estad.","Cuenta Contable","Conceptos Asociados","Acumula Valor en","Acumula Cantidad en","Calculo Valor","Calculo Cantidad"],
         [] ]

    @remunerative_concepts.each do |r|
       data << [r.codigo ,
                r.detalle,
                r.prioridad_calculo,
                r.data_to_ask.detalle,
                r.statistical_value,
                r.accounting_imputation.try(:detalle),
                (r.concepto_asociado_haber.nil? ? "" : "H "+r.concepto_asociado_haber.try(:detalle).to_s)+
                   (r.concepto_asociado_retencion.nil? ? "" : " R "+r.concepto_asociado_retencion.try(:detalle).to_s) ,
                r.acumuladores_valor,
                r.acumuladores_cantidad,
                r.calculo_valor,
                r.calculo_cantidad
       ]
    end
    pdf.table(data, :column_widths => [40, 155, 20, 40, 40, 40, 40, 60,60,100],
             :cell_style => { :font => "Times-Roman",:size => 10,:padding => [4, 04,04,4], :align => :center, :valign => :center },
             :header => true ,
             :row_colors => ["F0F0F0", "FFFFCC"])


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
