class CountriesController < ApplicationController
  before_filter :find_country, :except => [:index, :new, :create] 
  
  # GET /countries
  # GET /countries.xml

  def index
    # TODO: cambiar todo este controlador y el detodos los modelos que tengan company_id por lo siguiente

    # reemplazar para cambio a modelo con compania compania
    #@countries = current_company.countries.all
    #@countries = Country.by_company(current_company.id).all
    @search = Country.by_company(current_company.id).search(params[:search])
    @countries = @search.page(params[:page]).per(10)

    # comentar para el cambio a modelo con compania
    #@countries = Country.all

    respond_to do |format|
      format.html # indexoo.html.erb
      format.xml  { render :xml => @countries }
    end
  end

  # GET /countries/1
  # GET /countries/1.xml
  def show
     respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @country }
    end
  end

  # GET /countries/new
  # GET /countries/new.xml
  def new
    @country = Country.by_company(current_company.id).new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @country }
    end
  end

  # GET /countries/1/edit
  def edit
  end

  # POST /countries
  # POST /countries.xml
  def create
    #raise params[:country].inspect
    @country = Country.by_company(current_company.id).new(params[:country])

    respond_to do |format|
      if @country.save
        format.html { redirect_to(@country, :notice => 'Country was successfully created.') }
        format.xml  { render :xml => @country, :status => :created, :location => @country }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @country.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /countries/1
  # PUT /countries/1.xml
  def update
      respond_to do |format|
      if @country.update_attributes(params[:country])
        format.html { redirect_to(@country, :notice => 'Country was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @country.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /countries/1
  # DELETE /countries/1.xml
  def destroy
    @country.destroy

    respond_to do |format|
      format.html { redirect_to(countries_url) }
      format.xml  { head :ok }
    end
  end

  protected

  def find_country
    @country = Country.by_company(current_company.id).find(params[:id])
  end

end
