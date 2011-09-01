require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe SiscossLocationsController do

  # This should return the minimal set of attributes required to create a valid
  # SiscossLocation. As you add validations to SiscossLocation, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all siscoss_locations as @siscoss_locations" do
      siscoss_location = SiscossLocation.create! valid_attributes
      get :index
      assigns(:siscoss_locations).should eq([siscoss_location])
    end
  end

  describe "GET show" do
    it "assigns the requested siscoss_location as @siscoss_location" do
      siscoss_location = SiscossLocation.create! valid_attributes
      get :show, :id => siscoss_location.id.to_s
      assigns(:siscoss_location).should eq(siscoss_location)
    end
  end

  describe "GET new" do
    it "assigns a new siscoss_location as @siscoss_location" do
      get :new
      assigns(:siscoss_location).should be_a_new(SiscossLocation)
    end
  end

  describe "GET edit" do
    it "assigns the requested siscoss_location as @siscoss_location" do
      siscoss_location = SiscossLocation.create! valid_attributes
      get :edit, :id => siscoss_location.id.to_s
      assigns(:siscoss_location).should eq(siscoss_location)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new SiscossLocation" do
        expect {
          post :create, :siscoss_location => valid_attributes
        }.to change(SiscossLocation, :count).by(1)
      end

      it "assigns a newly created siscoss_location as @siscoss_location" do
        post :create, :siscoss_location => valid_attributes
        assigns(:siscoss_location).should be_a(SiscossLocation)
        assigns(:siscoss_location).should be_persisted
      end

      it "redirects to the created siscoss_location" do
        post :create, :siscoss_location => valid_attributes
        response.should redirect_to(SiscossLocation.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved siscoss_location as @siscoss_location" do
        # Trigger the behavior that occurs when invalid params are submitted
        SiscossLocation.any_instance.stub(:save).and_return(false)
        post :create, :siscoss_location => {}
        assigns(:siscoss_location).should be_a_new(SiscossLocation)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        SiscossLocation.any_instance.stub(:save).and_return(false)
        post :create, :siscoss_location => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested siscoss_location" do
        siscoss_location = SiscossLocation.create! valid_attributes
        # Assuming there are no other siscoss_locations in the database, this
        # specifies that the SiscossLocation created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        SiscossLocation.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => siscoss_location.id, :siscoss_location => {'these' => 'params'}
      end

      it "assigns the requested siscoss_location as @siscoss_location" do
        siscoss_location = SiscossLocation.create! valid_attributes
        put :update, :id => siscoss_location.id, :siscoss_location => valid_attributes
        assigns(:siscoss_location).should eq(siscoss_location)
      end

      it "redirects to the siscoss_location" do
        siscoss_location = SiscossLocation.create! valid_attributes
        put :update, :id => siscoss_location.id, :siscoss_location => valid_attributes
        response.should redirect_to(siscoss_location)
      end
    end

    describe "with invalid params" do
      it "assigns the siscoss_location as @siscoss_location" do
        siscoss_location = SiscossLocation.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SiscossLocation.any_instance.stub(:save).and_return(false)
        put :update, :id => siscoss_location.id.to_s, :siscoss_location => {}
        assigns(:siscoss_location).should eq(siscoss_location)
      end

      it "re-renders the 'edit' template" do
        siscoss_location = SiscossLocation.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SiscossLocation.any_instance.stub(:save).and_return(false)
        put :update, :id => siscoss_location.id.to_s, :siscoss_location => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested siscoss_location" do
      siscoss_location = SiscossLocation.create! valid_attributes
      expect {
        delete :destroy, :id => siscoss_location.id.to_s
      }.to change(SiscossLocation, :count).by(-1)
    end

    it "redirects to the siscoss_locations list" do
      siscoss_location = SiscossLocation.create! valid_attributes
      delete :destroy, :id => siscoss_location.id.to_s
      response.should redirect_to(siscoss_locations_url)
    end
  end

end
