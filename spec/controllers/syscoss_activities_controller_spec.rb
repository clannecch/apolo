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

describe SyscossActivitiesController do

  # This should return the minimal set of attributes required to create a valid
  # SyscossActivity. As you add validations to SyscossActivity, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all syscoss_activities as @syscoss_activities" do
      syscoss_activity = SyscossActivity.create! valid_attributes
      get :index
      assigns(:syscoss_activities).should eq([syscoss_activity])
    end
  end

  describe "GET show" do
    it "assigns the requested syscoss_activity as @syscoss_activity" do
      syscoss_activity = SyscossActivity.create! valid_attributes
      get :show, :id => syscoss_activity.id.to_s
      assigns(:syscoss_activity).should eq(syscoss_activity)
    end
  end

  describe "GET new" do
    it "assigns a new syscoss_activity as @syscoss_activity" do
      get :new
      assigns(:syscoss_activity).should be_a_new(SyscossActivity)
    end
  end

  describe "GET edit" do
    it "assigns the requested syscoss_activity as @syscoss_activity" do
      syscoss_activity = SyscossActivity.create! valid_attributes
      get :edit, :id => syscoss_activity.id.to_s
      assigns(:syscoss_activity).should eq(syscoss_activity)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new SyscossActivity" do
        expect {
          post :create, :syscoss_activity => valid_attributes
        }.to change(SyscossActivity, :count).by(1)
      end

      it "assigns a newly created syscoss_activity as @syscoss_activity" do
        post :create, :syscoss_activity => valid_attributes
        assigns(:syscoss_activity).should be_a(SyscossActivity)
        assigns(:syscoss_activity).should be_persisted
      end

      it "redirects to the created syscoss_activity" do
        post :create, :syscoss_activity => valid_attributes
        response.should redirect_to(SyscossActivity.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved syscoss_activity as @syscoss_activity" do
        # Trigger the behavior that occurs when invalid params are submitted
        SyscossActivity.any_instance.stub(:save).and_return(false)
        post :create, :syscoss_activity => {}
        assigns(:syscoss_activity).should be_a_new(SyscossActivity)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        SyscossActivity.any_instance.stub(:save).and_return(false)
        post :create, :syscoss_activity => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested syscoss_activity" do
        syscoss_activity = SyscossActivity.create! valid_attributes
        # Assuming there are no other syscoss_activities in the database, this
        # specifies that the SyscossActivity created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        SyscossActivity.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => syscoss_activity.id, :syscoss_activity => {'these' => 'params'}
      end

      it "assigns the requested syscoss_activity as @syscoss_activity" do
        syscoss_activity = SyscossActivity.create! valid_attributes
        put :update, :id => syscoss_activity.id, :syscoss_activity => valid_attributes
        assigns(:syscoss_activity).should eq(syscoss_activity)
      end

      it "redirects to the syscoss_activity" do
        syscoss_activity = SyscossActivity.create! valid_attributes
        put :update, :id => syscoss_activity.id, :syscoss_activity => valid_attributes
        response.should redirect_to(syscoss_activity)
      end
    end

    describe "with invalid params" do
      it "assigns the syscoss_activity as @syscoss_activity" do
        syscoss_activity = SyscossActivity.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SyscossActivity.any_instance.stub(:save).and_return(false)
        put :update, :id => syscoss_activity.id.to_s, :syscoss_activity => {}
        assigns(:syscoss_activity).should eq(syscoss_activity)
      end

      it "re-renders the 'edit' template" do
        syscoss_activity = SyscossActivity.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SyscossActivity.any_instance.stub(:save).and_return(false)
        put :update, :id => syscoss_activity.id.to_s, :syscoss_activity => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested syscoss_activity" do
      syscoss_activity = SyscossActivity.create! valid_attributes
      expect {
        delete :destroy, :id => syscoss_activity.id.to_s
      }.to change(SyscossActivity, :count).by(-1)
    end

    it "redirects to the syscoss_activities list" do
      syscoss_activity = SyscossActivity.create! valid_attributes
      delete :destroy, :id => syscoss_activity.id.to_s
      response.should redirect_to(syscoss_activities_url)
    end
  end

end
