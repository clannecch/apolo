class DetalleReciboRetencionsController < ApplicationController
  # GET /detalle_recibo_retencions
  # GET /detalle_recibo_retencions.xml
  before filter :find_liquidacion
  before_filter :find_recibo_Sueldo
  def index
    @detalle_recibo_retencions = @recibo_sueldo.detalle_recibo_retencions.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @detalle_recibo_retencions }
    end
  end

  # GET /detalle_recibo_retencions/1
  # GET /detalle_recibo_retencions/1.xml
  def show
    @detalle_recibo_retencion = @recibo_sueldo.detalle_recibo_retencions.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @detalle_recibo_retencion }
    end
  end

  # GET /detalle_recibo_retencions/new
  # GET /detalle_recibo_retencions/new.xml
  def new
    @detalle_recibo_retencion = @recibo_sueldo.detalle_recibo_retencion.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @detalle_recibo_retencion }
    end
  end

  # GET /detalle_recibo_retencions/1/edit
  def edit
    @detalle_recibo_retencion = @recibo_sueldo.detalle_recibo_retencions.find(params[:id])
  end

  # POST /detalle_recibo_retencions
  # POST /detalle_recibo_retencions.xml
  def create
    @detalle_recibo_retencion = @recibo_sueldo.detalle_recibo_retencion.build(params[:detalle_recibo_retencion])

    respond_to do |format|
      if @detalle_recibo_retencion.save
        format.html { redirect_to([@liquidacion,@recibo_sueldo,@detalle_recibo_retencion], :notice => 'Detalle recibo retencion was successfully created.') }
        format.xml  { render :xml => @detalle_recibo_retencion, :status => :created, :location => @detalle_recibo_retencion }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @detalle_recibo_retencion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /detalle_recibo_retencions/1
  # PUT /detalle_recibo_retencions/1.xml
  def update
    @detalle_recibo_retencion = @recibo_sueldo.detalle_recibo_retencions.find(params[:id])

    respond_to do |format|
      if @detalle_recibo_retencion.update_attributes(params[:detalle_recibo_retencion])
        format.html { redirect_to([@liquidacion,@recibo_sueldo,@detalle_recibo_retencion], :notice => 'Detalle recibo retencion was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @detalle_recibo_retencion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /detalle_recibo_retencions/1
  # DELETE /detalle_recibo_retencions/1.xml
  def destroy
    @detalle_recibo_retencion = @recibo_sueldo.detalle_recibo_retencions.find(params[:id])
    @detalle_recibo_retencion.destroy

    respond_to do |format|
      format.html { redirect_to(liquidacion_recibo_sueldo_detalle_recibo_retencions_url) }
      format.xml  { head :ok }
    end
  end


  protected
   def liquidacion
     raise "Debe Ingresar con Liquidacion!!!!!!!!!!!" if params[:liquidacion_id].blank?
     @liquidacion = Liquidacon.find(params[:liquidacion_id])
   end
   def find_recibo_sueldo
     raise "Debe ingresar un recibo_sueldo!!!!!!!!!!!" if params[:recibi_sueldo_id].blank?
     @recibo_sueldo = @liquidacion.recibo_sueldos.find(params[:recibo_sueldo_id])
   end
end
