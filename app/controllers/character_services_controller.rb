class CharacterServicesController < ApplicationController

  before_filter :find_character_service, :except => [:index, :new, :create]

  # GET /character_services
  # GET /character_services.xml
  def index
    #@character_services = CharacterService.by_company(current_company.id).all
    @search = CharacterService.by_company(current_company.id).search(params[:search])
    @character_services = @search.page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erbb
      format.xml  { render :xml => @character_services }
    end
  end

  # GET /character_services/1
  # GET /character_services/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @character_service }
    end
  end

  # GET /character_services/new
  # GET /character_services/new.xml
  def new
    @character_service = CharacterService.by_company(current_company.id).new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @character_service }
    end
  end

  # GET /character_services/1/edit
  def edit
  end

  # POST /character_services
  # POST /character_services.xml
  def create
    @character_service = CharacterService.by_company(current_company.id).new(params[:character_service])

    respond_to do |format|
      if @character_service.save
        format.html { redirect_to(@character_service, :notice => 'Character service was successfully created.') }
        format.xml  { render :xml => @character_service, :status => :created, :location => @character_service }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @character_service.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /character_services/1
  # PUT /character_services/1.xml
  def update

    respond_to do |format|
      if @character_service.update_attributes(params[:character_service])
        format.html { redirect_to(@character_service, :notice => 'Character service was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @character_service.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /character_services/1
  # DELETE /character_services/1.xml
  def destroy
    @character_service.destroy

    respond_to do |format|
      format.html { redirect_to(character_services_url) }
      format.xml  { head :ok }
    end
  end
  def find_character_service
      @character_service = CharacterService.by_company(current_company.id).find(params[:id])
  end

end
