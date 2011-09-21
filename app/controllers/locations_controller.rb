class LocationsController < ApplicationController
  before_filter :find_location, :except => [:index, :new, :create]
  # GET /locations
  # GET /locations.xml
  def index
    @search = Location.by_company(current_company.id).search(params[:search])
    @locations = @search.page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erbb
      format.xml  { render :xml => @locations }
    end
  end

  # GET /locations/1
  # GET /locations/1.xml
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @location }
    end
  end

  # GET /locations/new
  # GET /locations/new.xml
  def new
    @location = Location.by_company(current_company.id).new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @location }
    end
  end

  # GET /locations/1/edit
  def edit
  end

  # POST /locations
  # POST /locations.xml
  def create
    @location = Location.by_company(current_company.id).new(params[:location])

    respond_to do |format|
      if @location.save
        format.html { redirect_to(@location, :notice => 'Location was successfully created.') }
        format.xml  { render :xml => @location, :status => :created, :location => @location }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @location.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /locations/1
  # PUT /locations/1.xml
  def update

    respond_to do |format|
      if @location.update_attributes(params[:location])
        format.html { redirect_to(@location, :notice => 'Location was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @location.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.xml
  def destroy
    begin
      @location.destroy
      flash[:success] = "successfully destroyed."
    rescue ActiveRecord::DeleteRestrictionError => e
      @location.errors.add(:base, e)
      flash[:error] = "#{e}"
    ensure
      redirect_to location_url
    end
  end

  def find_location
      @location = Location.by_company(current_company.id).find(params[:id])
  end
end
