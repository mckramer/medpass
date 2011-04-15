class DrugsController < ApplicationController
  # GET /drugs
  # GET /drugs.xml
  def index
    @drugs = Drug.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @drugs }
    end
  end

  # GET /drugs/1
  # GET /drugs/1.xml
  def show
    @drug = Drug.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @drug }
    end
  end

  # GET /drugs/new
  # GET /drugs/new.xml
  def new
    @drug = Drug.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @drug }
    end
  end

  # GET /drugs/1/edit
  def edit
    @drug = Drug.find(params[:id])
  end

  # POST /drugs
  # POST /drugs.xml
  def create
    @drug = Drug.new(params[:drug])

    respond_to do |format|
      if @drug.save
        format.html { redirect_to(@drug, :notice => 'Drug was successfully created.') }
        format.xml  { render :xml => @drug, :status => :created, :location => @drug }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @drug.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /drugs/1
  # PUT /drugs/1.xml
  def update
    @drug = Drug.find(params[:id])

    respond_to do |format|
      if @drug.update_attributes(params[:drug])
        format.html { redirect_to(@drug, :notice => 'Drug was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @drug.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /drugs/1
  # DELETE /drugs/1.xml
  def destroy
    @drug = Drug.find(params[:id])
    @drug.destroy

    respond_to do |format|
      format.html { redirect_to(drugs_url) }
      format.xml  { head :ok }
    end
  end
end
