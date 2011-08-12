class DeduccionGananciasTablesController < ApplicationController
  # GET /deduccion_ganancias_tables
  # GET /deduccion_ganancias_tables.xml
  def index
    #@deduccion_ganancias_tables = DeduccionGananciasTable.all
    @search = DeduccionGananciasTable.search(params[:search])
    @deduccion_ganancias_tables = @search.page(params[:page])#.per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @deduccion_ganancias_tables }
    end
  end

  # GET /deduccion_ganancias_tables/1
  # GET /deduccion_ganancias_tables/1.xml
  def show
    @deduccion_ganancias_table = DeduccionGananciasTable.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @deduccion_ganancias_table }
    end
  end

  # GET /deduccion_ganancias_tables/new
  # GET /deduccion_ganancias_tables/new.xml
  def new
    @deduccion_ganancias_table = DeduccionGananciasTable.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @deduccion_ganancias_table }
    end
  end

  # GET /deduccion_ganancias_tables/1/edit
  def edit
    @deduccion_ganancias_table = DeduccionGananciasTable.find(params[:id])
  end

  # POST /deduccion_ganancias_tables
  # POST /deduccion_ganancias_tables.xml
  def create
    @deduccion_ganancias_table = DeduccionGananciasTable.new(params[:deduccion_ganancias_table])

    respond_to do |format|
      if @deduccion_ganancias_table.save
        format.html { redirect_to(@deduccion_ganancias_table, :notice => 'Deduccion ganancias table was successfully created.') }
        format.xml  { render :xml => @deduccion_ganancias_table, :status => :created, :location => @deduccion_ganancias_table }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @deduccion_ganancias_table.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /deduccion_ganancias_tables/1
  # PUT /deduccion_ganancias_tables/1.xml
  def update
    @deduccion_ganancias_table = DeduccionGananciasTable.find(params[:id])

    respond_to do |format|
      if @deduccion_ganancias_table.update_attributes(params[:deduccion_ganancias_table])
        format.html { redirect_to(@deduccion_ganancias_table, :notice => 'Deduccion ganancias table was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @deduccion_ganancias_table.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /deduccion_ganancias_tables/1
  # DELETE /deduccion_ganancias_tables/1.xml
  def destroy
    @deduccion_ganancias_table = DeduccionGananciasTable.find(params[:id])
    @deduccion_ganancias_table.destroy

    respond_to do |format|
      format.html { redirect_to(deduccion_ganancias_tables_url) }
      format.xml  { head :ok }
    end
  end
end
