class BankDepositsController < ApplicationController
  before_filter :find_bank_deposit, :except => [:index, :new, :create]

  # GET /bank_deposits
  # GET /bank_deposits.xml
  def index
    #@bank_deposits = BankDeposit.by_company(current_company.id).all
    @search = BankDeposit.by_company(current_company.id).search(params[:search])
    @bank_deposits = @search.page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erbb
      format.xml  { render :xml => @bank_deposits }
    end
  end

  # GET /bank_deposits/1
  # GET /bank_deposits/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bank_deposit }
    end
  end

  # GET /bank_deposits/new
  # GET /bank_deposits/new.xml
  def new
    @bank_deposit = BankDeposit.by_company(current_company.id).new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bank_deposit }
    end
  end

  # GET /bank_deposits/1/edit
  def edit
  end

  # POST /bank_deposits
  # POST /bank_deposits.xml
  def create
    @bank_deposit = BankDeposit.by_company(current_company.id).new(params[:bank_deposit])

    respond_to do |format|
      if @bank_deposit.save
        format.html { redirect_to(@bank_deposit, :notice => 'Bank deposit was successfully created.') }
        format.xml  { render :xml => @bank_deposit, :status => :created, :location => @bank_deposit }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bank_deposit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bank_deposits/1
  # PUT /bank_deposits/1.xml
  def update
    respond_to do |format|
      if @bank_deposit.update_attributes(params[:bank_deposit])
        format.html { redirect_to(@bank_deposit, :notice => 'Bank deposit was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bank_deposit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bank_deposits/1
  # DELETE /bank_deposits/1.xml
  def destroy
    @bank_deposit.destroy

    respond_to do |format|
      format.html { redirect_to(bank_deposits_url) }
      format.xml  { head :ok }
    end
  end

  def find_bank_deposit
    @bank_deposit = BankDeposit.by_company(current_company.id).find(params[:id])
  end

end
