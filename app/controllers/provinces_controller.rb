class ProvincesController < ApplicationController

  before_filter :find_province, :except => [:index, :new, :create]

  # GET /provinces
  # GET /provinces.xml
  def index
    @provinces = Province.by_company(current_company.id).all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @provinces }
    end
  end

  # GET /provinces/1
  # GET /provinces/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @province }
    end
  end

  # GET /provinces/new
  # GET /provinces/new.xml
  def new
    @province = Province.by_company(current_company.id).new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @province }
    end
  end

  # GET /provinces/1/edit
  def edit
  end

  # POST /provinces
  # POST /provinces.xml
  def create
    @province = Province.by_company(current_company.id).new(params[:province])

    respond_to do |format|
      if @province.save
        format.html { redirect_to(@province, :notice => 'Province was successfully created.') }
        format.xml  { render :xml => @province, :status => :created, :location => @province }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @province.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /provinces/1
  # PUT /provinces/1.xml
  def update

    respond_to do |format|
      if @province.update_attributes(params[:province])
        format.html { redirect_to(@province, :notice => 'Province was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @province.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /provinces/1
  # DELETE /provinces/1.xml
  def destroy
    @province.destroy

    respond_to do |format|
      format.html { redirect_to(provinces_url) }
      format.xml  { head :ok }
    end
  end
  def find_province
      @province = Province.by_company(current_company.id).find(params[:id])
  end

end
