
class SicossReductionZonesController < ApplicationController

  before_filter :find_sicoss_reduction_zone, :except => [:index, :new, :create]

  respond_to :html, :xml, :json

  # GET /sicoss_reduction_zones
  # GET /sicoss_reduction_zones.json
  # GET /sicoss_reduction_zones.xml
  def index
    @sicoss_reduction_zones = SicossReductionZone.all
    flash.now[:notice] = t('flash.actions.index.notice') if @sicoss_reduction_zones.empty?
    respond_with(@sicoss_reduction_zones)
  end

  # GET /sicoss_reduction_zones/1
  # GET /sicoss_reduction_zones/1.json
  # GET /sicoss_reduction_zones/1.xml
  def show
    respond_with(@sicoss_reduction_zone)
  end

  # GET /sicoss_reduction_zones/new
  # GET /sicoss_reduction_zones/new.json
  # GET /sicoss_reduction_zones/new.xml
  def new
    @sicoss_reduction_zone = SicossReductionZone.new
    respond_with(@sicoss_reduction_zone)
  end

  # GET /sicoss_reduction_zones/1/edit
  # GET /sicoss_reduction_zones/1/edit.json
  # GET /sicoss_reduction_zones/1/edit.xml
  def edit
    respond_with(@sicoss_reduction_zone)
  end

  # POST /sicoss_reduction_zones
  # POST /sicoss_reduction_zones.json
  # POST /sicoss_reduction_zones.xml
  def create
    @sicoss_reduction_zone = SicossReductionZone.new(params[:sicoss_reduction_zone])
    flash[:notice] = t('scaffold.notice.created', :item => SicossReductionZone.model_name.human) if @sicoss_reduction_zone.save
    respond_with(@sicoss_reduction_zone, :location => sicoss_reduction_zones_path)
  end

  # PUT /sicoss_reduction_zones/1
  # PUT /sicoss_reduction_zones/1.json
  # PUT /sicoss_reduction_zones/1.xml
  def update
    flash[:notice] = t('scaffold.notice.updated', :item => SicossReductionZone.model_name.human) if @sicoss_reduction_zone.update_attributes(params[:sicoss_reduction_zone])
    respond_with(@sicoss_reduction_zone, :location => sicoss_reduction_zones_path)
  end

  # DELETE /sicoss_reduction_zones/1
  # DELETE /sicoss_reduction_zones/1.json
  # DELETE /sicoss_reduction_zones/1.xml
  def destroy
    begin
      @sicoss_reduction_zone.destroy
      flash[:success] = "successfully destroyed."
    rescue ActiveRecord::DeleteRestrictionError => e
      @sicoss_reduction_zone.errors.add(:base, e)
      flash[:error] = "#{e}"
    ensure
      redirect_to sicoss_reduction_zone_url
    end
  end

  protected

  def find_sicoss_reduction_zone
    @sicoss_reduction_zone = SicossReductionZone.find(params[:id])
  end
end

