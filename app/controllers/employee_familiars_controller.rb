class EmployeeFamiliarsController < ApplicationController
  before filter :find_employee

  # GET /employee_familiars
  # GET /employee_familiars.xml
  def index
    @employee_familiars = @employee.employee_familiar.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @employee_familiars }
    end
  end

  # GET /employee_familiars/1
  # GET /employee_familiars/1.xml
  def show
    @employee_familiar = @employee.employee_familiar.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @employee_familiar }
    end
  end

  # GET /employee_familiars/new
  # GET /employee_familiars/new.xml
  def new
    @employee_familiar = @employee.employee_familiar.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @employee_familiar }
    end
  end

  # GET /employee_familiars/1/edit
  def edit
    @employee_familiar = @employee.employee_familiar.find(params[:id])
  end

  # POST /employee_familiars
  # POST /employee_familiars.xml
  def create
    @employee_familiar = @employee.employee_familiar.build(params[@employee, :employee_familiar])

    respond_to do |format|
      if @employee_familiar.save
        format.html { redirect_to([@employee, @employee_familiar], :notice => 'Employee familiar was successfully created.') }
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
    @employee_familiar = @employee.employee_familiar.find(params[:id])

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
    @employee_familiar = @employee.employee_familiar.find(params[:id])
    @employee_familiar.destroy

    respond_to do |format|
      format.html { redirect_to(employee_familiars_url) }
      format.xml  { head :ok }
    end
  end

  protected
  def find_employee
    raise "Debe Ingresar con un empleado!!!!!!!!!!!" if params[:employee_id].blank?
    @employee = Employee.find(params[:employee_id])
  end

end
