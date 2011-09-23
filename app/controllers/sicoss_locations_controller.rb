
class SicossLocationsController < ApplicationController

  before_filter :find_sicoss_location, :except => [:index, :new, :create]

  respond_to :html, :xml, :json

  # GET /sicoss_locations
  # GET /sicoss_locations.json
  # GET /sicoss_locations.xml
  def index
    @sicoss_locations = SicossLocation.all
    flash.now[:notice] = t('flash.actions.index.notice') if @sicoss_locations.empty?
    respond_with(@sicoss_locations)
  end

  # GET /sicoss_locations/1
  # GET /sicoss_locations/1.json
  # GET /sicoss_locations/1.xml
  def show
    respond_with(@sicoss_location)
  end

  # GET /sicoss_locations/new
  # GET /sicoss_locations/new.json
  # GET /sicoss_locations/new.xml
  def new
    @sicoss_location = SicossLocation.new
    respond_with(@sicoss_location)
  end

  # GET /sicoss_locations/1/edit
  # GET /sicoss_locations/1/edit.json
  # GET /sicoss_locations/1/edit.xml
  def edit
    respond_with(@sicoss_location)
  end

  # POST /sicoss_locations
  # POST /sicoss_locations.json
  # POST /sicoss_locations.xml
  def create
    @sicoss_location = SicossLocation.new(params[:sicoss_location])
    flash[:notice] = t('scaffold.notice.created', :item => SicossLocation.model_name.human) if @sicoss_location.save
    respond_with(@sicoss_location, :location => sicoss_locations_path)
  end

  # PUT /sicoss_locations/1
  # PUT /sicoss_locations/1.json
  # PUT /sicoss_locations/1.xml
  def update
    flash[:notice] = t('scaffold.notice.updated', :item => SicossLocation.model_name.human) if @sicoss_location.update_attributes(params[:sicoss_location])
    respond_with(@sicoss_location, :location => sicoss_locations_path)
  end

  # DELETE /sicoss_locations/1
  # DELETE /sicoss_locations/1.json
  # DELETE /sicoss_locations/1.xml
  def destroy
    begin
      @sicoss_location.destroy
      flash[:success] = "successfully destroyed."
    rescue ActiveRecord::DeleteRestrictionError => e
      @sicoss_location.errors.add(:base, e)
      flash[:error] = "#{e}"
      redirect_to sicoss_location_url
    else
      redirect_to sicoss_locations_url
    end
  end

  protected

  def find_sicoss_location
    @sicoss_location = SicossLocation.find(params[:id])
  end
end

