class NationalitiesController < ApplicationController

  before_filter :find_nationality, :except => [:index, :new, :create]

  # GET /nationalities
  # GET /nationalities.xml
  def index
    @search = Nationality.search(params[:search])
    @nationalities = @search.page(params[:page])#.per(10)

    respond_to do |format|
      format.html # index.html.erbb
      format.xml  { render :xml => @nationalities }
    end
  end

  # GET /nationalities/1
  # GET /nationalities/1.xml
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @nationality }
    end
  end

  # GET /nationalities/new
  # GET /nationalities/new.xml
  def new
    @nationality = Nationality.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @nationality }
    end
  end

  # GET /nationalities/1/edit
  def edit
  end

  # POST /nationalities
  # POST /nationalities.xml
  def create
    @nationality = Nationality.new(params[:nationality])

    respond_to do |format|
      if @nationality.save
        format.html { redirect_to(@nationality, :notice => 'Nationality was successfully created.') }
        format.xml  { render :xml => @nationality, :status => :created, :location => @nationality }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @nationality.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /nationalities/1
  # PUT /nationalities/1.xml
  def update

    respond_to do |format|
      if @nationality.update_attributes(params[:nationality])
        format.html { redirect_to(@nationality, :notice => 'Nationality was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @nationality.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /nationalities/1
  # DELETE /nationalities/1.xml
  def destroy
    begin
      @nationality.destroy
      flash[:success] = "successfully destroyed."
    rescue ActiveRecord::DeleteRestrictionError => e
      @nationality.errors.add(:base, e)
      flash[:error] = "#{e}"
       redirect_to nationality_url
    else
       redirect_to nationalities_url
    end
  end

  def find_nationality
      @nationality = Nationality.find(params[:id])
  end

end
