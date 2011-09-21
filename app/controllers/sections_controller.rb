class SectionsController < ApplicationController
  before_filter :find_section, :except => [:index, :new, :create]
  # GET /sections
  # GET /sections.xml
  def index
    @search = Section.by_company(current_company.id).search(params[:search])
    @sections = @search.page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erbb
      format.xml  { render :xml => @sections }
    end
  end

  # GET /sections/1
  # GET /sections/1.xml
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @section }
    end
  end

  # GET /sections/new
  # GET /sections/new.xml
  def new
    @section = Section.by_company(current_company.id).new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @section }
    end
  end

  # GET /sections/1/edit
  def edit
  end

  # POST /sections
  # POST /sections.xml
  def create
    @section = Section.by_company(current_company.id).new(params[:section])

    respond_to do |format|
      if @section.save
        format.html { redirect_to(@section, :notice => 'Section was successfully created.') }
        format.xml  { render :xml => @section, :status => :created, :location => @section }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @section.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sections/1
  # PUT /sections/1.xml
  def update

    respond_to do |format|
      if @section.update_attributes(params[:section])
        format.html { redirect_to(@section, :notice => 'Section was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @section.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sections/1
  # DELETE /sections/1.xml
  def destroy
    begin
      @section.destroy
      flash[:success] = "successfully destroyed."
    rescue ActiveRecord::DeleteRestrictionError => e
      @section.errors.add(:base, e)
      flash[:error] = "#{e}"
    ensure
      redirect_to section_url
    end
  end

  def find_section
      @section = Section.by_company(current_company.id).find(params[:id])
  end
end
