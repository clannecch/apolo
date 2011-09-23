class AssociatedDocumentTypesController < ApplicationController
  before_filter :find_associated_document_type, :except => [:index, :new, :create]

  respond_to :html, :xml, :json

  # GET /associated_document_types
  # GET /associated_document_types.json
  # GET /associated_document_types.xml
  def index
    @associated_document_types = AssociatedDocumentType.by_company(current_company.id).all

    respond_to do |format|
      format.html # index.html.erbb
      format.xml  { render :xml => @associated_document_types }
    end
  end

  # GET /associated_document_types/1
  # GET /associated_document_types/1.json
  # GET /associated_document_types/1.xml
  def show
    respond_to do |format|
     format.html # show.html.erb
     format.xml  { render :xml => @associated_document_type }
    end
  end

  # GET /associated_document_types/new
  # GET /associated_document_types/new.xml
  def new
    @associated_document_type = AssociatedDocumentType.by_company(current_company.id).new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @associated_document_type }
    end
  end

  # GET /associated_document_types/1/edit
  # GET /associated_document_types/1/edit.json
  # GET /associated_document_types/1/edit.xml
  def edit
  end

  # POST /associated_document_types
  # POST /associated_document_types.json
  # POST /associated_document_types.xml
  def create
    @associated_document_type = AssociatedDocumentType.by_company(current_company.id).new(params[:associated_document_type])

    respond_to do |format|
      if @associated_document_type.save
        format.html { redirect_to(@associated_document_type, :notice => 'associated_document_type was successfully created.') }
        format.xml  { render :xml => @associated_document_type, :status => :created, :location => @associated_document_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @associated_document_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /associated_document_types/1
  # PUT /associated_document_types/1.json
  # PUT /associated_document_types/1.xml
  def update
    respond_to do |format|
      if @associated_document_type.update_attributes(params[:associated_document_type])
        format.html { redirect_to(@associated_document_type, :notice => 'associated_document_type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @associated_document_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /associated_document_types/1
  # DELETE /associated_document_types/1.json
  # DELETE /associated_document_types/1.xml
  def destroy
    begin
      @associated_document_type.destroy
      flash[:success] = "successfully destroyed."
    rescue ActiveRecord::DeleteRestrictionError => e
      @associated_document_type.errors.add(:base, e)
      flash[:error] = "#{e}"
      redirect_to associated_document_type_url
    else
      redirect_to associated_document_types_url
    end
  end

  protected

  def find_associated_document_type
    @associated_document_type = AssociatedDocumentType.by_company(current_company.id).find(params[:id])
  end
end

