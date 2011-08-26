class ApplicationController < ActionController::Base
  layout 'apslabs'

  protect_from_forgery

  helper_method :current_company
# paperclip claudio
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
# fin paperclip claudio


  before_filter :check_change_company
  before_filter :before_all

  protected

  def check_change_company
    return if params[:cc].blank?
    session[:current_company] = Company.find(params[:cc])
    redirect_to :back
  end

  def current_company
    session[:current_company] || Company.first
  end

  def before_all
    @menus = Menu.all
  end

  # los dos metodos para impresion (ficha y lista) se basan en attr_accessible
  # y en los archivos yml para i18n de cada modelo
  # TODO : si no tengo traduccion para la propiedad tomar el nombre del campo
  def attr_printables(entity)
    # _accessible_attributes
    vector = []
    entity.attributes.reject{|x| ['created_at','id','updated_at','company_id'].include?(x)}.each do |item|
      if item[0].include?('_id')
        field_name = eval(item[0].partition('_')[0].capitalize + '.new').has_attribute?('name') ? 'name' : 'detalle'
        item[1] = eval('entity.' + item[0].partition('_')[0]+".try('" + field_name + "')").to_s
      end
      vector << item
    end
    return vector
  end

  # impresion de una entidad
  def save_pdf_to(filename,entity)
    Prawn::Document.generate(filename) do |pdf|
      offset = 700
      attr_printables(entity).each do |member|
        pdf.draw_text I18n.t('activerecord.attributes.' + entity.class.name.downcase + '.' + member[0]), :at => [0,offset], :size => 10
        pdf.draw_text member[1], :at => [100,offset], :size => 10
        offset -= 15
      end
    end
  end

end

