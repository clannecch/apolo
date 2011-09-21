class MenusController < ApplicationController
	respond_to :html, :xml, :json

	def index
		@menus = Menu.all
		flash.now[:notice] = "No se encontraron registros" if @menus.empty?
		respond_with(@menus)
	end

	def show
		@menu = Menu.find(params[:id])
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
		@menu = Menu.find(params[:id])
		respond_with(@menu)
	end

	def update
		@menu = Menu.find(params[:id])
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
    ensure
      redirect_to @menu_url
    end
  end

end
