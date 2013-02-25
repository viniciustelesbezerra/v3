require 'spec_helper'

describe ArquivosController do
  login_admin
  let!(:arquivo) { Arquivo.first }

  context "GET index" do
    it "assigns all arquivos as @arquivos" do
      get :index
      assigns(:arquivos).should include(arquivo)
    end

    it "renders the index view" do
      get :index
      response.should render_template :index
    end

  end

  context "GET show" do
    it "assigns the requested arquivo as @arquivo" do
      get :show, id: arquivo.to_param 
      assigns(:arquivo).should eq(arquivo)
    end

    it "renders the show view" do
      get :show, id: arquivo.to_param 
      response.should render_template :show
    end

  end

  context "GET new" do
    it "assigns a new arquivo as @arquivo" do
      get :new
      assigns(:arquivo).should be_a_new(Arquivo)
    end

    it "renders the new view" do
      get :new
      response.should render_template :new
    end

  end

  context "GET edit" do
    it "assigns the requested arquivo as @arquivo" do
      get :edit, id: arquivo.to_param 
      assigns(:arquivo).should eq(arquivo)
    end

    it "renders the edit view" do
      get :edit, id: arquivo.to_param 
      response.should render_template :edit
    end

  end

  context "POST create" do
    context "with valid params" do
      it "assigns a newly created arquivo as @arquivo" do
        post :create, arquivo: FactoryGirl.attributes_for(:arquivo)  
        #flash[:notice].should eq('Arquivo was successfully created.')
        assigns(:arquivo).should be_a(Arquivo)
      end

      it "redirects to the created arquivo" do
        post :create, arquivo: FactoryGirl.attributes_for(:arquivo)
        #flash[:notice].should eq('Arquivo was successfully created.')
        response.code.should eq("200")
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved arquivo as @arquivo" do
        Arquivo.any_instance.stub(:save).and_return(false)
        post :create, arquivo: FactoryGirl.attributes_for(:arquivo_invalid)
        flash[:notice].should eq(nil)
        assigns(:arquivo).should be_a_new(Arquivo)
      end

      it "redirect after operation" do
        Arquivo.any_instance.stub(:save).and_return(false)
        post :create, arquivo: FactoryGirl.attributes_for(:arquivo_invalid)
        flash[:notice].should eq(nil)
        response.code.should eq("302")
      end
    end

  end

  context "PUT update" do
    context "with valid params" do
      it "updates the requested arquivo" do
        Arquivo.any_instance.should_receive(:update_attributes)
        put :update, id: arquivo.to_param, arquivo: FactoryGirl.attributes_for(:arquivo)
     end

      it "assigns the requested arquivo as @arquivo" do
        put :update, id: arquivo.to_param, arquivo: FactoryGirl.attributes_for(:arquivo)
        flash[:notice].should eq('Arquivo was successfully updated.')
        assigns(:arquivo).should eq(arquivo)
      end

      it "redirects to the arquivo" do
        put :update, id: arquivo.to_param, arquivo: FactoryGirl.attributes_for(:arquivo)
        flash[:notice].should eq('Arquivo was successfully updated.')
        response.should redirect_to(arquivo)
      end
    end

    context "with invalid params" do
      it "assigns the arquivo as @arquivo" do
        Arquivo.any_instance.stub(:save).and_return(false)
        put :update, id: arquivo.to_param, arquivo: FactoryGirl.attributes_for(:arquivo_invalid)
        assigns(:arquivo).should eq(arquivo)
        flash[:notice].should eq(nil)
      end

      it "re-renders the 'edit' template" do
        Arquivo.any_instance.stub(:save).and_return(false)
        put :update, id: arquivo.to_param, arquivo: FactoryGirl.attributes_for(:arquivo_invalid)
        flash[:notice].should eq(nil)
        response.code.should eq("302")
      end
    end
  end

  context "DELETE destroy" do
    it "destroys the requested arquivo" do
      expect {
        delete :destroy, id: arquivo.to_param 
      }.to change(Arquivo, :count).by(-1)
    end

    it "redirects to the arquivos list" do
      delete :destroy, id: arquivo.to_param 
      flash[:notice].should eq('Arquivo was successfully destroyed.')
      response.should redirect_to(arquivos_url)
    end
  end

  it "Call get_arquivo(id)" do
    subject.send(:get_arquivo, arquivo.id).should eq(arquivo)
  end

end
