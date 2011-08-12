class EmployeeDocumentsController < ApplicationController
  before_filter :find_employee

  downloads_files_for :employee_document, :document


  def index
    @employee_documents = @employee.employee_document.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @employee_documents }
    end
  end

  def show
    @employee_document = @employee.employee_document.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @employee_document }
    end
  end

  def new
    @employee_document = @employee.employee_document.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @employee_document }
    end
  end

  def edit
    @employee_document = @employee.employee_document.find(params[:id])
  end

  def create
    @employee_document = @employee.employee_document.build(params[@employee, :employee_document])

    respond_to do |format|
      if @employee_document.save
        format.html { redirect_to([@employee, @employee_document], :notice => 'Employee document was successfully created.') }
        format.xml  { render :xml => @employee_document, :status => :created, :location => @employee_document }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @employee_document.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @employee_document = @employee.employee_document.find(params[:id])

    respond_to do |format|
      if @employee_document.update_attributes(params[:employee_document])
        format.html { redirect_to(@employee_document, :notice => 'Employee document was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @employee_document.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @employee_document = @employee.employee_document.find(params[:id])
    @employee_document.destroy

    respond_to do |format|
      format.html { redirect_to(employee_documents_url) }
      format.xml  { head :ok }
    end
  end

  protected
  def find_employee
    raise "Debe Ingresar con un empleado!!!!!!!!!!!" if params[:employee_id].blank?
    @employee = Employee.find(params[:employee_id])
  end

end
