require 'spec_helper'

describe ContratosController do
  login_admin
  let!(:contrato) { FactoryGirl.create(:contrato) }

  context "GET index" do
    it "assigns all contrato as @contrato" do
      get :index
      assigns(:contratos).should include(contrato)
    end

    it "renders the index view" do
      get :index
      response.should render_template :index
    end

  end

  context "GET show" do
    it "assigns the requested contrato as @contrato" do
      get :show, id: contrato.to_param 
      assigns(:contrato).should eq(contrato)
    end

    it "renders the show view" do
      get :show, id: contrato.to_param 
      response.should render_template :show
    end

  end

  context "GET new" do
    it "assigns a new contrato as @contrato" do
      get :new
      assigns(:contrato).should be_a_new(Contrato)
    end

    it "renders the new view" do
      get :new
      response.should render_template :new
    end

  end

  context "GET edit" do
    it "assigns the requested contrato as @contrato" do
      get :edit, id: contrato.to_param 
      assigns(:contrato).should eq(contrato)
    end

    it "renders the edit view" do
      get :edit, id: contrato.to_param 
      response.should render_template :edit
    end

  end

  context "POST create" do
    context "with valid params" do
      it "assigns a newly created contrato as @contrato" do
        post :create, contrato: FactoryGirl.attributes_for(:contrato)  
        assigns(:contrato).should be_a(Contrato)
        assigns(:contrato).should be_persisted
      end

      it "redirects to the created contrato" do
        post :create, contrato: FactoryGirl.attributes_for(:contrato)
        response.code.should eq("302")
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved contrato as @contrato" do
        Contrato.any_instance.stub(:save).and_return(false)
        post :create, contrato: FactoryGirl.attributes_for(:contrato_invalid)
        flash[:notice].should eq(nil)
        assigns(:contrato).should be_a_new(Contrato)
      end

      it "redirect after operation" do
        Contrato.any_instance.stub(:save).and_return(false)
        post :create, contrato: FactoryGirl.attributes_for(:contrato_invalid)
        flash[:notice].should eq(nil)
        response.code.should eq("302")
      end
    end

  end

  context "PUT update" do
    context "with valid params" do
      it "updates the requested contrato" do
        Contrato.any_instance.should_receive(:update_attributes)
        put :update, id: contrato.to_param, contrato: FactoryGirl.attributes_for(:contrato)
     end

      it "assigns the requested contrato as @contrato" do
        put :update, id: contrato.to_param, contrato: FactoryGirl.attributes_for(:contrato)
        flash[:notice].should eq('contrato was successfully updated.')
        assigns(:contrato).should eq(contrato)
      end

      it "redirects to the contrato" do
        put :update, id: contrato.to_param, contrato: FactoryGirl.attributes_for(:contrato)
        flash[:notice].should eq('contrato was successfully updated.')
        response.should redirect_to(contrato)
      end
    end

    context "with invalid params" do
      it "assigns the contrato as @contrato" do
        Contrato.any_instance.stub(:save).and_return(false)
        put :update, id: contrato.to_param, contrato: FactoryGirl.attributes_for(:contrato_invalid)
        assigns(:contrato).should eq(contrato)
        flash[:notice].should eq(nil)
      end

      it "re-renders the 'edit' template" do
        Contrato.any_instance.stub(:save).and_return(false)
        put :update, id: contrato.to_param, contrato: FactoryGirl.attributes_for(:contrato_invalid)
        flash[:notice].should eq(nil)
        response.code.should eq("302")
      end
    end
  end

  context "DELETE destroy" do
    it "destroys the requested contrato" do
      expect {
        delete :destroy, id: contrato.to_param 
      }.to change(Contrato, :count).by(-1)
    end

    it "redirects to the contrato list" do
      delete :destroy, id: contrato.to_param 
      flash[:notice].should eq('Contrato was successfully destroyed.')
      response.should redirect_to(contratos_url)
    end
  end

  it "Call get_contrato(id)" do
    subject.send(:get_contrato, contrato.id).should eq(contrato)
  end

end
