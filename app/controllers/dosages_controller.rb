class DosagesController < ApplicationController
  before_filter(:get_drug)

  private
  def get_drug
    @drug = Drug.find(params[:drug_id])
  end
  
  public
  # GET /dosages
  # GET /dosages.xml
  def index
    @dosages = @drug.dosages

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @dosages }
    end
  end

  # GET /dosages/1
  # GET /dosages/1.xml
  def show
    @dosage = Dosage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @dosage }
    end
  end

  # GET /dosages/new
  # GET /dosages/new.xml
  def new
    @dosage = Dosage.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @dosage }
    end
  end

  # GET /dosages/1/edit
  def edit
    @dosage = Dosage.find(params[:id])
  end

  # POST /dosages
  # POST /dosages.xml
  def create
    @dosage = Dosage.new(params[:dosage])

    respond_to do |format|
      if @dosage.save
        format.html { redirect_to(@dosage, :notice => 'Dosage was successfully created.') }
        format.xml  { render :xml => @dosage, :status => :created, :location => @dosage }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @dosage.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /dosages/1
  # PUT /dosages/1.xml
  def update
    @dosage = Dosage.find(params[:id])

    respond_to do |format|
      if @dosage.update_attributes(params[:dosage])
        format.html { redirect_to(@dosage, :notice => 'Dosage was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @dosage.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /dosages/1
  # DELETE /dosages/1.xml
  def destroy
    @dosage = Dosage.find(params[:id])
    @dosage.destroy

    respond_to do |format|
      format.html { redirect_to(dosages_url) }
      format.xml  { head :ok }
    end
  end
end
