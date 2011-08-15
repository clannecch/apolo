class MenuUsersController < ApplicationController
	respond_to :html, :xml, :json

	def index
		@menu_users = MenuUser.all
		flash.now[:notice] = "No se encontraron registros" if @menu_users.empty?
		respond_with(@menu_users)
	end

	def show
		@menu_user = MenuUser.find(params[:id])
		respond_with(@menu_user)
	end

	def new
		@menu_user = MenuUser.new
		respond_with(@menu_user)
	end

	def create
		@menu_user = MenuUser.new(params[:menu_user])
		flash[:notice] = "Menu User creado con exito." if @menu_user.save
		respond_with(@menu_user)
	end

	def edit
		@menu_user = MenuUser.find(params[:id])
		respond_with(@menu_user)
	end

	def update
		@menu_user = MenuUser.find(params[:id])
		flash[:notice] = "Menu User actualizado con exito." if @menu_user.update_attributes(params[:menu_user])
		respond_with(@menu_user)
	end

	def destroy
		@menu_user = MenuUser.find(params[:id])
		@menu_user.destroy
		flash[:notice] = "Menu User borrado con exito." if @menu_user.destroy
		respond_with(@menu_user)
	end
end
