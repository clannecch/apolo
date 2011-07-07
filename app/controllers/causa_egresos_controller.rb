class CausaEgresosController < ApplicationController
  # GET /causa_egresos
  # GET /causa_egresos.xml
  def index
    @causa_egresos = CausaEgreso.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @causa_egresos }
    end
  end

  # GET /causa_egresos/1
  # GET /causa_egresos/1.xml
  def show
    @causa_egreso = CausaEgreso.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @causa_egreso }
    end
  end

  # GET /causa_egresos/new
  # GET /causa_egresos/new.xml
  def new
    @causa_egreso = CausaEgreso.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @causa_egreso }
    end
  end

  # GET /causa_egresos/1/edit
  def edit
    @causa_egreso = CausaEgreso.find(params[:id])
  end

  # POST /causa_egresos
  # POST /causa_egresos.xml
  def create
    @causa_egreso = CausaEgreso.new(params[:causa_egreso])

    respond_to do |format|
      if @causa_egreso.save
        format.html { redirect_to(@causa_egreso, :notice => 'Causa egreso was successfully created.') }
        format.xml  { render :xml => @causa_egreso, :status => :created, :location => @causa_egreso }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @causa_egreso.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /causa_egresos/1
  # PUT /causa_egresos/1.xml
  def update
    @causa_egreso = CausaEgreso.find(params[:id])

    respond_to do |format|
      if @causa_egreso.update_attributes(params[:causa_egreso])
        format.html { redirect_to(@causa_egreso, :notice => 'Causa egreso was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @causa_egreso.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /causa_egresos/1
  # DELETE /causa_egresos/1.xml
  def destroy
    @causa_egreso = CausaEgreso.find(params[:id])
    @causa_egreso.destroy

    respond_to do |format|
      format.html { redirect_to(causa_egresos_url) }
      format.xml  { head :ok }
    end
  end
end
