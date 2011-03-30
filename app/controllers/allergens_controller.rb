class AllergensController < ApplicationController
  # GET /allergens
  # GET /allergens.xml
  def index
    @allergens = Allergen.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @allergens }
    end
  end

  # GET /allergens/1
  # GET /allergens/1.xml
  def show
    @allergen = Allergen.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @allergen }
    end
  end

  # GET /allergens/new
  # GET /allergens/new.xml
  def new
    @allergen = Allergen.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @allergen }
    end
  end

  # GET /allergens/1/edit
  def edit
    @allergen = Allergen.find(params[:id])
  end

  # POST /allergens
  # POST /allergens.xml
  def create
    @allergen = Allergen.new(params[:allergen])

    respond_to do |format|
      if @allergen.save
        format.html { redirect_to(@allergen, :notice => 'Allergen was successfully created.') }
        format.xml  { render :xml => @allergen, :status => :created, :location => @allergen }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @allergen.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /allergens/1
  # PUT /allergens/1.xml
  def update
    @allergen = Allergen.find(params[:id])

    respond_to do |format|
      if @allergen.update_attributes(params[:allergen])
        format.html { redirect_to(@allergen, :notice => 'Allergen was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @allergen.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /allergens/1
  # DELETE /allergens/1.xml
  def destroy
    @allergen = Allergen.find(params[:id])
    @allergen.destroy

    respond_to do |format|
      format.html { redirect_to(allergens_url) }
      format.xml  { head :ok }
    end
  end
end
