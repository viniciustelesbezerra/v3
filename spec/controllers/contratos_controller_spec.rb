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

describe ContratosController do

  # This should return the minimal set of attributes required to create a valid
  # Contrato. As you add validations to Contrato, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "numero" => "1" }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ContratosController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all contratos as @contratos" do
      contrato = Contrato.create! valid_attributes
      get :index, {}, valid_session
      assigns(:contratos).should eq([contrato])
    end
  end

  describe "GET show" do
    it "assigns the requested contrato as @contrato" do
      contrato = Contrato.create! valid_attributes
      get :show, {:id => contrato.to_param}, valid_session
      assigns(:contrato).should eq(contrato)
    end
  end

  describe "GET new" do
    it "assigns a new contrato as @contrato" do
      get :new, {}, valid_session
      assigns(:contrato).should be_a_new(Contrato)
    end
  end

  describe "GET edit" do
    it "assigns the requested contrato as @contrato" do
      contrato = Contrato.create! valid_attributes
      get :edit, {:id => contrato.to_param}, valid_session
      assigns(:contrato).should eq(contrato)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Contrato" do
        expect {
          post :create, {:contrato => valid_attributes}, valid_session
        }.to change(Contrato, :count).by(1)
      end

      it "assigns a newly created contrato as @contrato" do
        post :create, {:contrato => valid_attributes}, valid_session
        assigns(:contrato).should be_a(Contrato)
        assigns(:contrato).should be_persisted
      end

      it "redirects to the created contrato" do
        post :create, {:contrato => valid_attributes}, valid_session
        response.should redirect_to(Contrato.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved contrato as @contrato" do
        # Trigger the behavior that occurs when invalid params are submitted
        Contrato.any_instance.stub(:save).and_return(false)
        post :create, {:contrato => { "numero" => "invalid value" }}, valid_session
        assigns(:contrato).should be_a_new(Contrato)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Contrato.any_instance.stub(:save).and_return(false)
        post :create, {:contrato => { "numero" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested contrato" do
        contrato = Contrato.create! valid_attributes
        # Assuming there are no other contratos in the database, this
        # specifies that the Contrato created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Contrato.any_instance.should_receive(:update_attributes).with({ "numero" => "1" })
        put :update, {:id => contrato.to_param, :contrato => { "numero" => "1" }}, valid_session
      end

      it "assigns the requested contrato as @contrato" do
        contrato = Contrato.create! valid_attributes
        put :update, {:id => contrato.to_param, :contrato => valid_attributes}, valid_session
        assigns(:contrato).should eq(contrato)
      end

      it "redirects to the contrato" do
        contrato = Contrato.create! valid_attributes
        put :update, {:id => contrato.to_param, :contrato => valid_attributes}, valid_session
        response.should redirect_to(contrato)
      end
    end

    describe "with invalid params" do
      it "assigns the contrato as @contrato" do
        contrato = Contrato.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Contrato.any_instance.stub(:save).and_return(false)
        put :update, {:id => contrato.to_param, :contrato => { "numero" => "invalid value" }}, valid_session
        assigns(:contrato).should eq(contrato)
      end

      it "re-renders the 'edit' template" do
        contrato = Contrato.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Contrato.any_instance.stub(:save).and_return(false)
        put :update, {:id => contrato.to_param, :contrato => { "numero" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested contrato" do
      contrato = Contrato.create! valid_attributes
      expect {
        delete :destroy, {:id => contrato.to_param}, valid_session
      }.to change(Contrato, :count).by(-1)
    end

    it "redirects to the contratos list" do
      contrato = Contrato.create! valid_attributes
      delete :destroy, {:id => contrato.to_param}, valid_session
      response.should redirect_to(contratos_url)
    end
  end

end
