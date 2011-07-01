class DetalleReciboHabersController < ApplicationController
  before filter :find_liquidacion
  before_filter :find_recibo_Sueldo

  # GET /detalle_recibo_habers
  # GET /detalle_recibo_habers.xml
  def index
    @detalle_recibo_habers = @recibo_sueldo.detalle_recibo_habers.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @detalle_recibo_habers }
    end
  end

  # GET /detalle_recibo_habers/1
  # GET /detalle_recibo_habers/1.xml
  def show
    @detalle_recibo_haber = @recibo_sueldo.detalle_recibo_habers.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @detalle_recibo_haber }
    end
  end

  # GET /detalle_recibo_habers/new
  # GET /detalle_recibo_habers/new.xml
  def new
    @detalle_recibo_haber = @recibo_sueldo.detalle_recibo_haber.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @detalle_recibo_haber }
    end
  end

  # GET /detalle_recibo_habers/1/edit
  def edit
    @detalle_recibo_haber = @recibo_sueldo.detalle_recibo_habers.find(params[:id])
  end

  # POST /detalle_recibo_habers
  # POST /detalle_recibo_habers.xml
  def create
    @detalle_recibo_haber = @recibo_sueldo.detalle_recibo_haber.build(params[@liquidacion, @recibo_sueldo,:detalle_recibo_haber])

    respond_to do |format|
      if @detalle_recibo_haber.save
        format.html { redirect_to([@liquidacion,@recibo_sueldo,@detalle_recibo_haber], :notice => 'Detalle recibo haber was successfully created.') }
        format.xml  { render :xml => @detalle_recibo_haber, :status => :created, :location => @detalle_recibo_haber }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @detalle_recibo_haber.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /detalle_recibo_habers/1
  # PUT /detalle_recibo_habers/1.xml
  def update
    @detalle_recibo_haber = @recibo_sueldo.detalle_recibo_habers.find(params[:id])

    respond_to do |format|
      if @detalle_recibo_haber.update_attributes(params[:detalle_recibo_haber])
        format.html { redirect_to([@liquidacion,@recibo_sueldo,@detalle_recibo_haber], :notice => 'Detalle recibo haber was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @detalle_recibo_haber.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /detalle_recibo_habers/1
  # DELETE /detalle_recibo_habers/1.xml
  def destroy
    @detalle_recibo_haber = @recibo_sueldo.detalle_recibo_habers.find(params[:id])
    @detalle_recibo_haber.destroy

    respond_to do |format|
      format.html { redirect_to(liquidacion_recibo_sueldo_detalle_recibo_habers_url) }
      format.xml  { head :ok }
    end
  end

  protected
  def liquidacion
    raise "Debe Ingresar con Liquidacion!!!!!!!!!!!" if params[:liquidacion_id].blank?
    @liquidacion = Liquidacion.find(params[:liquidacion_id])
  end
  def find_recibo_sueldo

    raise "Debe ingresar un recibo_sueldo!!!!!!!!!!!" if params[:recibi_sueldo_id].blank?
    @recibo_sueldo = @liquidacion.recibo_sueldos.find(params[:recibo_sueldo_id])
  end

end
