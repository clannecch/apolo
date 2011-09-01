
class SicossActivitiesController < ApplicationController

  before_filter :find_sicoss_activity, :except => [:index, :new, :create]

  respond_to :html, :xml, :json

  # GET /sicoss_activities
  # GET /sicoss_activities.json
  # GET /sicoss_activities.xml
  def index
    @sicoss_activities = SicossActivity.all
    flash.now[:notice] = t('flash.actions.index.notice') if @sicoss_activities.empty?
    respond_with(@sicoss_activities)
  end

  # GET /sicoss_activities/1
  # GET /sicoss_activities/1.json
  # GET /sicoss_activities/1.xml
  def show
    respond_with(@sicoss_activity)
  end

  # GET /sicoss_activities/new
  # GET /sicoss_activities/new.json
  # GET /sicoss_activities/new.xml
  def new
    @sicoss_activity = SicossActivity.new
    respond_with(@sicoss_activity)
  end

  # GET /sicoss_activities/1/edit
  # GET /sicoss_activities/1/edit.json
  # GET /sicoss_activities/1/edit.xml
  def edit
    respond_with(@sicoss_activity)
  end

  # POST /sicoss_activities
  # POST /sicoss_activities.json
  # POST /sicoss_activities.xml
  def create
    @sicoss_activity = SicossActivity.new(params[:sicoss_activity])
    flash[:notice] = t('scaffold.notice.created', :item => SicossActivity.model_name.human) if @sicoss_activity.save
    respond_with(@sicoss_activity, :location => sicoss_activities_path)
  end

  # PUT /sicoss_activities/1
  # PUT /sicoss_activities/1.json
  # PUT /sicoss_activities/1.xml
  def update
    flash[:notice] = t('scaffold.notice.updated', :item => SicossActivity.model_name.human) if @sicoss_activity.update_attributes(params[:sicoss_activity])
    respond_with(@sicoss_activity, :location => sicoss_activities_path)
  end

  # DELETE /sicoss_activities/1
  # DELETE /sicoss_activities/1.json
  # DELETE /sicoss_activities/1.xml
  def destroy
    flash[:notice] = t('scaffold.notice.destroyed', :item => SicossActivity.model_name.human) if @sicoss_activity.destroy
    respond_with(@sicoss_activity)
  end

  protected

  def find_sicoss_activity
    @sicoss_activity = SicossActivity.find(params[:id])
  end
end

