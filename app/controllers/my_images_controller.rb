
class MyImagesController < ApplicationController

  before_filter :find_my_image, :except => [:index, :new, :create]

  respond_to :html, :xml, :json

  # GET /my_images
  # GET /my_images.json
  # GET /my_images.xml
  def index
    @my_images = MyImage.all
    flash.now[:notice] = t('flash.actions.index.notice') if @my_images.empty?
    respond_with(@my_images)
  end

  # GET /my_images/1
  # GET /my_images/1.json
  # GET /my_images/1.xml
  def show
    respond_with(@my_image)
  end

  # GET /my_images/new
  # GET /my_images/new.json
  # GET /my_images/new.xml
  def new
    @my_image = MyImage.new
    respond_with(@my_image)
  end

  # GET /my_images/1/edit
  # GET /my_images/1/edit.json
  # GET /my_images/1/edit.xml
  def edit
    respond_with(@my_image)
  end

  # POST /my_images
  # POST /my_images.json
  # POST /my_images.xml
  def create
    @my_image = MyImage.new(params[:my_image])
    flash[:notice] = t('scaffold.notice.created', :item => MyImage.model_name.human) if @my_image.save
    respond_with(@my_image, :location => my_images_path)
  end

  # PUT /my_images/1
  # PUT /my_images/1.json
  # PUT /my_images/1.xml
  def update
    flash[:notice] = t('scaffold.notice.updated', :item => MyImage.model_name.human) if @my_image.update_attributes(params[:my_image])
    respond_with(@my_image, :location => my_images_path)
  end

  # DELETE /my_images/1
  # DELETE /my_images/1.json
  # DELETE /my_images/1.xml
  def destroy
    flash[:notice] = t('scaffold.notice.destroyed', :item => MyImage.model_name.human) if @my_image.destroy
    respond_with(@my_image)
  end

  protected

  def find_my_image
    @my_image = MyImage.find(params[:id])
  end
end

