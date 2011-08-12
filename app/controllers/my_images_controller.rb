class MyImagesController < ApplicationController

  downloads_files_for :my_image, :avatar

  # GET /my_image
  # GET /my_images.xml
  def index
    @my_images = MyImage.all

    respond_to do |format|
      format.html # index.html.erbb
      format.xml  { render :xml => @my_images }
    end
  end

  # GET /my_image/1
  # GET /my_image/1.xml
  def show
    @my_image = MyImage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @my_image }
    end
  end

  # GET /my_images/new
  # GET /my_images/new.xml
  def new
    @my_image = MyImage.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @my_image }
    end
  end

  # GET /my_images/1/edit
  def edit
    @my_image = MyImage.find(params[:id])
  end

  # POST /my_images
  # POST /my_images.xml
  def create
    @my_image = MyImage.new(params[:my_image])

    respond_to do |format|
      if @my_image.save
        flash[:notice] = 'My image was successfully created.'
        format.html { redirect_to(@my_image) }
        format.xml  { render :xml => @my_image, :status => :created, :location => @my_image }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @my_image.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /my_images/1
  # PUT /my_images/1.xml
  def update
    @my_image = MyImage.find(params[:id])

    respond_to do |format|
      if @my_image.update_attributes(params[:my_image])
        flash[:notice] = 'My Image was successfully updated.'
        format.html { redirect_to(@my_image) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @my_image.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /my_images/1
  # DELETE /my_images/1.xml
  def destroy
    @my_image = MyImage.find(params[:id])
    @my_image.destroy

    respond_to do |format|
      format.html { redirect_to(my_image_url) }
      format.xml  { head :ok }
    end
  end

end
