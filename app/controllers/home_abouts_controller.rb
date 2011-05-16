class HomeAboutsController < ApplicationController
  # GET /home_abouts
  # GET /home_abouts.xml
  def index
    @home_abouts = HomeAbout.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @home_abouts }
    end
  end

  # GET /home_abouts/1
  # GET /home_abouts/1.xml
  def show
    @home_about = HomeAbout.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @home_about }
    end
  end

  # GET /home_abouts/new
  # GET /home_abouts/new.xml
  def new
    @home_about = HomeAbout.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @home_about }
    end
  end

  # GET /home_abouts/1/edit
  def edit
    @home_about = HomeAbout.find(params[:id])
  end

  # POST /home_abouts
  # POST /home_abouts.xml
  def create
    @home_about = HomeAbout.new(params[:home_about])

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
    @home_about = HomeAbout.find(params[:id])

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
    @home_about = HomeAbout.find(params[:id])
    @home_about.destroy

    respond_to do |format|
      format.html { redirect_to(home_abouts_url) }
      format.xml  { head :ok }
    end
  end
end
