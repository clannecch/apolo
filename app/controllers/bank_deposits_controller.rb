class BankDepositsController < ApplicationController
  before_filter :find_bank_deposit, :except => [:index, :new, :create]

  # GET /bank_deposits
  # GET /bank_deposits.xml
  def index
    #@bank_deposits = BankDeposit.by_company(current_company.id).all
    @search = BankDeposit.by_company(current_company.id).search(params[:search])
    @bank_deposits = @search.page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erbb
      format.xml  { render :xml => @bank_deposits }
      format.pdf do
        dump_tmp_filename = Rails.root.join('tmp', @bank_deposits.last.cache_key)
        Dir.mkdir(dump_tmp_filename.dirname) unless File.directory?(dump_tmp_filename.dirname)
        print_bank_deposits_pdf(dump_tmp_filename)
        send_file(dump_tmp_filename, :type => :pdf, :disposition => 'attachment', :filename => "bank_deposits.pdf")
      end
    end
  end

  def print_bank_deposits_pdf(filename)
    require 'prawn'
    #@bank_deposits = BankDeposit.by_company(current_company.id).all
    pdf = Prawn::Document.new(:left_margin => 35, :top_margin => 35,:page_size => "LETTER", :page_layout => :landscape)
    #estos datos los deber?a traer de la empresa. yo los tengo por ahora fijo. El logo lo tendr?a que levantar como adjunto de empresa en la taba de attachments-
    company_logo = "logo.jpg"
    company_name = current_company.name
    # lineas repetitivas en todas las hojas
    pdf.repeat(:all, :dynamic => true) do
      pdf.draw_text "Listado de Bancos".center(200), :at => [5,560],:style => :bold, :size => 11
      pdf.draw_text ( "Empresa " + company_name).center(200), :at => [5,550],:style => :bold, :size => 11
      pdf.draw_text "Hoja Nro.: " + pdf.page_number.to_s.rjust(4,"0"), :at => [610, 550]
      #pdf.image company_logo, :at => [5,570], :width => 30
    end
    #Defino la matriz con los datos.La primer linea la voy a tomar como titulo. La segunda dimensi?n esta nula a prop?sito, ya que si lo dejo con 1 sola da error
    data = [
      [BankDeposit.human_attribute_name('detalle')
      ], []]
    # adiciono a la tabla todos los campos que quiero por cada registro
    @bank_deposits.each do |item|
      data <<
      [item.detalle
      ]
    end
    #imprimo la tabla. en column_withs le indico el ancho de cada columna, en el cell_stype, el font, el relleno y las alineaciones H y V, :header => true indica que la 1er linea de la matriz es repetitiva en cada hoja.,    :row_colors indica el color de cada linea par e impar (No del header).
    pdf.table(data, :column_widths => [700, 10],
      :cell_style => { :font => "Times-Roman",:size => 10,:padding => [4,4,4,4], :align => :left, :valign => :center },
      :header => true,
      :row_colors => [ "F0F0F0", "FFFFCC" ])
    pdf.render_file(filename)
  end

  # GET /bank_deposits/1
  # GET /bank_deposits/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bank_deposit }
      format.pdf do
        dump_tmp_filename = Rails.root.join('tmp', @bank_deposit.cache_key)
        Dir.mkdir(dump_tmp_filename.dirname) unless File.directory?(dump_tmp_filename.dirname)
        save_pdf_to(dump_tmp_filename, @bank_deposit)
        send_file(dump_tmp_filename, :type => :pdf, :disposition => 'attachment', :filename => "bank_deposits.pdf")
      end
    end
  end

  # GET /bank_deposits/new
  # GET /bank_deposits/new.xml
  def new
    @bank_deposit = BankDeposit.by_company(current_company.id).new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bank_deposit }
    end
  end

  # GET /bank_deposits/1/edit
  def edit
  end

  # POST /bank_deposits
  # POST /bank_deposits.xml
  def create
    @bank_deposit = BankDeposit.by_company(current_company.id).new(params[:bank_deposit])

    respond_to do |format|
      if @bank_deposit.save
        format.html { redirect_to(@bank_deposit, :notice => 'Bank deposit was successfully created.') }
        format.xml  { render :xml => @bank_deposit, :status => :created, :location => @bank_deposit }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bank_deposit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bank_deposits/1
  # PUT /bank_deposits/1.xml
  def update
    respond_to do |format|
      if @bank_deposit.update_attributes(params[:bank_deposit])
        format.html { redirect_to(@bank_deposit, :notice => 'Bank deposit was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bank_deposit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bank_deposits/1
  # DELETE /bank_deposits/1.xml
  def destroy
    begin
      @bank_deposit.destroy
      flash[:success] = "successfully destroyed."
    rescue ActiveRecord::DeleteRestrictionError => e
      @bank_deposit.errors.add(:base, e)
      flash[:error] = "#{e}"
      redirect_to bank_deposit_url
    else
      redirect_to bank_deposits_url
    end
  end

  def find_bank_deposit
    @bank_deposit = BankDeposit.by_company(current_company.id).find(params[:id])
  end

end
