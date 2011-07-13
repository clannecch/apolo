class HomeAboutsController < ApplicationController
  before_filter :find_home_about, :except => [:index, :new, :create]
  # GET /home_abouts
  # GET /home_abouts.xml
  def index
    @home_abouts = HomeAbout.by_company(current_company.id).all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @home_abouts }
    end
  end

  # GET /home_abouts/1
  # GET /home_abouts/1.xml
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @home_about }
    end
  end

  # GET /home_abouts/new
  # GET /home_abouts/new.xml
  def new
    @home_about = HomeAbout.by_company(current_company.id).new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @home_about }
    end
  end

  # GET /home_abouts/1/edit
  def edit
  end

  # POST /home_abouts
  # POST /home_abouts.xml
  def create
    @home_about = HomeAbout.by_company(current_company.id).new(params[:home_about])

    respond_to do |format|
      if @home_about.save
        format.html { redirect_to(@home_about, :notice => 'Home about was successfully created.') }
        format.xml  { render :xml => @home_about, :status => :created, :location => @home_about }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @home_about.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /home_abouts/1
  # PUT /home_abouts/1.xml
  def update

    respond_to do |format|
      if @home_about.update_attributes(params[:home_about])
        format.html { redirect_to(@home_about, :notice => 'Home about was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @home_about.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /home_abouts/1
  # DELETE /home_abouts/1.xml
  def destroy
    @home_about.destroy

    respond_to do |format|
      format.html { redirect_to(home_abouts_url) }
      format.xml  { head :ok }
    end
  end
  def find_home_about
      @home_about = HomeAbout.by_company(current_company.id).find(params[:id])
  end

end
