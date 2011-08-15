class MenuRolesController < ApplicationController
	respond_to :html, :xml, :json

	def index
		@menu_roles = MenuRole.all
		flash.now[:notice] = "No se encontraron registros" if @menu_roles.empty?
		respond_with(@menu_roles)
	end

	def show
		@menu_role = MenuRole.find(params[:id])
		respond_with(@menu_role)
	end

	def new
		@menu_role = MenuRole.new
		respond_with(@menu_role)
	end

	def create
		@menu_role = MenuRole.new(params[:menu_role])
		flash[:notice] = "Menu Role creado con exito." if @menu_role.save
		respond_with(@menu_role)
	end

	def edit
		@menu_role = MenuRole.find(params[:id])
		respond_with(@menu_role)
	end

	def update
		@menu_role = MenuRole.find(params[:id])
		flash[:notice] = "Menu Role actualizado con exito." if @menu_role.update_attributes(params[:menu_role])
		respond_with(@menu_role)
	end

	def destroy
		@menu_role = MenuRole.find(params[:id])
		@menu_role.destroy
		flash[:notice] = "Menu Role borrado con exito." if @menu_role.destroy
		respond_with(@menu_role)
	end
end
