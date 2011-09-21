class AccountingImputationsController < ApplicationController
  before_filter :find_accounting_imputation, :except => [:index, :new, :create]

  # GET /accounting_imputations
  # GET /accounting_imputations.xml
  def index
    # TODO: mejorar la forma de traer este conjunto de registros!!! (se pueden usar optimize, :fixme, :todo) se llama con rake notes o rake notes:todo
    @search = AccountingImputation.search(params[:search])
    @accounting_imputations = @search.page(params[:page]).per(10)
    #@accounting_imputations = AccountingImputation.by_company(current_company.id).all

    respond_to do |format|
      format.html # indexoo.html.erb
      format.xml  { render :xml => @accounting_imputations }
    end
  end

  # GET /accounting_imputations/1
  # GET /accounting_imputations/1.xml
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @accounting_imputation }
    end
  end

  # GET /accounting_imputations/new
  # GET /accounting_imputations/new.xml
  def new
    @accounting_imputation = AccountingImputation.by_company(current_company.id).new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @accounting_imputation }
    end
  end

  # GET /accounting_imputations/1/edit
  def edit
  end

  # POST /accounting_imputations
  # POST /accounting_imputations.xml
  def create
    @accounting_imputation = AccountingImputation.by_company(current_company.id).new(params[:accounting_imputation])

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
    begin
      @accounting_imputation.destroy
      flash[:success] = "successfully destroyed."
    rescue ActiveRecord::DeleteRestrictionError => e
      @accounting_imputation.errors.add(:base, e)
      flash[:error] = "#{e}"
    ensure
      redirect_to accounting_imputation_url
    end
  end

  def find_accounting_imputation
    @accounting_imputation = AccountingImputation.by_company(current_company.id).find(params[:id])
  end
end
