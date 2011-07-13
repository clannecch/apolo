class GroupRetentionsController < ApplicationController

  before_filter :find_group_retention, :except => [:index, :new, :create]

  # GET /group_retentions
  # GET /group_retentions.xml
  def index
    @group_retentions = GroupRetention.by_company(current_company.id).all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @group_retentions }
    end
  end

  # GET /group_retentions/1
  # GET /group_retentions/1.xml
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @group_retention }
    end
  end

  # GET /group_retentions/new
  # GET /group_retentions/new.xml
  def new
    @group_retention = GroupRetention.by_company(current_company.id).new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @group_retention }
    end
  end

  # GET /group_retentions/1/edit
  def edit
  end

  # POST /group_retentions
  # POST /group_retentions.xml
  def create
    @group_retention = GroupRetention.by_company(current_company.id).new(params[:group_retention])

    respond_to do |format|
      if @group_retention.save
        format.html { redirect_to(@group_retention, :notice => 'Group retention was successfully created.') }
        format.xml  { render :xml => @group_retention, :status => :created, :location => @group_retention }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @group_retention.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /group_retentions/1
  # PUT /group_retentions/1.xml
  def update

    respond_to do |format|
      if @group_retention.update_attributes(params[:group_retention])
        format.html { redirect_to(@group_retention, :notice => 'Group retention was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @group_retention.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /group_retentions/1
  # DELETE /group_retentions/1.xml
  def destroy
    @group_retention.destroy

    respond_to do |format|
      format.html { redirect_to(group_retentions_url) }
      format.xml  { head :ok }
    end
  end
  def find_group_retention
      @group_retention = GroupRetention.by_company(current_company.id).find(params[:id])
  end
end
