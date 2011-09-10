class UsersController < ApplicationController

  before_filter :find_user, :except => [:index, :new, :create]

  respond_to :html, :xml, :json

  # GET /users
  # GET /users.json
  # GET /users.xml
  def index
    @users = User.all
    flash.now[:notice] = t('flash.actions.index.notice') if @users.empty?
    respond_with(@users)
  end

  # GET /users/1
  # GET /users/1.json
  # GET /users/1.xml
  def show
    respond_with(@user)
  end

  # GET /users/new
  # GET /users/new.json
  # GET /users/new.xml
  def new
    @user = User.new
    respond_with(@user)
  end

  # GET /users/1/edit
  # GET /users/1/edit.json
  # GET /users/1/edit.xml
  def edit
    respond_with(@user)
  end

  # POST /users
  # POST /users.json
  # POST /users.xml
  def create
    @user = User.new(params[:user])
    flash[:notice] = t('scaffold.notice.created', :item => User.model_name.human) if @user.save
    respond_with(@user, :location => users_path)
  end

  # PUT /users/1
  # PUT /users/1.json
  # PUT /users/1.xml
  def update
    flash[:notice] = t('scaffold.notice.updated', :item => User.model_name.human) if @user.update_attributes(params[:user])
    respond_with(@user, :location => users_path)
  end

  # DELETE /users/1
  # DELETE /users/1.json
  # DELETE /users/1.xml
  def destroy
    flash[:notice] = t('scaffold.notice.destroyed', :item => User.model_name.human) if @user.destroy
    respond_with(@user)
  end

  protected

  def find_user
    @user = User.find(params[:id])
  end
end

