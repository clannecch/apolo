class DocumentTypesController < ApplicationController

  before_filter :find_document_type, :except => [:index, :new, :create]
  # GET /document_types
  # GET /document_types.xml
  def index
    @search = DocumentType.search(params[:search])
    @document_types = @search.page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erbb
      format.xml  { render :xml => @document_types }
    end
  end

  # GET /document_types/1
  # GET /document_types/1.xml
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @document_type }
    end
  end

  # GET /document_types/new
  # GET /document_types/new.xml
  def new
    @document_type = DocumentType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @document_type }
    end
  end

  # GET /document_types/1/edit
  def edit
  end

  # POST /document_types
  # POST /document_types.xml
  def create
    @document_type = DocumentType.new(params[:document_type])

    respond_to do |format|
      if @document_type.save
        format.html { redirect_to(@document_type, :notice => 'Document type was successfully created.') }
        format.xml  { render :xml => @document_type, :status => :created, :location => @document_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @document_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /document_types/1
  # PUT /document_types/1.xml
  def update

    respond_to do |format|
      if @document_type.update_attributes(params[:document_type])
        format.html { redirect_to(@document_type, :notice => 'Document type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @document_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /document_types/1
  # DELETE /document_types/1.xml

  def destroy
    begin
      @document_type.destroy
      flash[:success] = "successfully destroyed."
    rescue ActiveRecord::DeleteRestrictionError => e
      @document_type.errors.add(:base, e)
      flash[:error] = "#{e}"
      redirect_to document_type_url
    else
      redirect_to document_types_url
    end
  end

  def find_document_type
      @document_type = DocumentType.find(params[:id])
  end
end
