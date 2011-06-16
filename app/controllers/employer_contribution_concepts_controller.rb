class EmployerContributionConceptsController < ApplicationController
  # GET /employer_contribution_concepts
  # GET /employer_contribution_concepts.xml
  def index
    @employer_contribution_concepts = EmployerContributionConcept.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @employer_contribution_concepts }
    end
  end

  # GET /employer_contribution_concepts/1
  # GET /employer_contribution_concepts/1.xml
  def show
    @employer_contribution_concept = EmployerContributionConcept.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @employer_contribution_concept }
    end
  end

  # GET /employer_contribution_concepts/new
  # GET /employer_contribution_concepts/new.xml
  def new
    @employer_contribution_concept = EmployerContributionConcept.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @employer_contribution_concept }
    end
  end

  # GET /employer_contribution_concepts/1/edit
  def edit
    @employer_contribution_concept = EmployerContributionConcept.find(params[:id])
  end

  # POST /employer_contribution_concepts
  # POST /employer_contribution_concepts.xml
  def create
    @employer_contribution_concept = EmployerContributionConcept.new(params[:employer_contribution_concept])

    respond_to do |format|
      if @employer_contribution_concept.save
        format.html { redirect_to(@employer_contribution_concept, :notice => 'Employer contribution concept was successfully created.') }
        format.xml  { render :xml => @employer_contribution_concept, :status => :created, :location => @employer_contribution_concept }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @employer_contribution_concept.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /employer_contribution_concepts/1
  # PUT /employer_contribution_concepts/1.xml
  def update
    @employer_contribution_concept = EmployerContributionConcept.find(params[:id])

    respond_to do |format|
      if @employer_contribution_concept.update_attributes(params[:employer_contribution_concept])
        format.html { redirect_to(@employer_contribution_concept, :notice => 'Employer contribution concept was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @employer_contribution_concept.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /employer_contribution_concepts/1
  # DELETE /employer_contribution_concepts/1.xml
  def destroy
    @employer_contribution_concept = EmployerContributionConcept.find(params[:id])
    @employer_contribution_concept.destroy

    respond_to do |format|
      format.html { redirect_to(employer_contribution_concepts_url) }
      format.xml  { head :ok }
    end
  end
end