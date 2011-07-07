class EmployeeRetentionConceptsController < ApplicationController
  before filter :find_employee

  # GET /employee_retention_concepts
  # GET /employee_retention_concepts.xml
  def index
    @employee_retention_concepts = @employee.employee_retention_concept.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @employee_retention_concepts }
    end
  end

  # GET /employee_retention_concepts/1
  # GET /employee_retention_concepts/1.xml
  def show
    @employee_retention_concept = @employee.employee_retention_concept.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @employee_retention_concept }
    end
  end

  # GET /employee_retention_concepts/new
  # GET /employee_retention_concepts/new.xml
  def new
    @employee_retention_concept = @employee.employee_retention_concept.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @employee_retention_concept }
    end
  end

  # GET /employee_retention_concepts/1/edit
  def edit
    @employee_retention_concept = @employee.employee_retention_concept.find(params[:id])
  end

  # POST /employee_retention_concepts
  # POST /employee_retention_concepts.xml
  def create
    @employee_retention_concept = @employee.employee_retention_concept.build(params[@employee, :employee_retention_concept])

    respond_to do |format|
      if @employee_retention_concept.save
        format.html { redirect_to([@employee, @employee_retention_concept], :notice => 'Employee retention concept was successfully created.') }
        format.xml  { render :xml => @employee_retention_concept, :status => :created, :location => @employee_retention_concept }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @employee_retention_concept.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /employee_retention_concepts/1
  # PUT /employee_retention_concepts/1.xml
  def update
    @employee_retention_concept = @employee.employee_retention_concept.find(params[:id])

    respond_to do |format|
      if @employee_retention_concept.update_attributes(params[:employee_retention_concept])
        format.html { redirect_to([@emploee, @employee_retention_concept], :notice => 'Employee retention concept was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @employee_retention_concept.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_retention_concepts/1
  # DELETE /employee_retention_concepts/1.xml
  def destroy
    @employee_retention_concept = @employee.employee_retention_concept.find(params[:id])
    @employee_retention_concept.destroy

    respond_to do |format|
      format.html { redirect_to(employee_retention_concepts_url) }
      format.xml  { head :ok }
    end
  end

  protected
  def find_employee
    raise "Debe Ingresar con un empleado!!!!!!!!!!!" if params[:employee_id].blank?
    @employee = Employee.find(params[:employee_id])
  end


end
