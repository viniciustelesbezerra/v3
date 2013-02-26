require 'spec_helper'

describe LpusController do
  login_admin
  let!(:lpu) { FactoryGirl.create(:lpu) }

  context "GET index" do
    it "assigns all lpu as @lpu" do
      get :index
      assigns(:lpus).should include(lpu)
    end

    it "renders the index view" do
      get :index
      response.should render_template :index
    end

  end

  context "GET show" do
    it "assigns the requested lpu as @lpu" do
      get :show, id: lpu.to_param 
      assigns(:lpu).should eq(lpu)
    end

    it "renders the show view" do
      get :show, id: lpu.to_param 
      response.should render_template :show
    end

  end

  context "GET new" do
    it "assigns a new lpu as @lpu" do
      get :new
      assigns(:lpu).should be_a_new(Lpu)
    end

    it "renders the new view" do
      get :new
      response.should render_template :new
    end

  end

  context "GET edit" do
    it "assigns the requested lpu as @lpu" do
      get :edit, id: lpu.to_param 
      assigns(:lpu).should eq(lpu)
    end

    it "renders the edit view" do
      get :edit, id: lpu.to_param 
      response.should render_template :edit
    end

  end

  context "POST create" do
    context "with valid params" do
      it "assigns a newly created lpu as @lpu" do
        post :create, lpu: FactoryGirl.attributes_for(:lpu)  
        assigns(:lpu).should be_a(Lpu)
        assigns(:lpu).should be_persisted
      end

      it "redirects to the created lpu" do
        post :create, lpu: FactoryGirl.attributes_for(:lpu)
        response.code.should eq("302")
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved lpu as @lpu" do
        Lpu.any_instance.stub(:save).and_return(false)
        post :create, lpu: FactoryGirl.attributes_for(:lpu_invalid)
        flash[:notice].should eq(nil)
        assigns(:lpu).should be_a_new(Lpu)
      end

      it "redirect after operation" do
        Lpu.any_instance.stub(:save).and_return(false)
        post :create, lpu: FactoryGirl.attributes_for(:lpu_invalid)
        flash[:notice].should eq(nil)
        response.code.should eq("302")
      end
    end

  end

  context "PUT update" do
    context "with valid params" do
      it "updates the requested lpu" do
        Lpu.any_instance.should_receive(:update_attributes)
        put :update, id: lpu.to_param, lpu: FactoryGirl.attributes_for(:lpu)
     end

      it "assigns the requested lpu as @lpu" do
        put :update, id: lpu.to_param, lpu: FactoryGirl.attributes_for(:lpu)
        flash[:notice].should eq('Lpu was successfully updated.')
        assigns(:lpu).should eq(lpu)
      end

      it "redirects to the lpu" do
        put :update, id: lpu.to_param, lpu: FactoryGirl.attributes_for(:lpu)
        flash[:notice].should eq('Lpu was successfully updated.')
        response.should redirect_to(lpu)
      end
    end

    context "with invalid params" do
      it "assigns the lpu as @lpu" do
        Lpu.any_instance.stub(:save).and_return(false)
        put :update, id: lpu.to_param, lpu: FactoryGirl.attributes_for(:lpu_invalid)
        assigns(:lpu).should eq(lpu)
        flash[:notice].should eq(nil)
      end

      it "re-renders the 'edit' template" do
        Lpu.any_instance.stub(:save).and_return(false)
        put :update, id: lpu.to_param, lpu: FactoryGirl.attributes_for(:lpu_invalid)
        flash[:notice].should eq(nil)
        response.code.should eq("302")
      end
    end
  end

  context "DELETE destroy" do
    it "destroys the requested lpu" do
      expect {
        delete :destroy, id: lpu.to_param 
      }.to change(Lpu, :count).by(-1)
    end

    it "redirects to the lpu list" do
      delete :destroy, id: lpu.to_param 
      flash[:notice].should eq('Lpu was successfully destroyed.')
      response.should redirect_to(lpus_url)
    end
  end

  it "Call get_lpu(id)" do
    subject.send(:get_lpu, lpu.id).should eq(lpu)
  end

end
