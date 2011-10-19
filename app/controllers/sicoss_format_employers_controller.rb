class SicossFormatEmployersController < ApplicationController
  before_filter :retrive_modifield_recors_if_not_exist
  before_filter :find_sicoss_format_employer, :except => [:index, :new, :create]

  respond_to :html, :xml, :json

  # GET /sicoss_format_employers
  # GET /sicoss_format_employers.json
  # GET /sicoss_format_employers.xml
  def index
    @search = SicossFormatEmployer.search(params[:search])
    @sicoss_format_employers = @search.page(params[:page]).per(10)


    respond_to do |format|
      format.html # index.html.erbb
      format.xml  { render :xml => @sicoss_format_employers }
    end
  end

  # GET /sicoss_format_employers/1
  # GET /sicoss_format_employers/1.json
  # GET /sicoss_format_employers/1.xml
  def show
    respond_with(@sicoss_format_employer)
  end

  # GET /sicoss_format_employers/new
  # GET /sicoss_format_employers/new.json
  # GET /sicoss_format_employers/new.xml
  def new
    @sicoss_format_employer = SicossFormatEmployer.new
    respond_with(@sicoss_format_employer)
  end

  # GET /sicoss_format_employers/1/edit
  # GET /sicoss_format_employers/1/edit.json
  # GET /sicoss_format_employers/1/edit.xml
  def edit
  end

  # POST /sicoss_format_employers
  # POST /sicoss_format_employers.json
  # POST /sicoss_format_employers.xml
  def create
    @sicoss_format_employer = SicossFormatEmployer.new(params[:sicoss_format_employer])
    respond_to do |format|
      if @sicoss_format_employer.save
        format.html { redirect_to(@sicoss_format_employer, :notice => 'Sicoss Format by employer successfully created.') }
        format.xml  { render :xml => @sicoss_format_employer, :status => :created, :location => @sicoss_format_employer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sicoss_format_employer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sicoss_format_employers/1
  # PUT /sicoss_format_employers/1.json
  # PUT /sicoss_format_employers/1.xml
  def update
    respond_to do |format|
      if @sicoss_format_employer.update_attributes(params[:sicoss_format_employer])
        format.html { redirect_to(@sicoss_format_employer, :notice => 'Sicoss Format by enmployer was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sicoss_format_employer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sicoss_format_employers/1
  # DELETE /sicoss_format_employers/1.json
  # DELETE /sicoss_format_employers/1.xml
  def destroy
    @sicoss_format_employer.destroy

    respond_to do |format|
      format.html { redirect_to(sicoss_format_employers_url) }
      format.xml  { head :ok }
    end
  end


   def print
    require 'prawn'
    @sicoss_format_employe = SicossFormatEmployer.all
    pdf = Prawn::Document.new
    pdf.draw_text "Formato para SICOSS", :at => [100,740], :size => 16, :style => :bold
    pdf.bounding_box [10, 730], :width => 300, :height => 20 do
        pdf.stroke_bounds
    end
    pdf.draw_text "Descripcion", :at => [100,715], :size => 10  # columna, linea

    @banda = 700
    @sicoss_format_employe.each do |cat|
       pdf.draw_text cat.detalle , :at => [15,@banda], :size => 10
       @banda -= 15
    end
    pdf.render_file('prawn.pdf')
  end

  def retrive_modifield_recors_if_not_exist
    SicossFormat.where(:modifiable => true).each do |s|
      conditions = { :company_id => current_company.id,  :sicoss_format_id => s.id }
      SicossFormatEmployer.find(:first, :conditions => conditions) || SicossFormatEmployer.create(conditions)
    end
  end
  def find_sicoss_format_employer
     @sicoss_format_employer = SicossFormatEmployer.find(params[:id])
  end

end

