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

describe ArquivosController do

  # This should return the minimal set of attributes required to create a valid
  # Arquivo. As you add validations to Arquivo, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "tipo" => "MyString" }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ArquivosController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all arquivos as @arquivos" do
      arquivo = Arquivo.create! valid_attributes
      get :index, {}, valid_session
      assigns(:arquivos).should eq([arquivo])
    end
  end

  describe "GET show" do
    it "assigns the requested arquivo as @arquivo" do
      arquivo = Arquivo.create! valid_attributes
      get :show, {:id => arquivo.to_param}, valid_session
      assigns(:arquivo).should eq(arquivo)
    end
  end

  describe "GET new" do
    it "assigns a new arquivo as @arquivo" do
      get :new, {}, valid_session
      assigns(:arquivo).should be_a_new(Arquivo)
    end
  end

  describe "GET edit" do
    it "assigns the requested arquivo as @arquivo" do
      arquivo = Arquivo.create! valid_attributes
      get :edit, {:id => arquivo.to_param}, valid_session
      assigns(:arquivo).should eq(arquivo)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Arquivo" do
        expect {
          post :create, {:arquivo => valid_attributes}, valid_session
        }.to change(Arquivo, :count).by(1)
      end

      it "assigns a newly created arquivo as @arquivo" do
        post :create, {:arquivo => valid_attributes}, valid_session
        assigns(:arquivo).should be_a(Arquivo)
        assigns(:arquivo).should be_persisted
      end

      it "redirects to the created arquivo" do
        post :create, {:arquivo => valid_attributes}, valid_session
        response.should redirect_to(Arquivo.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved arquivo as @arquivo" do
        # Trigger the behavior that occurs when invalid params are submitted
        Arquivo.any_instance.stub(:save).and_return(false)
        post :create, {:arquivo => { "tipo" => "invalid value" }}, valid_session
        assigns(:arquivo).should be_a_new(Arquivo)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Arquivo.any_instance.stub(:save).and_return(false)
        post :create, {:arquivo => { "tipo" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested arquivo" do
        arquivo = Arquivo.create! valid_attributes
        # Assuming there are no other arquivos in the database, this
        # specifies that the Arquivo created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Arquivo.any_instance.should_receive(:update_attributes).with({ "tipo" => "MyString" })
        put :update, {:id => arquivo.to_param, :arquivo => { "tipo" => "MyString" }}, valid_session
      end

      it "assigns the requested arquivo as @arquivo" do
        arquivo = Arquivo.create! valid_attributes
        put :update, {:id => arquivo.to_param, :arquivo => valid_attributes}, valid_session
        assigns(:arquivo).should eq(arquivo)
      end

      it "redirects to the arquivo" do
        arquivo = Arquivo.create! valid_attributes
        put :update, {:id => arquivo.to_param, :arquivo => valid_attributes}, valid_session
        response.should redirect_to(arquivo)
      end
    end

    describe "with invalid params" do
      it "assigns the arquivo as @arquivo" do
        arquivo = Arquivo.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Arquivo.any_instance.stub(:save).and_return(false)
        put :update, {:id => arquivo.to_param, :arquivo => { "tipo" => "invalid value" }}, valid_session
        assigns(:arquivo).should eq(arquivo)
      end

      it "re-renders the 'edit' template" do
        arquivo = Arquivo.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Arquivo.any_instance.stub(:save).and_return(false)
        put :update, {:id => arquivo.to_param, :arquivo => { "tipo" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested arquivo" do
      arquivo = Arquivo.create! valid_attributes
      expect {
        delete :destroy, {:id => arquivo.to_param}, valid_session
      }.to change(Arquivo, :count).by(-1)
    end

    it "redirects to the arquivos list" do
      arquivo = Arquivo.create! valid_attributes
      delete :destroy, {:id => arquivo.to_param}, valid_session
      response.should redirect_to(arquivos_url)
    end
  end

end