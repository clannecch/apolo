class RemunerationTypesController < ApplicationController
  # GET /remuneration_types
  # GET /remuneration_types.xml
  def index
    @remuneration_types = RemunerationType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @remuneration_types }
    end
  end

  # GET /remuneration_types/1
  # GET /remuneration_types/1.xml
  def show
    @remuneration_type = RemunerationType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @remuneration_type }
    end
  end

  # GET /remuneration_types/new
  # GET /remuneration_types/new.xml
  def new
    @remuneration_type = RemunerationType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @remuneration_type }
    end
  end

  # GET /remuneration_types/1/edit
  def edit
    @remuneration_type = RemunerationType.find(params[:id])
  end

  # POST /remuneration_types
  # POST /remuneration_types.xml
  def create
    @remuneration_type = RemunerationType.new(params[:remuneration_type])

    respond_to do |format|
      if @remuneration_type.save
        format.html { redirect_to(@remuneration_type, :notice => 'Remuneration type was successfully created.') }
        format.xml  { render :xml => @remuneration_type, :status => :created, :location => @remuneration_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @remuneration_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /remuneration_types/1
  # PUT /remuneration_types/1.xml
  def update
    @remuneration_type = RemunerationType.find(params[:id])

    respond_to do |format|
      if @remuneration_type.update_attributes(params[:remuneration_type])
        format.html { redirect_to(@remuneration_type, :notice => 'Remuneration type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @remuneration_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /remuneration_types/1
  # DELETE /remuneration_types/1.xml
  def destroy
    @remuneration_type = RemunerationType.find(params[:id])
    @remuneration_type.destroy

    respond_to do |format|
      format.html { redirect_to(remuneration_types_url) }
      format.xml  { head :ok }
    end
  end
end
