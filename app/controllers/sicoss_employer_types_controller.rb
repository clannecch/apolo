
class SicossEmployerTypesController < ApplicationController

  before_filter :find_sicoss_employer_type, :except => [:index, :new, :create]

  respond_to :html, :xml, :json

  # GET /sicoss_employer_types
  # GET /sicoss_employer_types.json
  # GET /sicoss_employer_types.xml
  def index
    @sicoss_employer_types = SicossEmployerType.all
    flash.now[:notice] = t('flash.actions.index.notice') if @sicoss_employer_types.empty?
    respond_with(@sicoss_employer_types)
  end

  # GET /sicoss_employer_types/1
  # GET /sicoss_employer_types/1.json
  # GET /sicoss_employer_types/1.xml
  def show
    respond_with(@sicoss_employer_type)
  end

  # GET /sicoss_employer_types/new
  # GET /sicoss_employer_types/new.json
  # GET /sicoss_employer_types/new.xml
  def new
    @sicoss_employer_type = SicossEmployerType.new
    respond_with(@sicoss_employer_type)
  end

  # GET /sicoss_employer_types/1/edit
  # GET /sicoss_employer_types/1/edit.json
  # GET /sicoss_employer_types/1/edit.xml
  def edit
    respond_with(@sicoss_employer_type)
  end

  # POST /sicoss_employer_types
  # POST /sicoss_employer_types.json
  # POST /sicoss_employer_types.xml
  def create
    @sicoss_employer_type = SicossEmployerType.new(params[:sicoss_employer_type])
    flash[:notice] = t('scaffold.notice.created', :item => SicossEmployerType.model_name.human) if @sicoss_employer_type.save
    respond_with(@sicoss_employer_type, :location => sicoss_employer_types_path)
  end

  # PUT /sicoss_employer_types/1
  # PUT /sicoss_employer_types/1.json
  # PUT /sicoss_employer_types/1.xml
  def update
    flash[:notice] = t('scaffold.notice.updated', :item => SicossEmployerType.model_name.human) if @sicoss_employer_type.update_attributes(params[:sicoss_employer_type])
    respond_with(@sicoss_employer_type, :location => sicoss_employer_types_path)
  end

  # DELETE /sicoss_employer_types/1
  # DELETE /sicoss_employer_types/1.json
  # DELETE /sicoss_employer_types/1.xml
  def destroy
    flash[:notice] = t('scaffold.notice.destroyed', :item => SicossEmployerType.model_name.human) if @sicoss_employer_type.destroy
    respond_with(@sicoss_employer_type)
  end

  protected

  def find_sicoss_employer_type
    @sicoss_employer_type = SicossEmployerType.find(params[:id])
  end
end

