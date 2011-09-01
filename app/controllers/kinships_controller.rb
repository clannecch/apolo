
class KinshipsController < ApplicationController

  before_filter :find_kinship, :except => [:index, :new, :create]

  respond_to :html, :xml, :json

  # GET /kinships
  # GET /kinships.json
  # GET /kinships.xml
  def index
    @kinships = Kinship.all
    flash.now[:notice] = t('flash.actions.index.notice') if @kinships.empty?
    respond_with(@kinships)
  end

  # GET /kinships/1
  # GET /kinships/1.json
  # GET /kinships/1.xml
  def show
    respond_with(@kinship)
  end

  # GET /kinships/new
  # GET /kinships/new.json
  # GET /kinships/new.xml
  def new
    @kinship = Kinship.new
    respond_with(@kinship)
  end

  # GET /kinships/1/edit
  # GET /kinships/1/edit.json
  # GET /kinships/1/edit.xml
  def edit
    respond_with(@kinship)
  end

  # POST /kinships
  # POST /kinships.json
  # POST /kinships.xml
  def create
    @kinship = Kinship.new(params[:kinship])
    flash[:notice] = t('scaffold.notice.created', :item => Kinship.model_name.human) if @kinship.save
    respond_with(@kinship, :location => kinships_path)
  end

  # PUT /kinships/1
  # PUT /kinships/1.json
  # PUT /kinships/1.xml
  def update
    flash[:notice] = t('scaffold.notice.updated', :item => Kinship.model_name.human) if @kinship.update_attributes(params[:kinship])
    respond_with(@kinship, :location => kinships_path)
  end

  # DELETE /kinships/1
  # DELETE /kinships/1.json
  # DELETE /kinships/1.xml
  def destroy
    flash[:notice] = t('scaffold.notice.destroyed', :item => Kinship.model_name.human) if @kinship.destroy
    respond_with(@kinship)
  end

  protected

  def find_kinship
    @kinship = Kinship.find(params[:id])
  end
end

