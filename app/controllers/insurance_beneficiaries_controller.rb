class InsuranceBeneficiariesController < ApplicationController
  # GET /insurance_beneficiaries
  # GET /insurance_beneficiaries.xml
  def index
    @insurance_beneficiaries = InsuranceBeneficiary.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @insurance_beneficiaries }
    end
  end

  # GET /insurance_beneficiaries/1
  # GET /insurance_beneficiaries/1.xml
  def show
    @insurance_beneficiary = InsuranceBeneficiary.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @insurance_beneficiary }
    end
  end

  # GET /insurance_beneficiaries/new
  # GET /insurance_beneficiaries/new.xml
  def new
    @insurance_beneficiary = InsuranceBeneficiary.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @insurance_beneficiary }
    end
  end

  # GET /insurance_beneficiaries/1/edit
  def edit
    @insurance_beneficiary = InsuranceBeneficiary.find(params[:id])
  end

  # POST /insurance_beneficiaries
  # POST /insurance_beneficiaries.xml
  def create
    @insurance_beneficiary = InsuranceBeneficiary.new(params[:insurance_beneficiary])

    respond_to do |format|
      if @insurance_beneficiary.save
        format.html { redirect_to(@insurance_beneficiary, :notice => 'Insurance beneficiary was successfully created.') }
        format.xml  { render :xml => @insurance_beneficiary, :status => :created, :location => @insurance_beneficiary }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @insurance_beneficiary.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /insurance_beneficiaries/1
  # PUT /insurance_beneficiaries/1.xml
  def update
    @insurance_beneficiary = InsuranceBeneficiary.find(params[:id])

    respond_to do |format|
      if @insurance_beneficiary.update_attributes(params[:insurance_beneficiary])
        format.html { redirect_to(@insurance_beneficiary, :notice => 'Insurance beneficiary was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @insurance_beneficiary.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /insurance_beneficiaries/1
  # DELETE /insurance_beneficiaries/1.xml
  def destroy
    @insurance_beneficiary = InsuranceBeneficiary.find(params[:id])
    @insurance_beneficiary.destroy

    respond_to do |format|
      format.html { redirect_to(insurance_beneficiaries_url) }
      format.xml  { head :ok }
    end
  end
end
