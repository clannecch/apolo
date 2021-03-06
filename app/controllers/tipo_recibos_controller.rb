class TipoRecibosController < ApplicationController
  before_filter :find_tipo_recibo , :except => [:index, :new, :create]

  # GET /tipo_recibos
  # GET /tipo_recibos.xml
  def index
    @search = TipoRecibo.search(params[:search])
    @tipo_recibos = @search.page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erbb
      format.xml  { render :xml => @tipo_recibos }
    end
  end

  # GET /tipo_recibos/1
  # GET /tipo_recibos/1.xml
  def show

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
    begin
      @tipo_recibo.destroy
      flash[:success] = "successfully destroyed."
    rescue ActiveRecord::DeleteRestrictionError => e
      @tipo_recibo.errors.add(:base, e)
      flash[:error] = "#{e}"
      redirect_to tipo_recibo_url
    else
      redirect_to tipo_recibos_url
    end
  end

  def find_tipo_recibo
      @tipo_recibo = TipoRecibo.find(params[:id])
  end
end
