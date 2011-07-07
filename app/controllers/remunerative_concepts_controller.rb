class RemunerativeConceptsController < ApplicationController
  # GET /remunerative_concepts
  # GET /remunerative_concepts.xml
  def index
    # la docu general de todo esto esta en http://metautonomo.us/projects/metasearch/
    @search = RemunerativeConcept.search(params[:search])
    @remunerative_concepts = @search.page(params[:page])#.per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @remunerative_concepts }
    end
  end

  # GET /remunerative_concepts/1
  # GET /remunerative_concepts/1.xml
  def show
    @remunerative_concept = RemunerativeConcept.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @remunerative_concept }
    end
  end

  # GET /remunerative_concepts/new
  # GET /remunerative_concepts/new.xml
  def new
    @remunerative_concept = RemunerativeConcept.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @remunerative_concept }
    end
  end

  # GET /remunerative_concepts/1/edit
  def edit
    @remunerative_concept = RemunerativeConcept.find(params[:id])
  end

  # POST /remunerative_concepts
  # POST /remunerative_concepts.xml
  def create
    @remunerative_concept = RemunerativeConcept.new(params[:remunerative_concept])

    respond_to do |format|
      if @remunerative_concept.save
        format.html { redirect_to(@remunerative_concept, :notice => 'Remunerative concept was successfully created.') }
        format.xml  { render :xml => @remunerative_concept, :status => :created, :location => @remunerative_concept }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @remunerative_concept.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /remunerative_concepts/1
  # PUT /remunerative_concepts/1.xml
  def update
    @remunerative_concept = RemunerativeConcept.find(params[:id])

    respond_to do |format|
      if @remunerative_concept.update_attributes(params[:remunerative_concept])
        format.html { redirect_to(@remunerative_concept, :notice => 'Remunerative concept was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @remunerative_concept.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /remunerative_concepts/1
  # DELETE /remunerative_concepts/1.xml
  def destroy
    @remunerative_concept = RemunerativeConcept.find(params[:id])
    @remunerative_concept.destroy

    respond_to do |format|
      format.html { redirect_to(remunerative_concepts_url) }
      format.xml  { head :ok }
    end
  end
end
