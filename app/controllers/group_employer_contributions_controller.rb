class GroupEmployerContributionsController < ApplicationController

  before_filter :find_group_employer_contribution, :except => [:index, :new, :create]

  # GET /group_employer_contributions
  # GET /group_employer_contributions.xml
  def index
    #@group_employer_contributions = GroupEmployerContribution.all
    @search = GroupEmployerContribution.by_company(current_company.id).search(params[:search])
    @group_employer_contributions = @search.page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erbb
      format.xml  { render :xml => @group_employer_contributions }
    end
  end

  # GET /group_employer_contributions/1
  # GET /group_employer_contributions/1.xml
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @group_employer_contribution }
    end
  end

  # GET /group_employer_contributions/new
  # GET /group_employer_contributions/new.xml
  def new
    @group_employer_contribution = GroupEmployerContribution.by_company(current_company.id).new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @group_employer_contribution }
    end
  end

  # GET /group_employer_contributions/1/edit
  def edit
  end

  # POST /group_employer_contributions
  # POST /group_employer_contributions.xml
  def create
    @group_employer_contribution = GroupEmployerContribution.by_company(current_company.id).new(params[:group_employer_contribution])

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
    begin
      @group_employer_contribution.destroy
      flash[:success] = "successfully destroyed."
    rescue ActiveRecord::DeleteRestrictionError => e
      @group_employer_contribution.errors.add(:base, e)
      flash[:error] = "#{e}"
    ensure
      redirect_to group_employer_contribution_url
    end
  end

  def find_group_employer_contribution
      @group_employer_contribution = GroupEmployerContribution.by_company(current_company.id).find(params[:id])
  end
end
