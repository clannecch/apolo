class KinshipsController < ApplicationController

  before_filter :find_kinship, :except => [:index, :new, :create]

  # GET /kinships
  # GET /kinships.json
  # GET /kinships.xml
  def index
    #@search = Kinship.by_company(current_company.id).search(params[:search])
    @search = Kinship.search(params[:search])
    @kinships = @search.page(params[:page]).per(10)
    respond_to do |format|
       format.html # indexoo.html.erb
       format.xml  { render :xml => @kinships }
    end
  end

  # GET /kinships/1
  # GET /kinships/1.json
  # GET /kinships/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @kinship }
    end
  end

  # GET /kinships/new
  # GET /kinships/new.json
  # GET /kinships/new.xml
  def new
    # @kinship = Kinship.by_company(current_company.id).new
    @kinship = Kinship.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @kinship }
    end
  end

  # GET /kinships/1/edit
  # GET /kinships/1/edit.json
  # GET /kinships/1/edit.xml
  def edit
  end

  # POST /kinships
  # POST /kinships.json
  # POST /kinships.xml
  def create

    # @kinship = Kinship.by_company(current_company.id).new(params[:kinship])
    @kinship = Kinship.new(params[:kinship])
    
    respond_to do |format|
      if @kinship.save
        format.html { redirect_to(@kinship, :notice => 'Kinship as successfully created.') }
        format.xml  { render :xml => @kinship, :status => :created, :location => @kinship }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @kinship.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /kinships/1
  # PUT /kinships/1.json
  # PUT /kinships/1.xml
  def update
    respond_to do |format|
      if @kinship.update_attributes(params[:kinship])
        format.html { redirect_to(@kinship, :notice => 'kinship was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @kinship.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /kinships/1
  # DELETE /kinships/1.json
  # DELETE /kinships/1.xml
  def destroy
    begin
      @kinship.destroy
      flash[:success] = "successfully destroyed."
    rescue ActiveRecord::DeleteRestrictionError => e
      @kinship.errors.add(:base, e)
      flash[:error] = "#{e}"
      redirect_to kinship_url
    else
      redirect_to kinships_url
    end
  end

  def find_kinship
      # @kinship = Kinship.by_company(current_company.id).find(params[:id])
      @kinship = Kinship.find(params[:id])
  end
end

