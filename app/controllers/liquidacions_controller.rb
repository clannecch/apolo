class LiquidacionsController < ApplicationController
  before_filter :find_liquidacion, :except => [:index, :new, :create]

  # GET /liquidacions
  # GET /liquidacions.xml
  def index
    @liquidacions = Liquidacion.by_company(current_company.id).all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @liquidacions }
    end
  end

  # GET /liquidacions/1
  # GET /liquidacions/1.xml
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @liquidacion }
    end
  end

  # GET /liquidacions/new
  # GET /liquidacions/new.xml
  def new
    @liquidacion = Liquidacion.by_company(current_company.id).new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @liquidacion }
    end
  end

  # GET /liquidacions/1/edit
  def edit
  end

  # POST /liquidacions
  # POST /liquidacions.xml
  def create
    @liquidacion = Liquidacion.by_company(current_company.id).new(params[:liquidacion])

    respond_to do |format|
      if @liquidacion.save
        format.html { redirect_to(@liquidacion, :notice => 'Liquidacion was successfully created.') }
        format.xml  { render :xml => @liquidacion, :status => :created, :location => @liquidacion }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @liquidacion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /liquidacions/1
  # PUT /liquidacions/1.xml
  def update

    respond_to do |format|
      if @liquidacion.update_attributes(params[:liquidacion])
        format.html { redirect_to(@liquidacion, :notice => 'Liquidacion was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @liquidacion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /liquidacions/1
  # DELETE /liquidacions/1.xml
  def destroy
    @liquidacion.destroy

    respond_to do |format|
      format.html { redirect_to(liquidacions_url) }
      format.xml  { head :ok }
    end
  end
  def find_liquidacion
      @liquidacion = Liquidacion.by_company(current_company.id).find(params[:id])
  end
end
