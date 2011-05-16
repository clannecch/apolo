class EmployeeFamiliarsController < ApplicationController
  # GET /employee_familiars
  # GET /employee_familiars.xml
  def index
    @employee_familiars = EmployeeFamiliar.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @employee_familiars }
    end
  end

  # GET /employee_familiars/1
  # GET /employee_familiars/1.xml
  def show
    @employee_familiar = EmployeeFamiliar.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @employee_familiar }
    end
  end

  # GET /employee_familiars/new
  # GET /employee_familiars/new.xml
  def new
    @employee_familiar = EmployeeFamiliar.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @employee_familiar }
    end
  end

  # GET /employee_familiars/1/edit
  def edit
    @employee_familiar = EmployeeFamiliar.find(params[:id])
  end

  # POST /employee_familiars
  # POST /employee_familiars.xml
  def create
    @employee_familiar = EmployeeFamiliar.new(params[:employee_familiar])

    respond_to do |format|
      if @employee_familiar.save
        format.html { redirect_to(@employee_familiar, :notice => 'Employee familiar was successfully created.') }
        format.xml  { render :xml => @employee_familiar, :status => :created, :location => @employee_familiar }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @employee_familiar.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /employee_familiars/1
  # PUT /employee_familiars/1.xml
  def update
    @employee_familiar = EmployeeFamiliar.find(params[:id])

    respond_to do |format|
      if @employee_familiar.update_attributes(params[:employee_familiar])
        format.html { redirect_to(@employee_familiar, :notice => 'Employee familiar was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @employee_familiar.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_familiars/1
  # DELETE /employee_familiars/1.xml
  def destroy
    @employee_familiar = EmployeeFamiliar.find(params[:id])
    @employee_familiar.destroy

    respond_to do |format|
      format.html { redirect_to(employee_familiars_url) }
      format.xml  { head :ok }
    end
  end
end
