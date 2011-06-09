class TipoRecibosController < ApplicationController
  # GET /tipo_recibos
  # GET /tipo_recibos.xml
  def index
    @tipo_recibos = TipoRecibo.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tipo_recibos }
    end
  end

  # GET /tipo_recibos/1
  # GET /tipo_recibos/1.xml
  def show
    @tipo_recibo = TipoRecibo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tipo_recibo }
    end
  end

  # GET /tipo_recibos/new
  # GET /tipo_recibos/new.xml
  def new
    @tipo_recibo = TipoRecibo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tipo_recibo }
    end
  end

  # GET /tipo_recibos/1/edit
  def edit
    @tipo_recibo = TipoRecibo.find(params[:id])
  end

  # POST /tipo_recibos
  # POST /tipo_recibos.xml
  def create
    @tipo_recibo = TipoRecibo.new(params[:tipo_recibo])

    respond_to do |format|
      if @tipo_recibo.save
        format.html { redirect_to(@tipo_recibo, :notice => 'Tipo recibo was successfully created.') }
        format.xml  { render :xml => @tipo_recibo, :status => :created, :location => @tipo_recibo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tipo_recibo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tipo_recibos/1
  # PUT /tipo_recibos/1.xml
  def update
    @tipo_recibo = TipoRecibo.find(params[:id])

    respond_to do |format|
      if @tipo_recibo.update_attributes(params[:tipo_recibo])
        format.html { redirect_to(@tipo_recibo, :notice => 'Tipo recibo was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tipo_recibo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_recibos/1
  # DELETE /tipo_recibos/1.xml
  def destroy
    @tipo_recibo = TipoRecibo.find(params[:id])
    @tipo_recibo.destroy

    respond_to do |format|
      format.html { redirect_to(tipo_recibos_url) }
      format.xml  { head :ok }
    end
  end
end
