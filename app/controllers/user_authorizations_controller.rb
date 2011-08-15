class UserAuthorizationsController < ApplicationController
	respond_to :html, :xml, :json

	def index
		@user_authorizations = UserAuthorization.all
		flash.now[:notice] = "No se encontraron registros" if @user_authorizations.empty?
		respond_with(@user_authorizations)
	end

	def show
		@user_authorization = UserAuthorization.find(params[:id])
		respond_with(@user_authorization)
	end

	def new
		@user_authorization = UserAuthorization.new
		respond_with(@user_authorization)
	end

	def create
		@user_authorization = UserAuthorization.new(params[:user_authorization])
		flash[:notice] = "User Authorization creado con exito." if @user_authorization.save
		respond_with(@user_authorization)
	end

	def edit
		@user_authorization = UserAuthorization.find(params[:id])
		respond_with(@user_authorization)
	end

	def update
		@user_authorization = UserAuthorization.find(params[:id])
		flash[:notice] = "User Authorization actualizado con exito." if @user_authorization.update_attributes(params[:user_authorization])
		respond_with(@user_authorization)
	end

	def destroy
		@user_authorization = UserAuthorization.find(params[:id])
		@user_authorization.destroy
		flash[:notice] = "User Authorization borrado con exito." if @user_authorization.destroy
		respond_with(@user_authorization)
	end
end
