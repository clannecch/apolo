
class SicossRegimenTypesController < ApplicationController

  before_filter :find_sicoss_regimen_type, :except => [:index, :new, :create]

  respond_to :html, :xml, :json

  # GET /sicoss_regimen_types
  # GET /sicoss_regimen_types.json
  # GET /sicoss_regimen_types.xml
  def index
    @sicoss_regimen_types = SicossRegimenType.all
    flash.now[:notice] = t('flash.actions.index.notice') if @sicoss_regimen_types.empty?
    respond_with(@sicoss_regimen_types)
  end

  # GET /sicoss_regimen_types/1
  # GET /sicoss_regimen_types/1.json
  # GET /sicoss_regimen_types/1.xml
  def show
    respond_with(@sicoss_regimen_type)
  end

  # GET /sicoss_regimen_types/new
  # GET /sicoss_regimen_types/new.json
  # GET /sicoss_regimen_types/new.xml
  def new
    @sicoss_regimen_type = SicossRegimenType.new
    respond_with(@sicoss_regimen_type)
  end

  # GET /sicoss_regimen_types/1/edit
  # GET /sicoss_regimen_types/1/edit.json
  # GET /sicoss_regimen_types/1/edit.xml
  def edit
    respond_with(@sicoss_regimen_type)
  end

  # POST /sicoss_regimen_types
  # POST /sicoss_regimen_types.json
  # POST /sicoss_regimen_types.xml
  def create
    @sicoss_regimen_type = SicossRegimenType.new(params[:sicoss_regimen_type])
    flash[:notice] = t('scaffold.notice.created', :item => SicossRegimenType.model_name.human) if @sicoss_regimen_type.save
    respond_with(@sicoss_regimen_type, :location => sicoss_regimen_types_path)
  end

  # PUT /sicoss_regimen_types/1
  # PUT /sicoss_regimen_types/1.json
  # PUT /sicoss_regimen_types/1.xml
  def update
    flash[:notice] = t('scaffold.notice.updated', :item => SicossRegimenType.model_name.human) if @sicoss_regimen_type.update_attributes(params[:sicoss_regimen_type])
    respond_with(@sicoss_regimen_type, :location => sicoss_regimen_types_path)
  end

  # DELETE /sicoss_regimen_types/1
  # DELETE /sicoss_regimen_types/1.json
  # DELETE /sicoss_regimen_types/1.xml
  def destroy
    flash[:notice] = t('scaffold.notice.destroyed', :item => SicossRegimenType.model_name.human) if @sicoss_regimen_type.destroy
    respond_with(@sicoss_regimen_type)
  end

  protected

  def find_sicoss_regimen_type
    @sicoss_regimen_type = SicossRegimenType.find(params[:id])
  end
end

