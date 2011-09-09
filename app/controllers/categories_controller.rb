class CategoriesController < ApplicationController

  before_filter :find_category, :except => [:index, :new, :create]

  respond_to :html, :xml, :json

  # GET /categories
  # GET /categories.xml
  # GET /categories.json
  def index
    #@categories = Category.by_company(current_company.id).all
    @search = Category.by_company(current_company.id).search(params[:search])
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
