class EmploymentsController < ApplicationController
  before_filter :find_employment, :except => [:index, :new, :create]
  # GET /employments
  # GET /employments.xml
  def index
#    @employments = Employment.all
    @search = Employment.search(params[:search])
    @employments = @search.page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erbb
      format.xml  { render :xml => @employments }
    end
  end

  # GET /employments/1
  # GET /employments/1.xml
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @employment }
    end
  end

  # GET /employments/new
  # GET /employments/new.xml
  def new
    @employment = Employment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @employment }
    end
  end

  # GET /employments/1/edit
  def edit
  end

  # POST /employments
  # POST /employments.xml
  def create
    @employment = Employment.new(params[:employment])

    respond_to do |format|
      if @employment.save
        format.html { redirect_to(@employment, :notice => 'Employment was successfully created.') }
        format.xml  { render :xml => @employment, :status => :created, :location => @employment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @employment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /employments/1
  # PUT /employments/1.xml
  def update

    respond_to do |format|
      if @employment.update_attributes(params[:employment])
        format.html { redirect_to(@employment, :notice => 'Employment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @employment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /employments/1
  # DELETE /employments/1.xml
  def destroy
    begin
      @employment.destroy
      flash[:success] = "successfully destroyed."
    rescue ActiveRecord::DeleteRestrictionError => e
      @employment.errors.add(:base, e)
      flash[:error] = "#{e}"
      redirect_to employment_url
    else
      redirect_to employments_url
    end
  end


  def find_employment
      @employment = Employment.find(params[:id])
  end


end
