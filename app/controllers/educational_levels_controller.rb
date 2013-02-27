class EducationalLevelsController < ApplicationController
before_filter :find_educational_level, :except => [:index, :new, :create]
  # GET /educational_levels
  # GET /educational_levels.xml
  def index
    @search = EducationalLevel.search(params[:search])
    @educational_levels = @search.page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erbb
      format.xml  { render :xml => @educational_levels }
    end
  end

  # GET /educational_levels/1
  # GET /educational_levels/1.xml
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @educational_level }
    end
  end

  # GET /educational_levels/new
  # GET /educational_levels/new.xml
  def new
    @educational_level = EducationalLevel.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @educational_level }
    end
  end

  # GET /educational_levels/1/edit
  def edit
  end

  # POST /educational_levels
  # POST /educational_levels.xml
  def create
    @educational_level = EducationalLevel.new(params[:educational_level])

    respond_to do |format|
      if @educational_level.save
        format.html { redirect_to(@educational_level, :notice => 'Educational level was successfully created.') }
        format.xml  { render :xml => @educational_level, :status => :created, :location => @educational_level }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @educational_level.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /educational_levels/1
  # PUT /educational_levels/1.xml
  def update

    respond_to do |format|
      if @educational_level.update_attributes(params[:educational_level])
        format.html { redirect_to(@educational_level, :notice => 'Educational level was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @educational_level.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /educational_levels/1
  # DELETE /educational_levels/1.xml
  def destroy
    begin
      @educational_level.destroy
      flash[:success] = "successfully destroyed."
      redirect_to educational_levels_url
    rescue ActiveRecord::DeleteRestrictionError => e
      @educational_level.errors.add(:base, e)
      flash[:error] = "#{e}"
      redirect_to educational_level_url
    end
  end

  def find_educational_level
      @educational_level = EducationalLevel.find(params[:id])
  end

end
