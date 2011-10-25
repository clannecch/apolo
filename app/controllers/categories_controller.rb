class CategoriesController < ApplicationController

  before_filter :find_category, :except => [:index, :new, :create]

  respond_to :html, :xml, :json

  # GET /categories
  # GET /categories.xml
  # GET /categories.json
  def index
#    @search = Category.by_company(current_company.id).search(params[:search])
    @search = Category.search(params[:search])
    @categories = @search.page(params[:page]).per(10)
    respond_to do |format|
      format.html # indexoo.html.erb
      format.xml  { render :xml => @categories }
    end
  end

  # GET /categories/1
  # GET /categories/1.xml
  # GET /categories/1.json
  def show
     respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @category }
      format.json do
        dump_tmp_filename = Rails.root.join('tmp',@category.cache_key)
          Dir.mkdir(dump_tmp_filename.dirname) unless File.directory?(dump_tmp_filename.dirname)
          recibos_afectados_pdf(dump_tmp_filename,@category)
          send_file(dump_tmp_filename, :type => :pdf, :disposition => 'attachment', :filename => "recibos_afectados.pdf")
          File.delete(dump_tmp_filename) unless Rails.env.development?
      end
    end
  end

  # GET /categories/new
  # GET /categories/new.xml
  def new
#    @category = Category.by_company(current_company.id).new
    @category = Category.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @category }
    end
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.xml
  def create
#    @category = Category.by_company(current_company.id).new(params[:bank_deposit])
    @category = Category.new(params[:category])

    respond_to do |format|
      if @category.save
        format.html { redirect_to(@category, :notice => t('scaffold.notice.created', :item=> Category.model_name.human)) }
        format.xml  { render :xml => @category, :status => :created, :location => @category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /categories/1
  # PUT /categories/1.xml
  def update
    respond_to do |format|
      if @category.update_attributes(params[:category])
        if @category.cambio_algo
          format.html {redirect_to notify_changes_category_url}
        else
          format.html { redirect_to(@category, :notice => t('scaffold.notice.updated', :item=> Category.model_name.human)) }
          format.xml  { head :ok }
        end
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.xml
  def destroy
    begin
      @category.destroy
      flash[:success] = "successfully destroyed."
    rescue ActiveRecord::DeleteRestrictionError => e
      @category.errors.add(:base, e)
      flash[:error] = "#{e}"
      redirect_to category_url
    else
      redirect_to categories_url
    end
  end

  def find_category
#    @category= Category.by_company(current_company.id).find(params[:id])
    @category = Category.find(params[:id])
  end

  def calculate_changes
    @category.calculate_changes
    respond_to do |format|
      format.html {redirect_to notify_changes_category_url, :notice => "Calculado correctamente"}
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
      pdf.draw_text "Hoja Nro.: " + pdf.page_number.to_s.rjust(4,"0"), :at => [735, 550]
    end
    data = [["Periodo","legajo","Apellido y nombre"],
         [] ]

    Liquidacion.where(:fecha_cierre.nil?).each do |liq|
      liq.recibo_sueldos.each do |rec|
        if rec.employee.category_id == @category.id && (rec.employee.remuneracion_fuera_convenio == 0 || rec.employee.horas_pactadas == 0)
          data << [liq.periodo.strftime("%m/%Y") ,
                   rec.legajo,
                   rec.employee.full_name
                   ]
        end
      end
#      ReciboSueldo.joins(:employees).where(:liquidacion_id => liq.id).where( "employees.remuneracion_fuera_convenio" => 0 || "employees.horas_pactadas" => 0 && "employees.category_id" => @category.id ).each do |r|
    end

    pdf.table(data, :column_widths => [40, 100, 250],
             :cell_style => { :font => "Times-Roman",:size => 10,:padding => [4, 04,04,4], :align => :center, :valign => :center },
             :header => true ,
             :row_colors => ["F0F0F0", "FFFFCC"])


    pdf.render_file(filename)
  end


  def print
    require 'prawn'
    @categories = Category.all
    pdf = Prawn::Document.new
    pdf.draw_text "Categorias", :at => [100,740], :size => 16, :style => :bold
    pdf.bounding_box [10, 730], :width => 300, :height => 20 do
        pdf.stroke_bounds
    end
    pdf.draw_text "Descripcion", :at => [100,715], :size => 10  # columna, linea

    @banda = 700
    @categories.each do |cat|
       pdf.draw_text cat.detalle , :at => [15,@banda], :size => 10
       @banda -= 15
    end
    pdf.render_file('prawn.pdf')
  end

end
