class CostCentersController < ApplicationController
  # GET /cost_centers
  # GET /cost_centers.xml
  def index
    @cost_centers = CostCenter.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cost_centers }
    end
  end

  # GET /cost_centers/1
  # GET /cost_centers/1.xml
  def show
    @cost_center = CostCenter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cost_center }
    end
  end

  # GET /cost_centers/new
  # GET /cost_centers/new.xml
  def new
    @cost_center = CostCenter.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cost_center }
    end
  end

  # GET /cost_centers/1/edit
  def edit
    @cost_center = CostCenter.find(params[:id])
  end

  # POST /cost_centers
  # POST /cost_centers.xml
  def create
    @cost_center = CostCenter.new(params[:cost_center])

    respond_to do |format|
      if @cost_center.save
        format.html { redirect_to(@cost_center, :notice => 'Cost center was successfully created.') }
        format.xml  { render :xml => @cost_center, :status => :created, :location => @cost_center }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cost_center.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cost_centers/1
  # PUT /cost_centers/1.xml
  def update
    @cost_center = CostCenter.find(params[:id])

    respond_to do |format|
      if @cost_center.update_attributes(params[:cost_center])
        format.html { redirect_to(@cost_center, :notice => 'Cost center was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cost_center.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cost_centers/1
  # DELETE /cost_centers/1.xml
  def destroy
    @cost_center = CostCenter.find(params[:id])
    @cost_center.destroy

    respond_to do |format|
      format.html { redirect_to(cost_centers_url) }
      format.xml  { head :ok }
    end
  end
end
