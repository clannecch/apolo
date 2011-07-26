class EmployeeFamiliarsController < ApplicationController


  before filter :find_employee

  def index
    @employee_familiars = @employee.employee_familiar.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @employee_familiars }
    end
  end

  def show
    @employee_familiar = @employee.employee_familiar.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @employee_familiar }
    end
  end

  def new
    @employee_familiar = @employee.employee_familiar.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @employee_familiar }
    end
  end

  def edit
    @employee_familiar = @employee.employee_familiar.find(params[:id])
  end

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
