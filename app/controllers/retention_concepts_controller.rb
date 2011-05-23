class RetentionConceptsController < ApplicationController
  # GET /retention_concepts
  # GET /retention_concepts.xml
  def index
    @retention_concepts = RetentionConcept.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @retention_concepts }
    end
  end

  # GET /retention_concepts/1
  # GET /retention_concepts/1.xml
  def show
    @retention_concept = RetentionConcept.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @retention_concept }
    end
  end

  # GET /retention_concepts/new
  # GET /retention_concepts/new.xml
  def new
    @retention_concept = RetentionConcept.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @retention_concept }
    end
  end

  # GET /retention_concepts/1/edit
  def edit
    @retention_concept = RetentionConcept.find(params[:id])
  end

  # POST /retention_concepts
  # POST /retention_concepts.xml
  def create
    @retention_concept = RetentionConcept.new(params[:retention_concept])

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
    @retention_concept = RetentionConcept.find(params[:id])

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
    @retention_concept = RetentionConcept.find(params[:id])
    @retention_concept.destroy

    respond_to do |format|
      format.html { redirect_to(retention_concepts_url) }
      format.xml  { head :ok }
    end
  end
end
