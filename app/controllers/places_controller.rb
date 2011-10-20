class PlacesController < ApplicationController

  before_filter :find_place, :except => [:index, :new, :create]

  # GET /places
  # GET /places.xml
  def index
    @search = Place.search(params[:search])
    @places = @search.page(params[:page])#.per(10)

    respond_to do |format|
      format.html # index.html.erbb
      format.xml  { render :xml => @places }
    end
  end

  # GET /places/1
  # GET /places/1.xml
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @place }
    end
  end

  # GET /places/new
  # GET /places/new.xml
  def new
    @place = Place.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @place }
    end
  end

  # GET /places/1/edit
  def edit
  end

  # POST /places
  # POST /places.xml
  def create
    @place = Place.new(params[:place])

    respond_to do |format|
      if @place.save
        format.html { redirect_to(@place, :notice => 'Place was successfully created.') }
        format.xml  { render :xml => @place, :status => :created, :location => @place }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @place.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /places/1
  # PUT /places/1.xml
  def update

    respond_to do |format|
      if @place.update_attributes(params[:place])
        format.html { redirect_to(@place, :notice => 'Place was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @place.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /places/1
  # DELETE /places/1.xml
  def destroy
    begin
      @place.destroy
      flash[:success] = "successfully destroyed."
    rescue ActiveRecord::DeleteRestrictionError => e
      @place.errors.add(:base, e)
      flash[:error] = "#{e}"
      redirect_to place_url
    else
      redirect_to places_url
    end
  end

  def find_place
      @place = Place.find(params[:id])
  end
end
