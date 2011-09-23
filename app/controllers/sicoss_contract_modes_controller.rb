
class SicossContractModesController < ApplicationController

  before_filter :find_sicoss_contract_mode, :except => [:index, :new, :create]

  respond_to :html, :xml, :json

  # GET /sicoss_contract_modes
  # GET /sicoss_contract_modes.json
  # GET /sicoss_contract_modes.xml
  def index
    @sicoss_contract_modes = SicossContractMode.all
    flash.now[:notice] = t('flash.actions.index.notice') if @sicoss_contract_modes.empty?
    respond_with(@sicoss_contract_modes)
  end

  # GET /sicoss_contract_modes/1
  # GET /sicoss_contract_modes/1.json
  # GET /sicoss_contract_modes/1.xml
  def show
    respond_with(@sicoss_contract_mode)
  end

  # GET /sicoss_contract_modes/new
  # GET /sicoss_contract_modes/new.json
  # GET /sicoss_contract_modes/new.xml
  def new
    @sicoss_contract_mode = SicossContractMode.new
    respond_with(@sicoss_contract_mode)
  end

  # GET /sicoss_contract_modes/1/edit
  # GET /sicoss_contract_modes/1/edit.json
  # GET /sicoss_contract_modes/1/edit.xml
  def edit
    respond_with(@sicoss_contract_mode)
  end

  # POST /sicoss_contract_modes
  # POST /sicoss_contract_modes.json
  # POST /sicoss_contract_modes.xml
  def create
    @sicoss_contract_mode = SicossContractMode.new(params[:sicoss_contract_mode])
    flash[:notice] = t('scaffold.notice.created', :item => SicossContractMode.model_name.human) if @sicoss_contract_mode.save
    respond_with(@sicoss_contract_mode, :location => sicoss_contract_modes_path)
  end

  # PUT /sicoss_contract_modes/1
  # PUT /sicoss_contract_modes/1.json
  # PUT /sicoss_contract_modes/1.xml
  def update
    flash[:notice] = t('scaffold.notice.updated', :item => SicossContractMode.model_name.human) if @sicoss_contract_mode.update_attributes(params[:sicoss_contract_mode])
    respond_with(@sicoss_contract_mode, :location => sicoss_contract_modes_path)
  end

  # DELETE /sicoss_contract_modes/1
  # DELETE /sicoss_contract_modes/1.json
  # DELETE /sicoss_contract_modes/1.xml
  def destroy
    begin
      @sicoss_contract_mode.destroy
      flash[:success] = "successfully destroyed."
    rescue ActiveRecord::DeleteRestrictionError => e
      @sicoss_contract_mode.errors.add(:base, e)
      flash[:error] = "#{e}"
      redirect_to sicoss_contract_mode_url
    else
      redirect_to sicoss_contract_modes_url
    end
  end

  protected

  def find_sicoss_contract_mode
    @sicoss_contract_mode = SicossContractMode.find(params[:id])
  end
end

