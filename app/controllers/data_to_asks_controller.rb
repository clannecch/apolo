class DataToAsksController < ApplicationController
  before_filter :find_data_to_ask, :except => [:index, :new, :create]

  # GET /data_to_asks
  # GET /data_to_asks.xml
  def index
    @data_to_asks = DataToAsk.by_company(current_company.id).all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @data_to_asks }
    end
  end

  # GET /data_to_asks/1
  # GET /data_to_asks/1.xml
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @data_to_ask }
    end
  end

  # GET /data_to_asks/new
  # GET /data_to_asks/new.xml
  def new
    @data_to_ask = DataToAsk.by_company(current_company.id).new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @data_to_ask }
    end
  end

  # GET /data_to_asks/1/edit
  def edit
  end

  # POST /data_to_asks
  # POST /data_to_asks.xml
  def create
    @data_to_ask = DataToAsk.by_company(current_company.id).new(params[:data_to_ask])

    respond_to do |format|
      if @data_to_ask.save
        format.html { redirect_to(@data_to_ask, :notice => 'Data to ask was successfully created.') }
        format.xml  { render :xml => @data_to_ask, :status => :created, :location => @data_to_ask }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @data_to_ask.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /data_to_asks/1
  # PUT /data_to_asks/1.xml
  def update

    respond_to do |format|
      if @data_to_ask.update_attributes(params[:data_to_ask])
        format.html { redirect_to(@data_to_ask, :notice => 'Data to ask was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @data_to_ask.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /data_to_asks/1
  # DELETE /data_to_asks/1.xml
  def destroy
    @data_to_ask.destroy

    respond_to do |format|
      format.html { redirect_to(data_to_asks_url) }
      format.xml  { head :ok }
    end
  end

  def find_data_to_ask
      @data_to_ask = DataToAsk.by_company(current_company.id).find(params[:id])
   end
end
