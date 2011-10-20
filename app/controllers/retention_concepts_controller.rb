class RetentionConceptsController < ApplicationController
  before_filter :find_retention_concept, :except => [:index, :new, :create]
  # GET /retention_concepts
  # GET /retention_concepts.xml
  def index
    @search = RetentionConcept.search(params[:search])
    @retention_concepts = @search.page(params[:page]).per(10)

    respond_to do |format|
      format.html # indexoo.html.erb
      format.xml  { render :xml => @retention_concepts }
    end
  end

  # GET /retention_concepts/1
  # GET /retention_concepts/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @retention_concept }
      format.json do
        dump_tmp_filename = Rails.root.join('tmp',@retention_concept.cache_key)
          Dir.mkdir(dump_tmp_filename.dirname) unless File.directory?(dump_tmp_filename.dirname)
          recibos_afectados_pdf(dump_tmp_filename,@retention_concept)
          send_file(dump_tmp_filename, :type => :pdf, :disposition => 'attachment', :filename => "recibos_afectados.pdf")
          File.delete(dump_tmp_filename) unless Rails.env.development?
      end

    end
  end

  # GET /retention_concepts/new
  # GET /retention_concepts/new.xml
  def new
    @retention_concept = RetentionConcept.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @retention_concept }
    end
  end

  # GET /retention_concepts/1/edit
  def edit
  end

  # POST /retention_concepts
  # POST /retention_concepts.xml
  def create
    @retention_concept = RetentionConcept.new(params[:retention_concept])

    respond_to do |format|
      if @retention_concept.save
        format.html { redirect_to(@retention_concept, :notice => 'Retention concept was successfully created.') }
        format.xml  { render :xml => @retention_concept, :status => :created, :location => @retention_concept }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @retention_concept.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /retention_concepts/1
  # PUT /retention_concepts/1.xml
  def update

    respond_to do |format|
      if @retention_concept.update_attributes(params[:retention_concept])
        if @retention_concept.cambio_algo
          format.html {redirect_to notify_changes_retention_concept_url}
        else
          format.html { redirect_to(@retention_concept, :notice => 'Retention concept was successfully updated.') }
          format.xml  { head :ok }
        end
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @retention_concept.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /retention_concepts/1
  # DELETE /retention_concepts/1.xml
  def destroy
    begin
      @retention_concept.destroy
      flash[:success] = "successfully destroyed."
    rescue ActiveRecord::DeleteRestrictionError => e
      @retention_concept.errors.add(:base, e)
      flash[:error] = "#{e}"
      redirect_to retention_concept_url
    else
      redirect_to retention_concepts_url
    end
  end

  def find_retention_concept
      @retention_concept = RetentionConcept.find(params[:id])
  end

  def calculate_changes
    @retention_concept.calculate_changes
    respond_to do |format|
      format.html {redirect_to notify_changes_retention_concept_url, :notice => "Calculado correctamente"}
    end
  end
# #################################################################################
  def recibos_afectados_pdf(filename,entity)
    require 'prawn'

    img = "hsjd2.jpg"

    pdf = Prawn::Document.new(:left_margin => 35, :top_margin => 35,:page_size   => "LETTER",
#                              :background => img,
                              :page_layout => :portrait)

    pdf.repeat(:all, :dynamic => true) do
      pdf.draw_text ("Legajos afectados por el cambio de calculo del concepto "+
            entity.codigo+" - "+entity.detalle), :at => [5,745],:style => :bold, :size => 11
      pdf.draw_text "Hoja Nro.: " + pdf.page_number.to_s.rjust(4,"0"), :at => [610, 735]
    end
    data = [["Periodo","legajo","Apellido y nombre"],
         [] ]

    Liquidacion.where(:fecha_cierre.nil?).each do |l|
      recibos=ReciboSueldo.joins(:detalle_recibo_retencions).where(:liquidacion_id => l.id).where("detalle_recibo_retencions.retention_concept_id" => entity.id)
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

end
