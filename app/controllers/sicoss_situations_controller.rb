
class SicossSituationsController < ApplicationController

  before_filter :find_sicoss_situation, :except => [:index, :new, :create]

  respond_to :html, :xml, :json

  # GET /sicoss_situations
  # GET /sicoss_situations.json
  # GET /sicoss_situations.xml
  def index
    @sicoss_situations = SicossSituation.all
    flash.now[:notice] = t('flash.actions.index.notice') if @sicoss_situations.empty?
    respond_with(@sicoss_situations)
  end

  # GET /sicoss_situations/1
  # GET /sicoss_situations/1.json
  # GET /sicoss_situations/1.xml
  def show
    respond_with(@sicoss_situation)
  end

  # GET /sicoss_situations/new
  # GET /sicoss_situations/new.json
  # GET /sicoss_situations/new.xml
  def new
    @sicoss_situation = SicossSituation.new
    respond_with(@sicoss_situation)
  end

  # GET /sicoss_situations/1/edit
  # GET /sicoss_situations/1/edit.json
  # GET /sicoss_situations/1/edit.xml
  def edit
    respond_with(@sicoss_situation)
  end

  # POST /sicoss_situations
  # POST /sicoss_situations.json
  # POST /sicoss_situations.xml
  def create
    @sicoss_situation = SicossSituation.new(params[:sicoss_situation])
    flash[:notice] = t('scaffold.notice.created', :item => SicossSituation.model_name.human) if @sicoss_situation.save
    respond_with(@sicoss_situation, :location => sicoss_situations_path)
  end

  # PUT /sicoss_situations/1
  # PUT /sicoss_situations/1.json
  # PUT /sicoss_situations/1.xml
  def update
    flash[:notice] = t('scaffold.notice.updated', :item => SicossSituation.model_name.human) if @sicoss_situation.update_attributes(params[:sicoss_situation])
    respond_with(@sicoss_situation, :location => sicoss_situations_path)
  end

  # DELETE /sicoss_situations/1
  # DELETE /sicoss_situations/1.json
  # DELETE /sicoss_situations/1.xml
  def destroy
    begin
      @sicoss_situation.destroy
      flash[:success] = "successfully destroyed."
    rescue ActiveRecord::DeleteRestrictionError => e
      @sicoss_situation.errors.add(:base, e)
      flash[:error] = "#{e}"
      redirect_to sicoss_situation_url
    else
      redirect_to sicoss_situations_url
    end
  end

  protected

  def find_sicoss_situation
    @sicoss_situation = SicossSituation.find(params[:id])
  end
end

