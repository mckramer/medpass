class IndicationsController < ApplicationController
  # GET /indications
  # GET /indications.xml
  def index
    @indications = Indication.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @indications }
    end
  end

  # GET /indications/1
  # GET /indications/1.xml
  def show
    @indication = Indication.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @indication }
    end
  end

  # GET /indications/new
  # GET /indications/new.xml
  def new
    @indication = Indication.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @indication }
    end
  end

  # GET /indications/1/edit
  def edit
    @indication = Indication.find(params[:id])
  end

  # POST /indications
  # POST /indications.xml
  def create
    @indication = Indication.new(params[:indication])

    respond_to do |format|
      if @indication.save
        format.html { redirect_to(@indication, :notice => 'Indication was successfully created.') }
        format.xml  { render :xml => @indication, :status => :created, :location => @indication }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @indication.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /indications/1
  # PUT /indications/1.xml
  def update
    @indication = Indication.find(params[:id])

    respond_to do |format|
      if @indication.update_attributes(params[:indication])
        format.html { redirect_to(@indication, :notice => 'Indication was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @indication.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /indications/1
  # DELETE /indications/1.xml
  def destroy
    @indication = Indication.find(params[:id])
    @indication.destroy

    respond_to do |format|
      format.html { redirect_to(indications_url) }
      format.xml  { head :ok }
    end
  end
end
