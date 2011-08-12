class CategoriesController < ApplicationController

  before_filter :find_category, :except => [:index, :new, :create]

  respond_to :html, :xml, :json

  # GET /categories
  # GET /categories.xml
  # GET /categories.json
  def index
    #@categories = Category.by_company(current_company.id).all
    @search = Category.by_company(current_company.id).search(params[:search])
    @categories = @search.page(params[:page])#.per(10)

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
    end
  end

  # GET /categories/new
  # GET /categories/new.xml
  def new
    @category = Category.by_company(current_company.id).new

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
    @category = Category.by_company(current_company.id).new(params[:category])

    respond_to do |format|
      if @category.save
        format.html { redirect_to(@category, :notice => 'Category was successfully created.') }
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
        format.html { redirect_to(@category, :notice => 'Category was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.xml
  def destroy
    @category.destroy

    respond_to do |format|
      format.html { redirect_to(categories_url) }
      format.xml  { head :ok }
    end
  end

  def find_category
    @category = Category.by_company(current_company.id).find(params[:id])
  end

  def print
    require 'prawn'
    @categories = Category.by_company(current_company.id).all
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





=begin
def imprimir
   require 'prawn'
   @factura = Factura.find(params[:id])

   Prawn::Document.generate('factura.pdf') do |pdf|

     pdf.draw_text "original", :at => [-4,400], :size => 8, :rotate => 90

     pdf.draw_text @factura.cliente.condicioniva.letra.to_s, :at => [243,710], :size => 16
     pdf.draw_text "Factura numero: 0000-" + @factura.numero.to_s, :at => [300,710], :size => 14
     pdf.draw_text "Fecha de emision: " + @factura.fecha.to_s, :at => [300,695], :size => 14

     empresa = "public/images/clinicA.jpg"
     pdf.image empresa, :at => [0,729], :width => 100

# recuadro de la letra
     pdf.line_width = 1
     pdf.bounding_box [233, 730], :width => 30, :height => 30 do
         pdf.stroke_bounds
     end

     pdf.draw_text "Cliente", :at => [10,650], :size => 10, :style => :bold
     pdf.draw_text "Razon social : " + @factura.cliente.razonsocial, :at => [10,640], :size => 10
     pdf.draw_text "CUIT : " + @factura.cliente.cuit, :at => [10,630], :size => 10
     pdf.draw_text "Condicion de IVA:" + @factura.cliente.condicioniva.detalle, :at => [10,620], :size => 10
     pdf.draw_text "Direccion : " + @factura.cliente.direccion, :at => [10,610], :size => 10

# recuadro de los datos del cliente
     pdf.line_width = 1
     pdf.bounding_box [-2, 730], :width => 500, :height => 150 do
         pdf.stroke_bounds
     end

     pdf.draw_text "Cantidad",   :at => [  1,565], :size => 10
     pdf.draw_text "Detalle" ,   :at => [100,565], :size => 10
     pdf.draw_text "Precio"  ,   :at => [250,565], :size => 10
     pdf.draw_text "% IVA"   ,   :at => [300,565], :size => 10
     pdf.draw_text "$ IVA"   ,   :at => [350,565], :size => 10
     pdf.draw_text "Total"   ,   :at => [400,565], :size => 10
# recuadro
     pdf.line_width = 1
      pdf.bounding_box [-2, 580], :width => 500, :height => 20 do
        pdf.stroke_bounds
      end
     @banda = 550
     @factura.detalles.each do |item|
        pdf.draw_text format("%5d" % item.cantidad).to_s(), :at => [1,@banda], :size => 10
        pdf.draw_text item.descripcion.to_s(), :at => [100,@banda], :size => 10
        pdf.draw_text item.preciounitario.to_s(), :at => [250,@banda], :size => 10
        pdf.draw_text item.tasaiva.to_s(), :at => [300,@banda], :size => 10
        pdf.draw_text item.totalivaitem.to_s(), :at => [350,@banda], :size => 10
        pdf.draw_text format("%.2f" % item.totalitem).to_s().rjust(10), :at => [400,@banda], :size => 10
        @banda -= 15
     end

     pdf.line_width = 1
     pdf.bounding_box [-2, 560], :width => 500, :height => 520 do
       pdf.stroke_bounds
     end

     pdf.draw_text "Total IVA", :at => [350,45], :size => 10
     pdf.draw_text "Total", :at => [400,45], :size => 10

     pdf.line_width = 1
     pdf.bounding_box [-2, 60], :width => 500, :height => 20 do
        pdf.stroke_bounds
     end

     pdf.draw_text @factura.total_iva_factura.to_s, :at => [350,25], :size => 12, :style => :bold
     pdf.draw_text @factura.importe.to_s, :at => [400,25], :size => 12, :style => :bold

     pdf.line_width = 1
     pdf.bounding_box [-2, 40], :width => 500, :height => 20 do
        pdf.stroke_bounds
     end

     @factura.printed_at = Date.today
   end
   respond_to do |format|
     if @factura.update_attributes(params[:factura])
       format.html { redirect_to(@factura, :notice => 'la Factura fue impresa correctamente.') }
       format.xml  { head :ok }
     else
       format.html { render :action => "edit" }
       format.xml  { render :xml => @factura.errors, :status => :unprocessable_entity }
     end
   end

 end
end
=end
