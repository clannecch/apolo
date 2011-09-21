class BankDepositAccountTypesController < ApplicationController
  before_filter :bank_deposit_account_type, :except => [:index, :new, :create]

  # GET /bank_deposit_account_types
  # GET /bank_deposit_account_types.xml
  def index
    #@bank_deposit_account_types = BankDepositAccountType.by_company(current_company.id).all
    @search = BankDepositAccountType.by_company(current_company.id).search(params[:search])
    @bank_deposit_account_types = @search.page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erbb
      format.xml  { render :xml => @bank_deposit_account_types }
    end
  end

  # GET /bank_deposit_account_types/1
  # GET /bank_deposit_account_types/1.xml
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bank_deposit_account_type }
    end
  end

  # GET /bank_deposit_account_types/new
  # GET /bank_deposit_account_types/new.xml
  def new
    @bank_deposit_account_type = BankDepositAccountType.by_company(current_company.id).new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bank_deposit_account_type }
    end
  end

  # GET /bank_deposit_account_types/1/edit
  def edit
  end

  # POST /bank_deposit_account_types
  # POST /bank_deposit_account_types.xml
  def create
    @bank_deposit_account_type = BankDepositAccountType.by_company(current_company.id).new(params[:bank_deposit_account_type])

    respond_to do |format|
      if @bank_deposit_account_type.save
        format.html { redirect_to(@bank_deposit_account_type, :notice => 'Bank deposit account type was successfully created.') }
        format.xml  { render :xml => @bank_deposit_account_type, :status => :created, :location => @bank_deposit_account_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bank_deposit_account_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bank_deposit_account_types/1
  # PUT /bank_deposit_account_types/1.xml
  def update

    respond_to do |format|
      if @bank_deposit_account_type.update_attributes(params[:bank_deposit_account_type])
        format.html { redirect_to(@bank_deposit_account_type, :notice => 'Bank deposit account type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bank_deposit_account_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bank_deposit_account_types/1
  # DELETE /bank_deposit_account_types/1.xml
  def destroy
    begin
      @bank_deposit_account_type.destroy
      flash[:success] = "successfully destroyed."
    rescue ActiveRecord::DeleteRestrictionError => e
      @bank_deposit_account_type.errors.add(:base, e)
      flash[:error] = "#{e}"
    ensure
      redirect_to bank_deposit_account_type_url
    end
  end

  def bank_deposit_account_type
    @bank_deposit_account_type = BankDepositAccountType.by_company(current_company.id).find(params[:id])
  end

end
