class WageRemunerativeConceptsController < ApplicationController
  # GET /wage_remunerative_concepts
  # GET /wage_remunerative_concepts.xml
  def index
    @wage_remunerative_concepts = WageRemunerativeConcept.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @wage_remunerative_concepts }
    end
  end

  # GET /wage_remunerative_concepts/1
  # GET /wage_remunerative_concepts/1.xml
  def show
    @wage_remunerative_concept = WageRemunerativeConcept.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @wage_remunerative_concept }
    end
  end

  # GET /wage_remunerative_concepts/new
  # GET /wage_remunerative_concepts/new.xml
  def new
    @wage_remunerative_concept = WageRemunerativeConcept.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @wage_remunerative_concept }
    end
  end

  # GET /wage_remunerative_concepts/1/edit
  def edit
    @wage_remunerative_concept = WageRemunerativeConcept.find(params[:id])
  end

  # POST /wage_remunerative_concepts
  # POST /wage_remunerative_concepts.xml
  def create
    @wage_remunerative_concept = WageRemunerativeConcept.new(params[:wage_remunerative_concept])

    respond_to do |format|
      if @wage_remunerative_concept.save
        format.html { redirect_to(@wage_remunerative_concept, :notice => 'Wage remunerative concept was successfully created.') }
        format.xml  { render :xml => @wage_remunerative_concept, :status => :created, :location => @wage_remunerative_concept }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @wage_remunerative_concept.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /wage_remunerative_concepts/1
  # PUT /wage_remunerative_concepts/1.xml
  def update
    @wage_remunerative_concept = WageRemunerativeConcept.find(params[:id])

    respond_to do |format|
      if @wage_remunerative_concept.update_attributes(params[:wage_remunerative_concept])
        format.html { redirect_to(@wage_remunerative_concept, :notice => 'Wage remunerative concept was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @wage_remunerative_concept.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /wage_remunerative_concepts/1
  # DELETE /wage_remunerative_concepts/1.xml
  def destroy
    @wage_remunerative_concept = WageRemunerativeConcept.find(params[:id])
    @wage_remunerative_concept.destroy

    respond_to do |format|
      format.html { redirect_to(wage_remunerative_concepts_url) }
      format.xml  { head :ok }
    end
  end
end
