class MaritalStatusesController < ApplicationController
  before_filter :find_marital_status, :except => [:index, :new, :create]

  # GET /marital_statuses
  # GET /marital_statuses.xml
  def index
    @search = MaritalStatus.by_company(current_company.id).search(params[:search])
    @marital_statuses = @search.page(params[:page])#.per(10)

    respond_to do |format|
      format.html # index.html.erbb
      format.xml  { render :xml => @marital_statuses }
    end
  end

  # GET /marital_statuses/1
  # GET /marital_statuses/1.xml
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @marital_status }
    end
  end

  # GET /marital_statuses/new
  # GET /marital_statuses/new.xml
  def new
    @marital_status = MaritalStatus.by_company(current_company.id).new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @marital_status }
    end
  end

  # GET /marital_statuses/1/edit
  def edit
  end

  # POST /marital_statuses
  # POST /marital_statuses.xml
  def create
    @marital_status = MaritalStatus.by_company(current_company.id).new(params[:marital_status])

    respond_to do |format|
      if @marital_status.save
        format.html { redirect_to(@marital_status, :notice => 'Marital status was successfully created.') }
        format.xml  { render :xml => @marital_status, :status => :created, :location => @marital_status }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @marital_status.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /marital_statuses/1
  # PUT /marital_statuses/1.xml
  def update

    respond_to do |format|
      if @marital_status.update_attributes(params[:marital_status])
        format.html { redirect_to(@marital_status, :notice => 'Marital status was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @marital_status.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /marital_statuses/1
  # DELETE /marital_statuses/1.xml
  def destroy
    @marital_status.destroy

    respond_to do |format|
      format.html { redirect_to(marital_statuses_url) }
      format.xml  { head :ok }
    end
  end
  def find_marital_status
      @marital_status = MaritalStatus.by_company(current_company.id).find(params[:id])
  end
end
