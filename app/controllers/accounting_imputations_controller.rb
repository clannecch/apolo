class AccountingImputationsController < ApplicationController
  # GET /accounting_imputations
  # GET /accounting_imputations.xml
  def index
    @accounting_imputations = AccountingImputation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @accounting_imputations }
    end
  end

  # GET /accounting_imputations/1
  # GET /accounting_imputations/1.xml
  def show
    @accounting_imputation = AccountingImputation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @accounting_imputation }
    end
  end

  # GET /accounting_imputations/new
  # GET /accounting_imputations/new.xml
  def new
    @accounting_imputation = AccountingImputation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @accounting_imputation }
    end
  end

  # GET /accounting_imputations/1/edit
  def edit
    @accounting_imputation = AccountingImputation.find(params[:id])
  end

  # POST /accounting_imputations
  # POST /accounting_imputations.xml
  def create
    @accounting_imputation = AccountingImputation.new(params[:accounting_imputation])

    respond_to do |format|
      if @accounting_imputation.save
        format.html { redirect_to(@accounting_imputation, :notice => 'Accounting imputation was successfully created.') }
        format.xml  { render :xml => @accounting_imputation, :status => :created, :location => @accounting_imputation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @accounting_imputation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /accounting_imputations/1
  # PUT /accounting_imputations/1.xml
  def update
    @accounting_imputation = AccountingImputation.find(params[:id])

    respond_to do |format|
      if @accounting_imputation.update_attributes(params[:accounting_imputation])
        format.html { redirect_to(@accounting_imputation, :notice => 'Accounting imputation was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @accounting_imputation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /accounting_imputations/1
  # DELETE /accounting_imputations/1.xml
  def destroy
    @accounting_imputation = AccountingImputation.find(params[:id])
    @accounting_imputation.destroy

    respond_to do |format|
      format.html { redirect_to(accounting_imputations_url) }
      format.xml  { head :ok }
    end
  end
end
