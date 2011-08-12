class GroupEmployerContributionsController < ApplicationController
  # GET /group_employer_contributions
  # GET /group_employer_contributions.xml
  def index
    #@group_employer_contributions = GroupEmployerContribution.all
    @search = GroupEmployerContribution.search(params[:search])
    @group_employer_contributions = @search.page(params[:page])#.per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @group_employer_contributions }
    end
  end

  # GET /group_employer_contributions/1
  # GET /group_employer_contributions/1.xml
  def show
    @group_employer_contribution = GroupEmployerContribution.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @group_employer_contribution }
    end
  end

  # GET /group_employer_contributions/new
  # GET /group_employer_contributions/new.xml
  def new
    @group_employer_contribution = GroupEmployerContribution.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @group_employer_contribution }
    end
  end

  # GET /group_employer_contributions/1/edit
  def edit
    @group_employer_contribution = GroupEmployerContribution.find(params[:id])
  end

  # POST /group_employer_contributions
  # POST /group_employer_contributions.xml
  def create
    @group_employer_contribution = GroupEmployerContribution.new(params[:group_employer_contribution])

    respond_to do |format|
      if @group_employer_contribution.save
        format.html { redirect_to(@group_employer_contribution, :notice => 'Group employer contribution was successfully created.') }
        format.xml  { render :xml => @group_employer_contribution, :status => :created, :location => @group_employer_contribution }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @group_employer_contribution.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /group_employer_contributions/1
  # PUT /group_employer_contributions/1.xml
  def update
    @group_employer_contribution = GroupEmployerContribution.find(params[:id])

    respond_to do |format|
      if @group_employer_contribution.update_attributes(params[:group_employer_contribution])
        format.html { redirect_to(@group_employer_contribution, :notice => 'Group employer contribution was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @group_employer_contribution.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /group_employer_contributions/1
  # DELETE /group_employer_contributions/1.xml
  def destroy
    @group_employer_contribution = GroupEmployerContribution.find(params[:id])
    @group_employer_contribution.destroy

    respond_to do |format|
      format.html { redirect_to(group_employer_contributions_url) }
      format.xml  { head :ok }
    end
  end
end
