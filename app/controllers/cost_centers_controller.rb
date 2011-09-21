class CostCentersController < ApplicationController
before_filter :find_cost_center, :except => [:index, :new, :create]
  # GET /cost_centers
  # GET /cost_centers.xml
  def index
    #@cost_centers = CostCenter.by_company(current_company.id).all
    @search = CostCenter.by_company(current_company.id).search(params[:search])
    @cost_centers = @search.page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erbb
      format.xml  { render :xml => @cost_centers }
    end
  end

  # GET /cost_centers/1
  # GET /cost_centers/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cost_center }
    end
  end

  # GET /cost_centers/new
  # GET /cost_centers/new.xml
  def new
    @cost_center = CostCenter.by_company(current_company.id).new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cost_center }
    end
  end

  # GET /cost_centers/1/edit
  def edit
  end

  # POST /cost_centers
  # POST /cost_centers.xml
  def create
    @cost_center = CostCenter.by_company(current_company.id).new(params[:cost_center])

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
    begin
      @cost_center.destroy
      flash[:success] = "successfully destroyed."
    rescue ActiveRecord::DeleteRestrictionError => e
      @cost_center.errors.add(:base, e)
      flash[:error] = "#{e}"
    ensure
      redirect_to cost_center_url
    end
  end

  def find_cost_center
    @cost_center = CostCenter.by_company(current_company.id).find(params[:id])
  end
end
