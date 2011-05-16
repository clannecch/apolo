class IssuedsController < ApplicationController
  # GET /issueds
  # GET /issueds.xml
  def index
    @issueds = Issued.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @issueds }
    end
  end

  # GET /issueds/1
  # GET /issueds/1.xml
  def show
    @issued = Issued.find(params[:id])

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
    @issued = Issued.find(params[:id])
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
    @issued = Issued.find(params[:id])

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
    @issued = Issued.find(params[:id])
    @issued.destroy

    respond_to do |format|
      format.html { redirect_to(issueds_url) }
      format.xml  { head :ok }
    end
  end
end
