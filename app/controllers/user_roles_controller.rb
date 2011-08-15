class UserRolesController < ApplicationController
	respond_to :html, :xml, :json

	def index
		@user_roles = UserRole.all
		flash.now[:notice] = "No se encontraron registros" if @user_roles.empty?
		respond_with(@user_roles)
	end

	def show
		@user_role = UserRole.find(params[:id])
		respond_with(@user_role)
	end

	def new
		@user_role = UserRole.new
		respond_with(@user_role)
	end

	def create
		@user_role = UserRole.new(params[:user_role])
		flash[:notice] = "User Role creado con exito." if @user_role.save
		respond_with(@user_role)
	end

	def edit
		@user_role = UserRole.find(params[:id])
		respond_with(@user_role)
	end

	def update
		@user_role = UserRole.find(params[:id])
		flash[:notice] = "User Role actualizado con exito." if @user_role.update_attributes(params[:user_role])
		respond_with(@user_role)
	end

	def destroy
		@user_role = UserRole.find(params[:id])
		@user_role.destroy
		flash[:notice] = "User Role borrado con exito." if @user_role.destroy
		respond_with(@user_role)
	end
end
