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

describe SyscossReductionZonesController do

  # This should return the minimal set of attributes required to create a valid
  # SyscossReductionZone. As you add validations to SyscossReductionZone, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all syscoss_reduction_zones as @syscoss_reduction_zones" do
      syscoss_reduction_zone = SyscossReductionZone.create! valid_attributes
      get :index
      assigns(:syscoss_reduction_zones).should eq([syscoss_reduction_zone])
    end
  end

  describe "GET show" do
    it "assigns the requested syscoss_reduction_zone as @syscoss_reduction_zone" do
      syscoss_reduction_zone = SyscossReductionZone.create! valid_attributes
      get :show, :id => syscoss_reduction_zone.id.to_s
      assigns(:syscoss_reduction_zone).should eq(syscoss_reduction_zone)
    end
  end

  describe "GET new" do
    it "assigns a new syscoss_reduction_zone as @syscoss_reduction_zone" do
      get :new
      assigns(:syscoss_reduction_zone).should be_a_new(SyscossReductionZone)
    end
  end

  describe "GET edit" do
    it "assigns the requested syscoss_reduction_zone as @syscoss_reduction_zone" do
      syscoss_reduction_zone = SyscossReductionZone.create! valid_attributes
      get :edit, :id => syscoss_reduction_zone.id.to_s
      assigns(:syscoss_reduction_zone).should eq(syscoss_reduction_zone)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new SyscossReductionZone" do
        expect {
          post :create, :syscoss_reduction_zone => valid_attributes
        }.to change(SyscossReductionZone, :count).by(1)
      end

      it "assigns a newly created syscoss_reduction_zone as @syscoss_reduction_zone" do
        post :create, :syscoss_reduction_zone => valid_attributes
        assigns(:syscoss_reduction_zone).should be_a(SyscossReductionZone)
        assigns(:syscoss_reduction_zone).should be_persisted
      end

      it "redirects to the created syscoss_reduction_zone" do
        post :create, :syscoss_reduction_zone => valid_attributes
        response.should redirect_to(SyscossReductionZone.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved syscoss_reduction_zone as @syscoss_reduction_zone" do
        # Trigger the behavior that occurs when invalid params are submitted
        SyscossReductionZone.any_instance.stub(:save).and_return(false)
        post :create, :syscoss_reduction_zone => {}
        assigns(:syscoss_reduction_zone).should be_a_new(SyscossReductionZone)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        SyscossReductionZone.any_instance.stub(:save).and_return(false)
        post :create, :syscoss_reduction_zone => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested syscoss_reduction_zone" do
        syscoss_reduction_zone = SyscossReductionZone.create! valid_attributes
        # Assuming there are no other syscoss_reduction_zones in the database, this
        # specifies that the SyscossReductionZone created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        SyscossReductionZone.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => syscoss_reduction_zone.id, :syscoss_reduction_zone => {'these' => 'params'}
      end

      it "assigns the requested syscoss_reduction_zone as @syscoss_reduction_zone" do
        syscoss_reduction_zone = SyscossReductionZone.create! valid_attributes
        put :update, :id => syscoss_reduction_zone.id, :syscoss_reduction_zone => valid_attributes
        assigns(:syscoss_reduction_zone).should eq(syscoss_reduction_zone)
      end

      it "redirects to the syscoss_reduction_zone" do
        syscoss_reduction_zone = SyscossReductionZone.create! valid_attributes
        put :update, :id => syscoss_reduction_zone.id, :syscoss_reduction_zone => valid_attributes
        response.should redirect_to(syscoss_reduction_zone)
      end
    end

    describe "with invalid params" do
      it "assigns the syscoss_reduction_zone as @syscoss_reduction_zone" do
        syscoss_reduction_zone = SyscossReductionZone.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SyscossReductionZone.any_instance.stub(:save).and_return(false)
        put :update, :id => syscoss_reduction_zone.id.to_s, :syscoss_reduction_zone => {}
        assigns(:syscoss_reduction_zone).should eq(syscoss_reduction_zone)
      end

      it "re-renders the 'edit' template" do
        syscoss_reduction_zone = SyscossReductionZone.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SyscossReductionZone.any_instance.stub(:save).and_return(false)
        put :update, :id => syscoss_reduction_zone.id.to_s, :syscoss_reduction_zone => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested syscoss_reduction_zone" do
      syscoss_reduction_zone = SyscossReductionZone.create! valid_attributes
      expect {
        delete :destroy, :id => syscoss_reduction_zone.id.to_s
      }.to change(SyscossReductionZone, :count).by(-1)
    end

    it "redirects to the syscoss_reduction_zones list" do
      syscoss_reduction_zone = SyscossReductionZone.create! valid_attributes
      delete :destroy, :id => syscoss_reduction_zone.id.to_s
      response.should redirect_to(syscoss_reduction_zones_url)
    end
  end

end
