class ReciboSueldosController < ApplicationController
  before_filter :find_liquidacion

  # GET /recibo_sueldos
  # GET /recibo_sueldos.xml
  def index
    @recibo_sueldos = @liquidacion.recibo_sueldos.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @recibo_sueldos }
    end
  end

  # GET /recibo_sueldos/1
  # GET /recibo_sueldos/1.xml
  def show
    @recibo_sueldo =  @liquidacion.recibo_sueldos.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @recibo_sueldo }
    end
  end

  # GET /recibo_sueldos/new
  # GET /recibo_sueldos/new.xml
  def new
    @recibo_sueldo =  @liquidacion.recibo_sueldos.build
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @recibo_sueldo }
    end
  end

  # GET /recibo_sueldos/1/edit
  def edit
    @recibo_sueldo =  @liquidacion.recibo_sueldos.find(params[:id])
  end

  # POST /recibo_sueldos
  # POST /recibo_sueldos.xml
  def create
    @recibo_sueldo =  @liquidacion.recibo_sueldos.build(params[:recibo_sueldo])

    respond_to do |format|
      if @recibo_sueldo.save
        format.html { redirect_to([@liquidacion, @recibo_sueldo], :notice => 'Recibo sueldo was successfully created.') }
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
    @recibo_sueldo = @liquidacion.recibo_sueldos.find(params[:id])

    respond_to do |format|
      if @recibo_sueldo.update_attributes(params[:recibo_sueldo])
        format.html { redirect_to([@liquidacion, @recibo_sueldo], :notice => 'Recibo sueldo was successfully updated.') }
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
    @recibo_sueldo = @liquidacion.recibo_sueldos.find(params[:id])
    @recibo_sueldo.destroy

    respond_to do |format|
      format.html { redirect_to(liquidacion_recibo_sueldos_url(@liquidacion)) }
      format.xml  { head :ok }
    end
  end


  def calculo_recibo
#    se carga con los datos de un recibo
    @recibo_sueldo = @liquidacion.recibo_sueldos.find(params[:id])
# llama al metodo calcular recibo que esta en el modelo
    @recibo_sueldo.calcular_recibo
# Muestra un mensaje en el caso que este todo ok (@recibo_sueldo.errors.empty?)
    flash.now[:notice] = "calculado correctamente" if @recibo_sueldo.errors.empty?

# Se llama a el formulario con el mismo nombre del metodo para que muestre un resultado
    respond_to do |format|
      format.html # calculo_recibo.html.erb
    end
  end

  protected

  def find_liquidacion
    raise "Debe ingresar una liquidacion!!!!!!!!!!!" if params[:liquidacion_id].blank?
    @liquidacion = Liquidacion.find(params[:liquidacion_id])
  end

end
