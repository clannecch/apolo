class GroupRemunerationRelationsController < ApplicationController
  # GET /group_remuneration_relations
  # GET /group_remuneration_relations.xml
  def index
    @group_remuneration_relations = GroupRemunerationRelation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @group_remuneration_relations }
    end
  end

  # GET /group_remuneration_relations/1
  # GET /group_remuneration_relations/1.xml
  def show
    @group_remuneration_relation = GroupRemunerationRelation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @group_remuneration_relation }
    end
  end

  # GET /group_remuneration_relations/new
  # GET /group_remuneration_relations/new.xml
  def new
    @group_remuneration_relation = GroupRemunerationRelation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @group_remuneration_relation }
    end
  end

  # GET /group_remuneration_relations/1/edit
  def edit
    @group_remuneration_relation = GroupRemunerationRelation.find(params[:id])
  end

  # POST /group_remuneration_relations
  # POST /group_remuneration_relations.xml
  def create
    @group_remuneration_relation = GroupRemunerationRelation.new(params[:group_remuneration_relation])

    respond_to do |format|
      if @group_remuneration_relation.save
        format.html { redirect_to(@group_remuneration_relation, :notice => 'Group remuneration relation was successfully created.') }
        format.xml  { render :xml => @group_remuneration_relation, :status => :created, :location => @group_remuneration_relation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @group_remuneration_relation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /group_remuneration_relations/1
  # PUT /group_remuneration_relations/1.xml
  def update
    @group_remuneration_relation = GroupRemunerationRelation.find(params[:id])

    respond_to do |format|
      if @group_remuneration_relation.update_attributes(params[:group_remuneration_relation])
        format.html { redirect_to(@group_remuneration_relation, :notice => 'Group remuneration relation was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @group_remuneration_relation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /group_remuneration_relations/1
  # DELETE /group_remuneration_relations/1.xml
  def destroy
    @group_remuneration_relation = GroupRemunerationRelation.find(params[:id])
    @group_remuneration_relation.destroy

    respond_to do |format|
      format.html { redirect_to(group_remuneration_relations_url) }
      format.xml  { head :ok }
    end
  end
end
