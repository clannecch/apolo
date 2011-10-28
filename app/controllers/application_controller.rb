class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_company

  # custom layout
  layout :layout_by_resource

  # devise close for all!
  before_filter :authenticate_user!
  before_filter :check_change_company
  before_filter :before_all


#  layout 'apslabs'

#  protect_from_forgery
  
  #devise controller
#  before_filter :authenticate_user!

#  helper_method :current_company
# paperclip claudio
  helper :all # include all helpers, all the time
#  protect_from_forgery # See ActionController::RequestForgeryProtection for details
# fin paperclip claudio
#  before_filter :check_change_company
#  before_filter :before_all



# #################################################################################
  def print_table
    name = params[:tablename]
    require 'prawn'
    @table = name.constantize.all
    #Cuando el usuario no pueda acceder a la entidad, descomentar eso
=begin
    flash[:error] = "Usted no tiene acceso a la entidad " + name.humanize
    redirect_to :root
    return
=end
    filename = Rails.root.join('tmp',rand.to_s[2..15])
    Dir.mkdir(filename.dirname) unless File.directory?(filename.dirname)

    if !@table.any?
      flash[:error] = "No existen Movimientos para Listar"
      return
    end

    dependencias = {}
    types ={}
    len=[]
    line = []
    eval(name+".columns").each do |col|
      if !"id created_at updated_at company_id ".include?(col.name)
        types[col.name] = name.camelize.constantize.columns_hash[col.name].type
        len << 0
        if col.name[-3,3] == "_id"
          cname="reg."+col.name+".to_s"
          begin
            line << col.name.gsub("_id","").camelize.constantize.model_name.human
            begin
             cname="reg."+ col.name.gsub("_id","")+".try(:name).to_s" if col.name.gsub("_id","").camelize.constantize.column_names.index("name").to_i > 0
             cname="reg."+ col.name.gsub("_id","")+".try(:detalle).to_s" if col.name.gsub("_id","").camelize.constantize.column_names.index("detalle") > 0
            rescue
            end
          rescue
            line << name.constantize.human_attribute_name(col.name)
          end
          dependencias[col.name] = cname
        else
          line << name.constantize.human_attribute_name(col.name)
        end
      end
    end
    data = []
    data << line
    data << []
    @table.each do |reg|
      line = []
      indice = 0
      eval(name+".columns").each do |col|
        if !"id created_at updated_at company_id".include?(col.name)
          if col.name[-3,3] == "_id"
            dato = eval(dependencias[col.name])
          else
            dato = eval("reg."+col.name+".to_s")
            if types[col.name] == :boolean
              dato = (dato == "true"  ? "Si" : "No")
            end
          end
          Rails.logger.info("Dato="+dato)
          Rails.logger.info("Dato.length="+dato.length.to_s)
          len[indice] = dato.length if dato.length > len[indice]
          indice += 1
          line << dato
        end
      end
      data << line
    end

    pdf = Prawn::Document.new(:left_margin => 35, :top_margin => 35,:page_size   => "LETTER",
                              :page_layout => (len.sum < 100 ? :portrait : :landscape) )
    pdf.repeat(:all, :dynamic => true) do
      offset =len.sum < 100 ? 745 : 560
      pdf.draw_text current_company.name.humanize, :at => [5,offset],:style => :bold, :size => 10
      pdf.draw_text "Hoja Nro.: " + pdf.page_number.to_s.rjust(4,"0"), :at => [410, offset], :size => 10
      pdf.draw_text name.constantize.model_name.human.pluralize.center(100), :at => [5,offset-10],:style => :bold, :size => 10
      pdf.draw_text " ", :at => [5, offset -10]
    end

    pdf.table(data, #:column_widths => [40, 170],
           :cell_style => { :font => "Times-Roman",
                            :size => 9,:padding => [2,3,4,2],
                            :align =>  :left,
                            :valign => :center },
           :header => true ,
           :row_colors => ["F0F0F0", "FFFFCC"]
            )   do
      indice= 0
      types.each do |t|
        if t[1] == :decimal || t[1] == :float || t[1] == :integer
          column(indice).align = :right
        end
        indice += 1
      end
#    row(0).column(0..6).align = :center
    end
    pdf.render_file(filename)
    send_file(filename, :type => :pdf, :disposition => 'attachment', :filename => name+".pdf")
    File.delete(filename) unless Rails.env.development?
  end


  protected

  def check_change_company
    return if params[:cc].blank?
    session[:current_company] = Company.find(params[:cc])
    $CURRENT_COMPANY = current_company
    redirect_to liquidacions_path      #:back
  end

  def current_company
    session[:current_company] || Company.first
#    $CURRENT_COMPANY = session[:current_company]
  end

#  def before_all
#    @menus = []
#    @menus = Menu.all if user_signed_in?
#  end

  def layout_by_resource
    if devise_controller?
      'application'
    else
      'apslabs'
    end
  end

  def before_all
    unless devise_controller?
      # @system_menus = Menu.all.select{|x| x.modulo.blank? || current_company.engines.to_s.include?(x.modulo)}
      @user_menu = Menu.all
    end  
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

