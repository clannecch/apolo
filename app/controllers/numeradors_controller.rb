
class NumeradorsController < ApplicationController

  before_filter :find_numerador, :except => [:index, :new, :create]

  respond_to :html, :xml, :json

  # GET /numeradors
  # GET /numeradors.json
  # GET /numeradors.xml
  def index
    @search = Numerador.by_company(current_company.id).search(params[:search])
    @numeradors = @search.page(params[:page])#.per(10)

      respond_to do |format|
        format.html # index.html.erbb
        format.xml  { render :xml => @numeradors }
      end
  end

  # GET /numeradors/1
  # GET /numeradors/1.json
  # GET /numeradors/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @numerador }
    end
  end

  # GET /numeradors/new
  # GET /numeradors/new.json
  # GET /numeradors/new.xml
  def new
    @numerador = Numerador.by_company(current_company.id).new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @numerador }
    end
  end

  # GET /numeradors/1/edit
  # GET /numeradors/1/edit.json
  # GET /numeradors/1/edit.xml
  def edit
  end

  # POST /numeradors
  # POST /numeradors.json
  # POST /numeradors.xml
  def create
    @numerador = Numerador.by_company(current_company.id).new(params[:numerador])

    respond_to do |format|
      if @numerador.save
        format.html { redirect_to(@numerador, :notice => 'Numerador was successfully created.') }
        format.xml  { render :xml => @numerador, :status => :created, :location => @numerador }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @numerador.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /numeradors/1
  # PUT /numeradors/1.json
  # PUT /numeradors/1.xml
  def update
    respond_to do |format|
      if @numerador.update_attributes(params[:numerador])
        format.html { redirect_to(@numerador, :notice => 'Numerador was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @numerador.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /numeradors/1
  # DELETE /numeradors/1.json
  # DELETE /numeradors/1.xml
  def destroy
    begin
      @numerador.destroy
      flash[:success] = "successfully destroyed."
    rescue ActiveRecord::DeleteRestrictionError => e
      @numerador.errors.add(:base, e)
      flash[:error] = "#{e}"
      redirect_to numerador_url
    else
      redirect_to numeradors_url
    end
  end

  def find_numerador
    @numerador = Numerador.by_company(current_company.id).find(params[:id])
  end
end

