class EmployeesController < ApplicationController
  before_filter :find_employee, :except => [:index, :new, :create]
  # GET /employees
  # GET /employees.xml
  def index
<<<<<<< HEAD
    #@employees = Employee.all
    @search = Employee.search(params[:search])
    @employees = @search.page(params[:page])#.per(10)
=======
    @employees = Employee.by_company(current_company.id).all
>>>>>>> 3988e2ee3a3cd5f1cf2fd6a95cf99d990b11218b

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @employees }
    end
  end

  # GET /employees/1
  # GET /employees/1.xml
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @employee }
    end
  end

  # GET /employees/new
  # GET /employees/new.xml
  def new
    @employee = Employee.by_company(current_company.id).new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @employee }
    end
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.xml
  def create
    @employee = Employee.by_company(current_company.id).new(params[:employee])

    respond_to do |format|
      if @employee.save
        format.html { redirect_to(@employee, :notice => 'Employee was successfully created.') }
        format.xml  { render :xml => @employee, :status => :created, :location => @employee }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @employee.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /employees/1
  # PUT /employees/1.xml
  def update
    #raise params[:employee].inspect

    respond_to do |format|
      if @employee.update_attributes(params[:employee])
        format.html { redirect_to(@employee, :notice => 'Employee was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @employee.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.xml
  def destroy
    @employee.destroy

    respond_to do |format|
      format.html { redirect_to(employees_url) }
      format.xml  { head :ok }
    end
  end
  def find_employee
      @employee = Employee.by_company(current_company.id).find(params[:id])
  end
end
