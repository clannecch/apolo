class InsuranceCompaniesController < ApplicationController
  # GET /insurance_companies
  # GET /insurance_companies.xml
  def index
    @insurance_companies = InsuranceCompany.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @insurance_companies }
    end
  end

  # GET /insurance_companies/1
  # GET /insurance_companies/1.xml
  def show
    @insurance_company = InsuranceCompany.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @insurance_company }
    end
  end

  # GET /insurance_companies/new
  # GET /insurance_companies/new.xml
  def new
    @insurance_company = InsuranceCompany.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @insurance_company }
    end
  end

  # GET /insurance_companies/1/edit
  def edit
    @insurance_company = InsuranceCompany.find(params[:id])
  end

  # POST /insurance_companies
  # POST /insurance_companies.xml
  def create
    @insurance_company = InsuranceCompany.new(params[:insurance_company])

    respond_to do |format|
      if @insurance_company.save
        format.html { redirect_to(@insurance_company, :notice => 'Insurance company was successfully created.') }
        format.xml  { render :xml => @insurance_company, :status => :created, :location => @insurance_company }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @insurance_company.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /insurance_companies/1
  # PUT /insurance_companies/1.xml
  def update
    @insurance_company = InsuranceCompany.find(params[:id])

    respond_to do |format|
      if @insurance_company.update_attributes(params[:insurance_company])
        format.html { redirect_to(@insurance_company, :notice => 'Insurance company was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @insurance_company.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /insurance_companies/1
  # DELETE /insurance_companies/1.xml
  def destroy
    @insurance_company = InsuranceCompany.find(params[:id])
    @insurance_company.destroy

    respond_to do |format|
      format.html { redirect_to(insurance_companies_url) }
      format.xml  { head :ok }
    end
  end
end
