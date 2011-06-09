class LiquidacionsController < ApplicationController
  # GET /liquidacions
  # GET /liquidacions.xml
  def index
    @liquidacions = Liquidacion.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @liquidacions }
    end
  end

  # GET /liquidacions/1
  # GET /liquidacions/1.xml
  def show
    @liquidacion = Liquidacion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @liquidacion }
    end
  end

  # GET /liquidacions/new
  # GET /liquidacions/new.xml
  def new
    @liquidacion = Liquidacion.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @liquidacion }
    end
  end

  # GET /liquidacions/1/edit
  def edit
    @liquidacion = Liquidacion.find(params[:id])
  end

  # POST /liquidacions
  # POST /liquidacions.xml
  def create
    @liquidacion = Liquidacion.new(params[:liquidacion])

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
    @liquidacion = Liquidacion.find(params[:id])

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
    @liquidacion = Liquidacion.find(params[:id])
    @liquidacion.destroy

    respond_to do |format|
      format.html { redirect_to(liquidacions_url) }
      format.xml  { head :ok }
    end
  end
end
