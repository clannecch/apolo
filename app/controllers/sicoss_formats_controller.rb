
class SicossFormatsController < ApplicationController

  before_filter :find_sicoss_format, :except => [:index, :new, :create]

  respond_to :html, :xml, :json

  # GET /sicoss_formats
  # GET /sicoss_formats.json
  # GET /sicoss_formats.xml
  def index
    @sicoss_formats = SicossFormat.all
    flash.now[:notice] = t('flash.actions.index.notice') if @sicoss_formats.empty?
    respond_with(@sicoss_formats)
  end

  # GET /sicoss_formats/1
  # GET /sicoss_formats/1.json
  # GET /sicoss_formats/1.xml
  def show
    respond_with(@sicoss_format)
  end

  # GET /sicoss_formats/new
  # GET /sicoss_formats/new.json
  # GET /sicoss_formats/new.xml
  def new
    @sicoss_format = SicossFormat.new
    respond_with(@sicoss_format)
  end

  # GET /sicoss_formats/1/edit
  # GET /sicoss_formats/1/edit.json
  # GET /sicoss_formats/1/edit.xml
  def edit
    respond_with(@sicoss_format)
  end

  # POST /sicoss_formats
  # POST /sicoss_formats.json
  # POST /sicoss_formats.xml
  def create
    @sicoss_format = SicossFormat.new(params[:sicoss_format])
    flash[:notice] = t('scaffold.notice.created', :item => SicossFormat.model_name.human) if @sicoss_format.save
    respond_with(@sicoss_format, :location => sicoss_formats_path)
  end

  # PUT /sicoss_formats/1
  # PUT /sicoss_formats/1.json
  # PUT /sicoss_formats/1.xml
  def update
    flash[:notice] = t('scaffold.notice.updated', :item => SicossFormat.model_name.human) if @sicoss_format.update_attributes(params[:sicoss_format])
    respond_with(@sicoss_format, :location => sicoss_formats_path)
  end

  # DELETE /sicoss_formats/1
  # DELETE /sicoss_formats/1.json
  # DELETE /sicoss_formats/1.xml
  def destroy
    begin
      @sicoss_format.destroy
      flash[:success] = "successfully destroyed."
    rescue ActiveRecord::DeleteRestrictionError => e
      @sicoss_format.errors.add(:base, e)
      flash[:error] = "#{e}"
    ensure
      redirect_to sicoss_format_url
    end
  end

  protected

  def find_sicoss_format
    @sicoss_format = SicossFormat.find(params[:id])
  end
end

