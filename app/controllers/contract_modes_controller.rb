class ContractModesController < ApplicationController
before_filter :find_contract_mode, :except => [:index, :new, :create]
  # GET /contract_modes
  # GET /contract_modes.xml
  def index
    @contract_modes = ContractMode.by_company(current_company.id).all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @contract_modes }
    end
  end

  # GET /contract_modes/1
  # GET /contract_modes/1.xml
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @contract_mode }
    end
  end

  # GET /contract_modes/new
  # GET /contract_modes/new.xml
  def new
    @contract_mode = ContractMode.by_company(current_company.id).new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @contract_mode }
    end
  end

  # GET /contract_modes/1/edit
  def edit
  end

  # POST /contract_modes
  # POST /contract_modes.xml
  def create
    @contract_mode = ContractMode.by_company(current_company.id).new(params[:contract_mode])

    respond_to do |format|
      if @contract_mode.save
        format.html { redirect_to(@contract_mode, :notice => 'Contract mode was successfully created.') }
        format.xml  { render :xml => @contract_mode, :status => :created, :location => @contract_mode }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @contract_mode.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /contract_modes/1
  # PUT /contract_modes/1.xml
  def update
    respond_to do |format|
      if @contract_mode.update_attributes(params[:contract_mode])
        format.html { redirect_to(@contract_mode, :notice => 'Contract mode was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @contract_mode.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /contract_modes/1
  # DELETE /contract_modes/1.xml
  def destroy
    @contract_mode.destroy

    respond_to do |format|
      format.html { redirect_to(contract_modes_url) }
      format.xml  { head :ok }
    end
  end

protected

  def find_contract_mode
    @contract_mode = ContractMode.by_company(current_company.id).find(params[:id])
   end

end
