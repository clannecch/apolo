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

describe EmployerTypesController do

  # This should return the minimal set of attributes required to create a valid
  # EmployerType. As you add validations to EmployerType, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all employer_types as @employer_types" do
      employer_type = EmployerType.create! valid_attributes
      get :index
      assigns(:employer_types).should eq([employer_type])
    end
  end

  describe "GET show" do
    it "assigns the requested employer_type as @employer_type" do
      employer_type = EmployerType.create! valid_attributes
      get :show, :id => employer_type.id.to_s
      assigns(:employer_type).should eq(employer_type)
    end
  end

  describe "GET new" do
    it "assigns a new employer_type as @employer_type" do
      get :new
      assigns(:employer_type).should be_a_new(EmployerType)
    end
  end

  describe "GET edit" do
    it "assigns the requested employer_type as @employer_type" do
      employer_type = EmployerType.create! valid_attributes
      get :edit, :id => employer_type.id.to_s
      assigns(:employer_type).should eq(employer_type)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new EmployerType" do
        expect {
          post :create, :employer_type => valid_attributes
        }.to change(EmployerType, :count).by(1)
      end

      it "assigns a newly created employer_type as @employer_type" do
        post :create, :employer_type => valid_attributes
        assigns(:employer_type).should be_a(EmployerType)
        assigns(:employer_type).should be_persisted
      end

      it "redirects to the created employer_type" do
        post :create, :employer_type => valid_attributes
        response.should redirect_to(EmployerType.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved employer_type as @employer_type" do
        # Trigger the behavior that occurs when invalid params are submitted
        EmployerType.any_instance.stub(:save).and_return(false)
        post :create, :employer_type => {}
        assigns(:employer_type).should be_a_new(EmployerType)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        EmployerType.any_instance.stub(:save).and_return(false)
        post :create, :employer_type => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested employer_type" do
        employer_type = EmployerType.create! valid_attributes
        # Assuming there are no other employer_types in the database, this
        # specifies that the EmployerType created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        EmployerType.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => employer_type.id, :employer_type => {'these' => 'params'}
      end

      it "assigns the requested employer_type as @employer_type" do
        employer_type = EmployerType.create! valid_attributes
        put :update, :id => employer_type.id, :employer_type => valid_attributes
        assigns(:employer_type).should eq(employer_type)
      end

      it "redirects to the employer_type" do
        employer_type = EmployerType.create! valid_attributes
        put :update, :id => employer_type.id, :employer_type => valid_attributes
        response.should redirect_to(employer_type)
      end
    end

    describe "with invalid params" do
      it "assigns the employer_type as @employer_type" do
        employer_type = EmployerType.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        EmployerType.any_instance.stub(:save).and_return(false)
        put :update, :id => employer_type.id.to_s, :employer_type => {}
        assigns(:employer_type).should eq(employer_type)
      end

      it "re-renders the 'edit' template" do
        employer_type = EmployerType.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        EmployerType.any_instance.stub(:save).and_return(false)
        put :update, :id => employer_type.id.to_s, :employer_type => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested employer_type" do
      employer_type = EmployerType.create! valid_attributes
      expect {
        delete :destroy, :id => employer_type.id.to_s
      }.to change(EmployerType, :count).by(-1)
    end

    it "redirects to the employer_types list" do
      employer_type = EmployerType.create! valid_attributes
      delete :destroy, :id => employer_type.id.to_s
      response.should redirect_to(employer_types_url)
    end
  end

end