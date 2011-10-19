class IssuedsController < ApplicationController

  before_filter :find_issued, :except => [:index, :new, :create]

  # GET /issueds
  # GET /issueds.xml
  def index
    @search = Issued.search(params[:search])
    @issueds = @search.page(params[:page]).per(10)

    respond_to do |format|
      format.html # indexoo.html.erb
      format.xml  { render :xml => @issueds }
    end
  end

  # GET /issueds/1
  # GET /issueds/1.xml
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @issued }
    end
  end

  # GET /issueds/new
  # GET /issueds/new.xml
  def new
    @issued = Issued.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @issued }
    end
  end

  # GET /issueds/1/edit
  def edit
  end

  # POST /issueds
  # POST /issueds.xml
  def create
    @issued = Issued.new(params[:issued])

    respond_to do |format|
      if @issued.save
        format.html { redirect_to(@issued, :notice => 'Issued was successfully created.') }
        format.xml  { render :xml => @issued, :status => :created, :location => @issued }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @issued.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /issueds/1
  # PUT /issueds/1.xml
  def update

    respond_to do |format|
      if @issued.update_attributes(params[:issued])
        format.html { redirect_to(@issued, :notice => 'Issued was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @issued.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /issueds/1
  # DELETE /issueds/1.xml
  def destroy
    begin
      @issued.destroy
      flash[:success] = "successfully destroyed."
    rescue ActiveRecord::DeleteRestrictionError => e
      @issued.errors.add(:base, e)
      flash[:error] = "#{e}"
      redirect_to issued_url
    else
      redirect_to issueds_url
    end
  end

  def find_issued
      @issued = Issued.find(params[:id])
  end
end
