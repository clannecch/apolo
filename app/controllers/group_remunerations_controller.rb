class GroupRemunerationsController < ApplicationController
  # GET /group_remunerations
  # GET /group_remunerations.xml
  def index
    #@group_remunerations = GroupRemuneration.all
    @search = GroupRemuneration.search(params[:search])
    @group_remunerations = @search.page(params[:page])#.per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @group_remunerations }
    end
  end

  # GET /group_remunerations/1
  # GET /group_remunerations/1.xml
  def show
    @group_remuneration = GroupRemuneration.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @group_remuneration }
    end
  end

  # GET /group_remunerations/new
  # GET /group_remunerations/new.xml
  def new
    @group_remuneration = GroupRemuneration.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @group_remuneration }
    end
  end

  # GET /group_remunerations/1/edit
  def edit
    @group_remuneration = GroupRemuneration.find(params[:id])
  end

  # POST /group_remunerations
  # POST /group_remunerations.xml
  def create
    @group_remuneration = GroupRemuneration.new(params[:group_remuneration])

    respond_to do |format|
      if @group_remuneration.save
        format.html { redirect_to(@group_remuneration, :notice => 'Group remuneration was successfully created.') }
        format.xml  { render :xml => @group_remuneration, :status => :created, :location => @group_remuneration }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @group_remuneration.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /group_remunerations/1
  # PUT /group_remunerations/1.xml
  def update
    @group_remuneration = GroupRemuneration.find(params[:id])

    respond_to do |format|
      if @group_remuneration.update_attributes(params[:group_remuneration])
        format.html { redirect_to(@group_remuneration, :notice => 'Group remuneration was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @group_remuneration.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /group_remunerations/1
  # DELETE /group_remunerations/1.xml
  def destroy
    @group_remuneration = GroupRemuneration.find(params[:id])
    @group_remuneration.destroy

    respond_to do |format|
      format.html { redirect_to(group_remunerations_url) }
      format.xml  { head :ok }
    end
  end
end
