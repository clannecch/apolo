class ReciboSueldosController < ApplicationController
  # GET /recibo_sueldos
  # GET /recibo_sueldos.xml
  def index
    @recibo_sueldos = ReciboSueldo.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @recibo_sueldos }
    end
  end

  # GET /recibo_sueldos/1
  # GET /recibo_sueldos/1.xml
  def show
    @recibo_sueldo = ReciboSueldo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @recibo_sueldo }
    end
  end

  # GET /recibo_sueldos/new
  # GET /recibo_sueldos/new.xml
  def new
    @recibo_sueldo = ReciboSueldo.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @recibo_sueldo }
    end
  end

  # GET /recibo_sueldos/1/edit
  def edit
    @recibo_sueldo = ReciboSueldo.find(params[:id])
  end

  # POST /recibo_sueldos
  # POST /recibo_sueldos.xml
  def create
    @recibo_sueldo = ReciboSueldo.new(params[:recibo_sueldo])

    respond_to do |format|
      if @recibo_sueldo.save
        format.html { redirect_to(@recibo_sueldo, :notice => 'Recibo sueldo was successfully created.') }
        format.xml  { render :xml => @recibo_sueldo, :status => :created, :location => @recibo_sueldo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @recibo_sueldo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /recibo_sueldos/1
  # PUT /recibo_sueldos/1.xml
  def update
    @recibo_sueldo = ReciboSueldo.find(params[:id])

    respond_to do |format|
      if @recibo_sueldo.update_attributes(params[:recibo_sueldo])
        format.html { redirect_to(@recibo_sueldo, :notice => 'Recibo sueldo was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @recibo_sueldo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /recibo_sueldos/1
  # DELETE /recibo_sueldos/1.xml
  def destroy
    @recibo_sueldo = ReciboSueldo.find(params[:id])
    @recibo_sueldo.destroy

    respond_to do |format|
      format.html { redirect_to(recibo_sueldos_url) }
      format.xml  { head :ok }
    end
  end
end
