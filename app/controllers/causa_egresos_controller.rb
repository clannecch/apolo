class CausaEgresosController < ApplicationController
  before_filter :find_causa_egreso, :except => [:index, :new, :create]

  # GET /causa_egresos
  # GET /causa_egresos.xml
  def index
    #@causa_egresos = CausaEgreso.by_company(current_company.id).all
    @search = CausaEgreso.by_company(current_company.id).search(params[:search])
    @causa_egresos = @search.page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erbb
      format.xml  { render :xml => @causa_egresos }
    end
  end

  # GET /causa_egresos/1
  # GET /causa_egresos/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @causa_egreso }
    end
  end

  # GET /causa_egresos/new
  # GET /causa_egresos/new.xml
  def new
    @causa_egreso = CausaEgreso.by_company(current_company.id).new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @causa_egreso }
    end
  end

  # GET /causa_egresos/1/edit
  def edit
  end

  # POST /causa_egresos
  # POST /causa_egresos.xml
  def create
    @causa_egreso = CausaEgreso.by_company(current_company.id).new(params[:causa_egreso])

    respond_to do |format|
      if @causa_egreso.save
        format.html { redirect_to(@causa_egreso, :notice => 'Causa egreso was successfully created.') }
        format.xml  { render :xml => @causa_egreso, :status => :created, :location => @causa_egreso }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @causa_egreso.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /causa_egresos/1
  # PUT /causa_egresos/1.xml
  def update
    respond_to do |format|
      if @causa_egreso.update_attributes(params[:causa_egreso])
        format.html { redirect_to(@causa_egreso, :notice => 'Causa egreso was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @causa_egreso.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /causa_egresos/1
  # DELETE /causa_egresos/1.xml
  def destroy
    begin
      @causa_egreso.destroy
      flash[:success] = "successfully destroyed."
    rescue ActiveRecord::DeleteRestrictionError => e
      @causa_egreso.errors.add(:base, e)
      flash[:error] = "#{e}"
    ensure
      redirect_to causa_egreso_url
    end
  end


  protected

  def find_causa_egreso
    @causa_egreso = CausaEgreso.by_company(current_company.id).find(params[:id])
  end
end
