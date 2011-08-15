class RetentionConceptsController < ApplicationController
  before_filter :find_retention_concept, :except => [:index, :new, :create]
  # GET /retention_concepts
  # GET /retention_concepts.xml
  def index
    @search = RetentionConcept.by_company(current_company.id).search(params[:search])
    @retention_concepts = @search.page(params[:page]).per(10)

    respond_to do |format|
      format.html # indexoo.html.erb
      format.xml  { render :xml => @retention_concepts }
    end
  end

  # GET /retention_concepts/1
  # GET /retention_concepts/1.xml
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @retention_concept }
    end
  end

  # GET /retention_concepts/new
  # GET /retention_concepts/new.xml
  def new
    @retention_concept = RetentionConcept.by_company(current_company.id).new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @retention_concept }
    end
  end

  # GET /retention_concepts/1/edit
  def edit
  end

  # POST /retention_concepts
  # POST /retention_concepts.xml
  def create
    @retention_concept = RetentionConcept.by_company(current_company.id).new(params[:retention_concept])

    respond_to do |format|
      if @retention_concept.save
        format.html { redirect_to(@retention_concept, :notice => 'Retention concept was successfully created.') }
        format.xml  { render :xml => @retention_concept, :status => :created, :location => @retention_concept }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @retention_concept.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /retention_concepts/1
  # PUT /retention_concepts/1.xml
  def update

    respond_to do |format|
      if @retention_concept.update_attributes(params[:retention_concept])
        format.html { redirect_to(@retention_concept, :notice => 'Retention concept was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @retention_concept.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /retention_concepts/1
  # DELETE /retention_concepts/1.xml
  def destroy
    @retention_concept.destroy

    respond_to do |format|
      format.html { redirect_to(retention_concepts_url) }
      format.xml  { head :ok }
    end
  end
  def find_retention_concept
      @retention_concept = RetentionConcept.by_company(current_company.id).find(params[:id])
  end

end
