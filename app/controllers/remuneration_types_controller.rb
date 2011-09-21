class RemunerationTypesController < ApplicationController

  before_filter :find_remuneration_type, :except => [:index, :new, :create]

  # GET /remuneration_types
  # GET /remuneration_types.xml
  def index
    @search = RemunerationType.by_company(current_company.id).search(params[:search])
    @remuneration_types = @search.page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erbb
      format.xml  { render :xml => @remuneration_types }
    end
  end

  # GET /remuneration_types/1
  # GET /remuneration_types/1.xml
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @remuneration_type }
    end
  end

  # GET /remuneration_types/new
  # GET /remuneration_types/new.xml
  def new
    @remuneration_type = RemunerationType.by_company(current_company.id).new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @remuneration_type }
    end
  end

  # GET /remuneration_types/1/edit
  def edit
  end

  # POST /remuneration_types
  # POST /remuneration_types.xml
  def create
    @remuneration_type = RemunerationType.by_company(current_company.id).new(params[:remuneration_type])

    respond_to do |format|
      if @remuneration_type.save
        format.html { redirect_to(@remuneration_type, :notice => 'Remuneration type was successfully created.') }
        format.xml  { render :xml => @remuneration_type, :status => :created, :location => @remuneration_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @remuneration_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /remuneration_types/1
  # PUT /remuneration_types/1.xml
  def update

    respond_to do |format|
      if @remuneration_type.update_attributes(params[:remuneration_type])
        format.html { redirect_to(@remuneration_type, :notice => 'Remuneration type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @remuneration_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /remuneration_types/1
  # DELETE /remuneration_types/1.xml
  def destroy
    begin
      @remuneration_type.destroy
      flash[:success] = "successfully destroyed."
    rescue ActiveRecord::DeleteRestrictionError => e
      @remuneration_type.errors.add(:base, e)
      flash[:error] = "#{e}"
    ensure
      redirect_to remuneration_type_url
    end
  end

  def find_remuneration_type
      @remuneration_type = RemunerationType.by_company(current_company.id).find(params[:id])
  end
end
