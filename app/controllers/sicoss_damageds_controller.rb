
class SicossDamagedsController < ApplicationController

  before_filter :find_sicoss_damaged, :except => [:index, :new, :create]

  respond_to :html, :xml, :json

  # GET /sicoss_damageds
  # GET /sicoss_damageds.json
  # GET /sicoss_damageds.xml
  def index
    @sicoss_damageds = SicossDamaged.all
    flash.now[:notice] = t('flash.actions.index.notice') if @sicoss_damageds.empty?
    respond_with(@sicoss_damageds)
  end

  # GET /sicoss_damageds/1
  # GET /sicoss_damageds/1.json
  # GET /sicoss_damageds/1.xml
  def show
    respond_with(@sicoss_damaged)
  end

  # GET /sicoss_damageds/new
  # GET /sicoss_damageds/new.json
  # GET /sicoss_damageds/new.xml
  def new
    @sicoss_damaged = SicossDamaged.new
    respond_with(@sicoss_damaged)
  end

  # GET /sicoss_damageds/1/edit
  # GET /sicoss_damageds/1/edit.json
  # GET /sicoss_damageds/1/edit.xml
  def edit
    respond_with(@sicoss_damaged)
  end

  # POST /sicoss_damageds
  # POST /sicoss_damageds.json
  # POST /sicoss_damageds.xml
  def create
    @sicoss_damaged = SicossDamaged.new(params[:sicoss_damaged])
    flash[:notice] = t('scaffold.notice.created', :item => SicossDamaged.model_name.human) if @sicoss_damaged.save
    respond_with(@sicoss_damaged, :location => sicoss_damageds_path)
  end

  # PUT /sicoss_damageds/1
  # PUT /sicoss_damageds/1.json
  # PUT /sicoss_damageds/1.xml
  def update
    flash[:notice] = t('scaffold.notice.updated', :item => SicossDamaged.model_name.human) if @sicoss_damaged.update_attributes(params[:sicoss_damaged])
    respond_with(@sicoss_damaged, :location => sicoss_damageds_path)
  end

  # DELETE /sicoss_damageds/1
  # DELETE /sicoss_damageds/1.json
  # DELETE /sicoss_damageds/1.xml
  def destroy
    begin
      @sicoss_damaged.destroy
      flash[:success] = "successfully destroyed."
    rescue ActiveRecord::DeleteRestrictionError => e
      @sicoss_damaged.errors.add(:base, e)
      flash[:error] = "#{e}"
      redirect_to sicoss_damaged_url
    else
      redirect_to sicoss_damageds_url
    end
  end

  protected

  def find_sicoss_damaged
    @sicoss_damaged = SicossDamaged.find(params[:id])
  end
end

