<%-
=begin

  This file is part of rails-templates (https://github.com/apslab/rails-templates) - application template and various custom templates to overrides generals rails generators
  Copyright (C) 2011 - Luis Petek <lmpetek@gmail.com>, Maximiliano Dello Russo <maxidr@gmail.com> and Luis E. Guardiola <lguardiola@gmail.com>

  controller.rb is free software: you can redistribute it and/or modify
  it under the terms of the GNU Affero General Public License as
  published by the Free Software Foundation, either version 3 of the
  License, or (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU Affero General Public License for more details.

  You should have received a copy of the GNU Affero General Public License
  along with this program. If not, see <http://www.gnu.org/licenses/>.

  Usage:
    put this file into lib/templates/rails/scaffold_controller/controller.rb

=end
-%>
class <%= controller_class_name %>Controller < ApplicationController

  before_filter :find_<%= singular_table_name %>, :except => [:index, :new, :create]

  respond_to :html, :xml, :json

  # GET <%= route_url %>
  # GET <%= route_url %>.json
  # GET <%= route_url %>.xml
  def index
    @<%= plural_table_name %> = <%= orm_class.all(class_name) %>
    flash.now[:notice] = t('flash.actions.index.notice') if @<%= plural_table_name %>.empty?
    respond_with(@<%= plural_table_name %>)
  end

  # GET <%= route_url %>/1
  # GET <%= route_url %>/1.json
  # GET <%= route_url %>/1.xml
  def show
    respond_with(@<%= singular_table_name %>)
  end

  # GET <%= route_url %>/new
  # GET <%= route_url %>/new.json
  # GET <%= route_url %>/new.xml
  def new
    @<%= singular_table_name %> = <%= orm_class.build(class_name) %>
    respond_with(@<%= singular_table_name %>)
  end

  # GET <%= route_url %>/1/edit
  # GET <%= route_url %>/1/edit.json
  # GET <%= route_url %>/1/edit.xml
  def edit
    respond_with(@<%= singular_table_name %>)
  end

  # POST <%= route_url %>
  # POST <%= route_url %>.json
  # POST <%= route_url %>.xml
  def create
    @<%= singular_table_name %> = <%= orm_class.build(class_name, "params[:#{singular_table_name}]") %>
    flash[:notice] = t('scaffold.notice.created', :item => <%= singular_table_name.camelize %>.model_name.human) if @<%= orm_instance.save %>
    respond_with(@<%= singular_table_name %>, :location => <%= plural_table_name %>_path)
  end

  # PUT <%= route_url %>/1
  # PUT <%= route_url %>/1.json
  # PUT <%= route_url %>/1.xml
  def update
    flash[:notice] = t('scaffold.notice.updated', :item => <%= singular_table_name.camelize %>.model_name.human) if @<%= orm_instance.update_attributes("params[:#{singular_table_name}]") %>
    respond_with(@<%= singular_table_name %>, :location => <%= plural_table_name %>_path)
  end

  # DELETE <%= route_url %>/1
  # DELETE <%= route_url %>/1.json
  # DELETE <%= route_url %>/1.xml
  def destroy
    flash[:notice] = t('scaffold.notice.destroyed', :item => <%= singular_table_name.camelize %>.model_name.human) if @<%= orm_instance.destroy %>
    respond_with(@<%= singular_table_name %>)
  end

  protected

  def find_<%= singular_table_name %>
    @<%= singular_table_name %> = <%= orm_class.find(class_name, "params[:id]") %>
  end
end

