
class SicossConditionsController < ApplicationController

  before_filter :find_sicoss_condition, :except => [:index, :new, :create]

  respond_to :html, :xml, :json

  # GET /sicoss_conditions
  # GET /sicoss_conditions.json
  # GET /sicoss_conditions.xml
  def index
    @search = SicossCondition.search(params[:search])
    @sicoss_conditions = @search.page(params[:page]).per(10)
    flash.now[:notice] = t('flash.actions.index.notice') if @sicoss_conditions.empty?
    respond_with(@sicoss_conditions)
  end

  # GET /sicoss_conditions/1
  # GET /sicoss_conditions/1.json
  # GET /sicoss_conditions/1.xml
  def show
    respond_with(@sicoss_condition)
  end

  # GET /sicoss_conditions/new
  # GET /sicoss_conditions/new.json
  # GET /sicoss_conditions/new.xml
  def new
    @sicoss_condition = SicossCondition.new
    respond_with(@sicoss_condition)
  end

  # GET /sicoss_conditions/1/edit
  # GET /sicoss_conditions/1/edit.json
  # GET /sicoss_conditions/1/edit.xml
  def edit
    respond_with(@sicoss_condition)
  end

  # POST /sicoss_conditions
  # POST /sicoss_conditions.json
  # POST /sicoss_conditions.xml
  def create
    @sicoss_condition = SicossCondition.new(params[:sicoss_condition])
    flash[:notice] = t('scaffold.notice.created', :item => SicossCondition.model_name.human) if @sicoss_condition.save
    respond_with(@sicoss_condition, :location => sicoss_conditions_path)
  end

  # PUT /sicoss_conditions/1
  # PUT /sicoss_conditions/1.json
  # PUT /sicoss_conditions/1.xml
  def update
    flash[:notice] = t('scaffold.notice.updated', :item => SicossCondition.model_name.human) if @sicoss_condition.update_attributes(params[:sicoss_condition])
    respond_with(@sicoss_condition, :location => sicoss_conditions_path)
  end

  # DELETE /sicoss_conditions/1
  # DELETE /sicoss_conditions/1.json
  # DELETE /sicoss_conditions/1.xml
  def destroy
    begin
      @sicoss_condition.destroy
      flash[:success] = "successfully destroyed."
    rescue ActiveRecord::DeleteRestrictionError => e
      @sicoss_condition.errors.add(:base, e)
      flash[:error] = "#{e}"
      redirect_to sicoss_condition_url
    else
      redirect_to sicoss_conditions_url
    end
  end

  protected

  def find_sicoss_condition
    @sicoss_condition = SicossCondition.find(params[:id])
  end
end

