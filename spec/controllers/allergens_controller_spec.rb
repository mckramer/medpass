require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by the Rails when you ran the scaffold generator.

describe AllergensController do

  def mock_allergen(stubs={})
    @mock_allergen ||= mock_model(Allergen, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all allergens as @allergens" do
      Allergen.stub(:all) { [mock_allergen] }
      get :index
      assigns(:allergens).should eq([mock_allergen])
    end
  end

  describe "GET show" do
    it "assigns the requested allergen as @allergen" do
      Allergen.stub(:find).with("37") { mock_allergen }
      get :show, :id => "37"
      assigns(:allergen).should be(mock_allergen)
    end
  end

  describe "GET new" do
    it "assigns a new allergen as @allergen" do
      Allergen.stub(:new) { mock_allergen }
      get :new
      assigns(:allergen).should be(mock_allergen)
    end
  end

  describe "GET edit" do
    it "assigns the requested allergen as @allergen" do
      Allergen.stub(:find).with("37") { mock_allergen }
      get :edit, :id => "37"
      assigns(:allergen).should be(mock_allergen)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created allergen as @allergen" do
        Allergen.stub(:new).with({'these' => 'params'}) { mock_allergen(:save => true) }
        post :create, :allergen => {'these' => 'params'}
        assigns(:allergen).should be(mock_allergen)
      end

      it "redirects to the created allergen" do
        Allergen.stub(:new) { mock_allergen(:save => true) }
        post :create, :allergen => {}
        response.should redirect_to(allergen_url(mock_allergen))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved allergen as @allergen" do
        Allergen.stub(:new).with({'these' => 'params'}) { mock_allergen(:save => false) }
        post :create, :allergen => {'these' => 'params'}
        assigns(:allergen).should be(mock_allergen)
      end

      it "re-renders the 'new' template" do
        Allergen.stub(:new) { mock_allergen(:save => false) }
        post :create, :allergen => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested allergen" do
        Allergen.stub(:find).with("37") { mock_allergen }
        mock_allergen.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :allergen => {'these' => 'params'}
      end

      it "assigns the requested allergen as @allergen" do
        Allergen.stub(:find) { mock_allergen(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:allergen).should be(mock_allergen)
      end

      it "redirects to the allergen" do
        Allergen.stub(:find) { mock_allergen(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(allergen_url(mock_allergen))
      end
    end

    describe "with invalid params" do
      it "assigns the allergen as @allergen" do
        Allergen.stub(:find) { mock_allergen(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:allergen).should be(mock_allergen)
      end

      it "re-renders the 'edit' template" do
        Allergen.stub(:find) { mock_allergen(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested allergen" do
      Allergen.stub(:find).with("37") { mock_allergen }
      mock_allergen.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the allergens list" do
      Allergen.stub(:find) { mock_allergen }
      delete :destroy, :id => "1"
      response.should redirect_to(allergens_url)
    end
  end

end
