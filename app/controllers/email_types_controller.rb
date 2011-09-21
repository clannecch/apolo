class EmailTypesController < ApplicationController
  before_filter :find_email_type, :except => [:index, :new, :create]

  # GET /email_types
  # GET /email_types.xml
  def index
    @search = EmailType.by_company(current_company.id).search(params[:search])
    @email_types = @search.page(params[:page]).per(10)

    respond_to do |format|
      format.html # indexoo.html.erb
      format.xml  { render :xml => @email_types }
    end
  end

  # GET /email_types/1
  # GET /email_types/1.xml
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @email_type }
    end
  end

  # GET /email_types/new
  # GET /email_types/new.xml
  def new
    @email_type = EmailType.by_company(current_company.id).new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @email_type }
    end
  end

  # GET /email_types/1/edit
  def edit
  end

  # POST /email_types
  # POST /email_types.xml
  def create
    @email_type = EmailType.by_company(current_company.id).new(params[:email_type])

    respond_to do |format|
      if @email_type.save
        format.html { redirect_to(@email_type, :notice => 'Email type was successfully created.') }
        format.xml  { render :xml => @email_type, :status => :created, :location => @email_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @email_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /email_types/1
  # PUT /email_types/1.xml
  def update

    respond_to do |format|
      if @email_type.update_attributes(params[:email_type])
        format.html { redirect_to(@email_type, :notice => 'Email type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @email_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /email_types/1
  # DELETE /email_types/1.xml
  def destroy
    begin
      @email_type.destroy
      flash[:success] = "successfully destroyed."
    rescue ActiveRecord::DeleteRestrictionError => e
      @email_type.errors.add(:base, e)
      flash[:error] = "#{e}"
    ensure
      redirect_to email_type_url
    end
  end

  def find_email_type
      @email_type = EmailType.by_company(current_company.id).find(params[:id])
  end
end
