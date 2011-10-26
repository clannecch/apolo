class ConsortiaController < ApplicationController
  before_filter :find_consortium, :except => [:index, :new, :create]

  def index
    @search = Consortium.by_company(current_company.id).search(params[:search])
    @consortia = @search.page(params[:page]).per(10)

    respond_to do |format|
      format.html # indexoo.html.erb
      format.xml  { render :xml => @consortia }
    end
  end

  # GET /consortia/1
  # GET /consortia/1.json
  # GET /consortia/1.xml
  def show
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @consortia }
    end
  end

  # GET /consortia/new
  # GET /consortia/new.json
  # GET /consortia/new.xml
  def new
    @consortium = Consortium.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @consortium }
    end
  end

  # GET /consortia/1/edit
  # GET /consortia/1/edit.json
  # GET /consortia/1/edit.xml
  def edit
  end

  # POST /consortia
  # POST /consortia.json
  # POST /consortia.xml
  def create
    @consortium = Consortium.new(params[:consortium])
    @consortium.company_id = current_company.id

    respond_to do |format|
      if @consortium.save
        format.html { redirect_to(@consortium, :notice => 'Consortium was successfully created.') }
        format.xml  { render :xml => @consortium, :status => :created, :location => @consortium }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @consortium.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /consortia/1
  # PUT /consortia/1.json
  # PUT /consortia/1.xml
  def update
    respond_to do |format|
      if @consortium.update_attributes(params[:consortium])
        format.html { redirect_to(@consortium, :notice => 'Consortium was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @consortium.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /consortia/1
  # DELETE /consortia/1.json
  # DELETE /consortia/1.xml
  def destroy
    begin
      @consortium.destroy
      flash[:success] = "successfully destroyed."
    rescue ActiveRecord::DeleteRestrictionError => e
      @consortium.errors.add(:base, e)
      flash[:error] = "#{e}"
      redirect_to consortiun_url
    else
      redirect_to consortia_url
    end
  end

  protected

  def find_consortium
    @consortium = Consortium.by_company(current_company.id).find(params[:id])
  end
end

