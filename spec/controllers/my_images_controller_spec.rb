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

describe MyImagesController do

  # This should return the minimal set of attributes required to create a valid
  # MyImage. As you add validations to MyImage, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all my_images as @my_images" do
      my_image = MyImage.create! valid_attributes
      get :index
      assigns(:my_images).should eq([my_image])
    end
  end

  describe "GET show" do
    it "assigns the requested my_image as @my_image" do
      my_image = MyImage.create! valid_attributes
      get :show, :id => my_image.id.to_s
      assigns(:my_image).should eq(my_image)
    end
  end

  describe "GET new" do
    it "assigns a new my_image as @my_image" do
      get :new
      assigns(:my_image).should be_a_new(MyImage)
    end
  end

  describe "GET edit" do
    it "assigns the requested my_image as @my_image" do
      my_image = MyImage.create! valid_attributes
      get :edit, :id => my_image.id.to_s
      assigns(:my_image).should eq(my_image)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new MyImage" do
        expect {
          post :create, :my_image => valid_attributes
        }.to change(MyImage, :count).by(1)
      end

      it "assigns a newly created my_image as @my_image" do
        post :create, :my_image => valid_attributes
        assigns(:my_image).should be_a(MyImage)
        assigns(:my_image).should be_persisted
      end

      it "redirects to the created my_image" do
        post :create, :my_image => valid_attributes
        response.should redirect_to(MyImage.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved my_image as @my_image" do
        # Trigger the behavior that occurs when invalid params are submitted
        MyImage.any_instance.stub(:save).and_return(false)
        post :create, :my_image => {}
        assigns(:my_image).should be_a_new(MyImage)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        MyImage.any_instance.stub(:save).and_return(false)
        post :create, :my_image => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested my_image" do
        my_image = MyImage.create! valid_attributes
        # Assuming there are no other my_images in the database, this
        # specifies that the MyImage created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        MyImage.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => my_image.id, :my_image => {'these' => 'params'}
      end

      it "assigns the requested my_image as @my_image" do
        my_image = MyImage.create! valid_attributes
        put :update, :id => my_image.id, :my_image => valid_attributes
        assigns(:my_image).should eq(my_image)
      end

      it "redirects to the my_image" do
        my_image = MyImage.create! valid_attributes
        put :update, :id => my_image.id, :my_image => valid_attributes
        response.should redirect_to(my_image)
      end
    end

    describe "with invalid params" do
      it "assigns the my_image as @my_image" do
        my_image = MyImage.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        MyImage.any_instance.stub(:save).and_return(false)
        put :update, :id => my_image.id.to_s, :my_image => {}
        assigns(:my_image).should eq(my_image)
      end

      it "re-renders the 'edit' template" do
        my_image = MyImage.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        MyImage.any_instance.stub(:save).and_return(false)
        put :update, :id => my_image.id.to_s, :my_image => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested my_image" do
      my_image = MyImage.create! valid_attributes
      expect {
        delete :destroy, :id => my_image.id.to_s
      }.to change(MyImage, :count).by(-1)
    end

    it "redirects to the my_images list" do
      my_image = MyImage.create! valid_attributes
      delete :destroy, :id => my_image.id.to_s
      response.should redirect_to(my_images_url)
    end
  end

end
