class MenusController < ApplicationController
	respond_to :html, :xml, :json
  before_filter :find_menu, :except => [:index, :new, :create]

  def index
    @search = Menu.search(params[:search])
    @menus = @search.page(params[:page]).per(20).order{|m| m[:parent_id, :name]}
    flash.now[:notice] = t('flash.actions.index.notice') if @menus.empty?
		respond_with(@menus)
	end

	def show
		respond_with(@menu)
	end

	def new
		@menu = Menu.new
		respond_with(@menu)
	end

	def create
		@menu = Menu.new(params[:menu])
		flash[:notice] = "Menu creado con exito." if @menu.save
		respond_with(@menu)
	end

	def edit
		respond_with(@menu)
	end

	def update
		flash[:notice] = "Menu actualizado con exito." if @menu.update_attributes(params[:menu])
		respond_with(@menu)
	end

  def destroy
    begin
      @menu.destroy
      flash[:success] = "successfully destroyed."
    rescue ActiveRecord::DeleteRestrictionError => e
      @menu.errors.add(:base, e)
      flash[:error] = "#{e}"
      redirect_to menu_url
    else
      redirect_to menus_url
    end
  end

  protected

  def find_menu
    @menu = Menu.find(params[:id])
  end
end
