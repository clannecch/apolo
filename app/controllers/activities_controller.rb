class ActivitiesController < ApplicationController
  respond_to :html, :xml, :json
  before_filter :find_activity, :except => [:index, :new, :create]

  # GET /activities
  # GET /activities.json
  # GET /activities.xml
  def index
    @search = Activity.search(params[:search])
    @activities = @search.page(params[:page]).per(10)
    flash.now[:notice] = t('flash.actions.index.notice') if @activities.empty?
    respond_with(@activities)
  end

  # GET /activities/1
  # GET /activities/1.json
  # GET /activities/1.xml
  def show
    respond_with(@activity)
  end

  # GET /activities/new
  # GET /activities/new.json
  # GET /activities/new.xml
  def new
    @activity = Activity.new
    respond_with(@activity)
  end

  # GET /activities/1/edit
  # GET /activities/1/edit.json
  # GET /activities/1/edit.xml
  def edit
    respond_with(@activity)
  end

  # POST /activities
  # POST /activities.json
  # POST /activities.xml
  def create
    @activity = Activity.new(params[:activity])
    flash[:notice] = t('scaffold.notice.created', :item => Activity.model_name.human) if @activity.save
    respond_with(@activity, :location => activities_path)
  end

  # PUT /activities/1
  # PUT /activities/1.json
  # PUT /activities/1.xml
  def update
    flash[:notice] = t('scaffold.notice.updated', :item => Activity.model_name.human) if @activity.update_attributes(params[:activity])
    respond_with(@activity, :location => activities_path)
  end

  # DELETE /activities/1
  # DELETE /activities/1.json
  # DELETE /activities/1.xml
  def destroy
    begin
      @activity.destroy
      flash[:success] = "successfully destroyed."
    rescue ActiveRecord::DeleteRestrictionError => e
      @activity.errors.add(:base, e)
      flash[:error] = "#{e}"
      redirect_to activity_url
    else
      redirect_to activities_url
    end
  end

  protected

  def find_activity
    @activity = Activity.find(params[:id])
  end
end

