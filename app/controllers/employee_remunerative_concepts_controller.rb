class EmployeeRemunerativeConceptsController < ApplicationController
  before_filter :find_employee

  # GET /employee_remunerative_concepts
  # GET /employee_remunerative_concepts.xml
  def index
    @employee_remunerative_concepts = @employee.employee_remunerative_concept.all

    respond_to do |format|
      format.html # indexoo.html.erb
      format.xml  { render :xml => @employee_remunerative_concepts }
    end
  end

  # GET /employee_remunerative_concepts/1
  # GET /employee_remunerative_concepts/1.xml
  def show
    @employee_remunerative_concept = @employee.employee_remunerative_concept.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @employee_remunerative_concept }
    end
  end

  # GET /employee_remunerative_concepts/new
  # GET /employee_remunerative_concepts/new.xml
  def new
    @employee_remunerative_concept = @employee.employee_remunerative_concept.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @employee_remunerative_concept }
    end
  end

  # GET /employee_remunerative_concepts/1/edit
  def edit
    @employee_remunerative_concept = @employee.employee_remunerative_concept.find(params[:id])
  end

  # POST /employee_remunerative_concepts
  # POST /employee_remunerative_concepts.xml
  def create
    @employee_remunerative_concept = @employee.employee_remunerative_concept.build(params[@employee,:employee_remunerative_concept])

    respond_to do |format|
      if @employee_remunerative_concept.save
        format.html { redirect_to([@employee, @employee_remunerative_concept], :notice => 'Employee remunerative concept was successfully created.') }
        format.xml  { render :xml => @employee_remunerative_concept, :status => :created, :location => @employee_remunerative_concept }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @employee_remunerative_concept.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /employee_remunerative_concepts/1
  # PUT /employee_remunerative_concepts/1.xml
  def update
    @employee_remunerative_concept = @employee.employee_emunerative_concept.find(params[:id])

    respond_to do |format|
      if @employee_remunerative_concept.update_attributes(params[:employee_remunerative_concept])
        format.html { redirect_to([@employee,@employee_remunerative_concept], :notice => 'Employee remunerative concept was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @employee_remunerative_concept.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_remunerative_concepts/1
  # DELETE /employee_remunerative_concepts/1.xml
  def destroy
    @employee_remunerative_concept = @employee.employee_remunerative_concept.find(params[:id])
    @employee_remunerative_concept.destroy

    respond_to do |format|
      format.html { redirect_to(employee_remunerative_concepts_url) }
      format.xml  { head :ok }
    end
  end

  protected
  def find_employee
    raise "Debe Ingresar con un empleado!!!!!!!!!!!" if params[:employee_id].blank?
    @employee = Employee.find(params[:employee_id])
  end

end
