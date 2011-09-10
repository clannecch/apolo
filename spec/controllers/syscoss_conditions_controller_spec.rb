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

describe SyscossConditionsController do

  # This should return the minimal set of attributes required to create a valid
  # SyscossCondition. As you add validations to SyscossCondition, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all syscoss_conditions as @syscoss_conditions" do
      syscoss_condition = SyscossCondition.create! valid_attributes
      get :index
      assigns(:syscoss_conditions).should eq([syscoss_condition])
    end
  end

  describe "GET show" do
    it "assigns the requested syscoss_condition as @syscoss_condition" do
      syscoss_condition = SyscossCondition.create! valid_attributes
      get :show, :id => syscoss_condition.id.to_s
      assigns(:syscoss_condition).should eq(syscoss_condition)
    end
  end

  describe "GET new" do
    it "assigns a new syscoss_condition as @syscoss_condition" do
      get :new
      assigns(:syscoss_condition).should be_a_new(SyscossCondition)
    end
  end

  describe "GET edit" do
    it "assigns the requested syscoss_condition as @syscoss_condition" do
      syscoss_condition = SyscossCondition.create! valid_attributes
      get :edit, :id => syscoss_condition.id.to_s
      assigns(:syscoss_condition).should eq(syscoss_condition)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new SyscossCondition" do
        expect {
          post :create, :syscoss_condition => valid_attributes
        }.to change(SyscossCondition, :count).by(1)
      end

      it "assigns a newly created syscoss_condition as @syscoss_condition" do
        post :create, :syscoss_condition => valid_attributes
        assigns(:syscoss_condition).should be_a(SyscossCondition)
        assigns(:syscoss_condition).should be_persisted
      end

      it "redirects to the created syscoss_condition" do
        post :create, :syscoss_condition => valid_attributes
        response.should redirect_to(SyscossCondition.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved syscoss_condition as @syscoss_condition" do
        # Trigger the behavior that occurs when invalid params are submitted
        SyscossCondition.any_instance.stub(:save).and_return(false)
        post :create, :syscoss_condition => {}
        assigns(:syscoss_condition).should be_a_new(SyscossCondition)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        SyscossCondition.any_instance.stub(:save).and_return(false)
        post :create, :syscoss_condition => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested syscoss_condition" do
        syscoss_condition = SyscossCondition.create! valid_attributes
        # Assuming there are no other syscoss_conditions in the database, this
        # specifies that the SyscossCondition created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        SyscossCondition.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => syscoss_condition.id, :syscoss_condition => {'these' => 'params'}
      end

      it "assigns the requested syscoss_condition as @syscoss_condition" do
        syscoss_condition = SyscossCondition.create! valid_attributes
        put :update, :id => syscoss_condition.id, :syscoss_condition => valid_attributes
        assigns(:syscoss_condition).should eq(syscoss_condition)
      end

      it "redirects to the syscoss_condition" do
        syscoss_condition = SyscossCondition.create! valid_attributes
        put :update, :id => syscoss_condition.id, :syscoss_condition => valid_attributes
        response.should redirect_to(syscoss_condition)
      end
    end

    describe "with invalid params" do
      it "assigns the syscoss_condition as @syscoss_condition" do
        syscoss_condition = SyscossCondition.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SyscossCondition.any_instance.stub(:save).and_return(false)
        put :update, :id => syscoss_condition.id.to_s, :syscoss_condition => {}
        assigns(:syscoss_condition).should eq(syscoss_condition)
      end

      it "re-renders the 'edit' template" do
        syscoss_condition = SyscossCondition.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SyscossCondition.any_instance.stub(:save).and_return(false)
        put :update, :id => syscoss_condition.id.to_s, :syscoss_condition => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested syscoss_condition" do
      syscoss_condition = SyscossCondition.create! valid_attributes
      expect {
        delete :destroy, :id => syscoss_condition.id.to_s
      }.to change(SyscossCondition, :count).by(-1)
    end

    it "redirects to the syscoss_conditions list" do
      syscoss_condition = SyscossCondition.create! valid_attributes
      delete :destroy, :id => syscoss_condition.id.to_s
      response.should redirect_to(syscoss_conditions_url)
    end
  end

end