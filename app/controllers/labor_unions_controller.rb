class LaborUnionsController < ApplicationController

  before_filter :find_labor_union, :except => [:index, :new, :create]

  # GET /labor_unions
  # GET /labor_unions.xml
  def index
    @labor_unions = LaborUnion.by_company(current_company.id).all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @labor_unions }
    end
  end

  # GET /labor_unions/1
  # GET /labor_unions/1.xml
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @labor_union }
    end
  end

  # GET /labor_unions/new
  # GET /labor_unions/new.xml
  def new
    @labor_union = LaborUnion.by_company(current_company.id).new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @labor_union }
    end
  end

  # GET /labor_unions/1/edit
  def edit
  end

  # POST /labor_unions
  # POST /labor_unions.xml
  def create
    @labor_union = LaborUnion.by_company(current_company.id).new(params[:labor_union])

    respond_to do |format|
      if @labor_union.save
        format.html { redirect_to(@labor_union, :notice => 'Labor union was successfully created.') }
        format.xml  { render :xml => @labor_union, :status => :created, :location => @labor_union }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @labor_union.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /labor_unions/1
  # PUT /labor_unions/1.xml
  def update

    respond_to do |format|
      if @labor_union.update_attributes(params[:labor_union])
        format.html { redirect_to(@labor_union, :notice => 'Labor union was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @labor_union.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /labor_unions/1
  # DELETE /labor_unions/1.xml
  def destroy
    @labor_union.destroy

    respond_to do |format|
      format.html { redirect_to(labor_unions_url) }
      format.xml  { head :ok }
    end
  end
  def find_labor_union
      @labor_union = LaborUnion.by_company(current_company.id).find(params[:id])
  end
end
