class HealthInsurancesController < ApplicationController
  before_filter :find_health_insurance, :except => [:index, :new, :create]
  # GET /health_insurances
  # GET /health_insurances.xml
  def index
    #@health_insurances = HealthInsurance.all
    @search = HealthInsurance.by_company(current_company.id).search(params[:search])
    @health_insurances = @search.page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erbb
      format.xml  { render :xml => @health_insurances }
    end
  end

  # GET /health_insurances/1
  # GET /health_insurances/1.xml
  def show

    respond_to do |format|
      format.html # show.html.erb
        format.xml  { render :xml => @health_insurance }
    end
  end

  # GET /health_insurances/new
  # GET /health_insurances/new.xml
  def new
    @health_insurance = HealthInsurance.by_company(current_company.id).new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @health_insurance }
    end
  end

  # GET /health_insurances/1/edit
  def edit
  end

  # POST /health_insurances
  # POST /health_insurances.xml
  def create
    @health_insurance = HealthInsurance.by_company(current_company.id).new(params[:health_insurance])

    respond_to do |format|
      if @health_insurance.save
        format.html { redirect_to(@health_insurance, :notice => 'Health insurance was successfully created.') }
        format.xml  { render :xml => @health_insurance, :status => :created, :location => @health_insurance }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @health_insurance.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /health_insurances/1
  # PUT /health_insurances/1.xml
  def update

    respond_to do |format|
      if @health_insurance.update_attributes(params[:health_insurance])
        format.html { redirect_to(@health_insurance, :notice => 'Health insurance was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @health_insurance.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /health_insurances/1
  # DELETE /health_insurances/1.xml
  def destroy
    @health_insurance.destroy

    respond_to do |format|
      format.html { redirect_to(health_insurances_url) }
      format.xml  { head :ok }
    end
  end
  def find_health_insurance
      @health_insurance = HealthInsurance.by_company(current_company.id).find(params[:id])
  end
end
