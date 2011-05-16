class GroupRenumberingsController < ApplicationController
  # GET /group_renumberings
  # GET /group_renumberings.xml
  def index
    @group_renumberings = GroupRenumbering.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @group_renumberings }
    end
  end

  # GET /group_renumberings/1
  # GET /group_renumberings/1.xml
  def show
    @group_renumbering = GroupRenumbering.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @group_renumbering }
    end
  end

  # GET /group_renumberings/new
  # GET /group_renumberings/new.xml
  def new
    @group_renumbering = GroupRenumbering.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @group_renumbering }
    end
  end

  # GET /group_renumberings/1/edit
  def edit
    @group_renumbering = GroupRenumbering.find(params[:id])
  end

  # POST /group_renumberings
  # POST /group_renumberings.xml
  def create
    @group_renumbering = GroupRenumbering.new(params[:group_renumbering])

    respond_to do |format|
      if @group_renumbering.save
        format.html { redirect_to(@group_renumbering, :notice => 'Group renumbering was successfully created.') }
        format.xml  { render :xml => @group_renumbering, :status => :created, :location => @group_renumbering }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @group_renumbering.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /group_renumberings/1
  # PUT /group_renumberings/1.xml
  def update
    @group_renumbering = GroupRenumbering.find(params[:id])

    respond_to do |format|
      if @group_renumbering.update_attributes(params[:group_renumbering])
        format.html { redirect_to(@group_renumbering, :notice => 'Group renumbering was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @group_renumbering.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /group_renumberings/1
  # DELETE /group_renumberings/1.xml
  def destroy
    @group_renumbering = GroupRenumbering.find(params[:id])
    @group_renumbering.destroy

    respond_to do |format|
      format.html { redirect_to(group_renumberings_url) }
      format.xml  { head :ok }
    end
  end
end
