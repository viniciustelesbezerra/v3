require 'spec_helper'

describe UfsController do
  login_admin
  let!(:uf) { FactoryGirl.create(:uf) }

  context "GET index" do
    it "assigns all uf as @uf" do
      get :index
      assigns(:ufs).should include(uf)
    end

    it "renders the index view" do
      get :index
      response.should render_template :index
    end

  end

  context "GET show" do
    it "assigns the requested uf as @uf" do
      get :show, id: uf.to_param 
      assigns(:uf).should eq(uf)
    end

    it "renders the show view" do
      get :show, id: uf.to_param 
      response.should render_template :show
    end

  end

  context "GET new" do
    it "assigns a new uf as @uf" do
      get :new
      assigns(:uf).should be_a_new(Uf)
    end

    it "renders the new view" do
      get :new
      response.should render_template :new
    end

  end

  context "GET edit" do
    it "assigns the requested uf as @uf" do
      get :edit, id: uf.to_param 
      assigns(:uf).should eq(uf)
    end

    it "renders the edit view" do
      get :edit, id: uf.to_param 
      response.should render_template :edit
    end

  end

  context "POST create" do
    context "with valid params" do
      it "assigns a newly created uf as @uf" do
        post :create, uf: FactoryGirl.attributes_for(:uf)  
        assigns(:uf).should be_a(Uf)
        assigns(:uf).should be_persisted
      end

      it "redirects to the created uf" do
        post :create, uf: FactoryGirl.attributes_for(:uf)
        response.code.should eq("302")
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved uf as @uf" do
        Uf.any_instance.stub(:save).and_return(false)
        post :create, uf: FactoryGirl.attributes_for(:uf_invalid)
        flash[:notice].should eq(nil)
        assigns(:uf).should be_a_new(Uf)
      end

      it "redirect after operation" do
        Uf.any_instance.stub(:save).and_return(false)
        post :create, uf: FactoryGirl.attributes_for(:uf_invalid)
        flash[:notice].should eq(nil)
        response.code.should eq("302")
      end
    end

  end

  context "PUT update" do
    context "with valid params" do
      it "updates the requested uf" do
        Uf.any_instance.should_receive(:update_attributes)
        put :update, id: uf.to_param, uf: FactoryGirl.attributes_for(:uf)
     end

      it "assigns the requested uf as @uf" do
        put :update, id: uf.to_param, uf: FactoryGirl.attributes_for(:uf)
        flash[:notice].should eq('Uf was successfully updated.')
        assigns(:uf).should eq(uf)
      end

      it "redirects to the uf" do
        put :update, id: uf.to_param, uf: FactoryGirl.attributes_for(:uf)
        flash[:notice].should eq('Uf was successfully updated.')
        response.should redirect_to(uf)
      end
    end

    context "with invalid params" do
      it "assigns the uf as @uf" do
        Uf.any_instance.stub(:save).and_return(false)
        put :update, id: uf.to_param, uf: FactoryGirl.attributes_for(:uf_invalid)
        assigns(:uf).should eq(uf)
        flash[:notice].should eq(nil)
      end

      it "re-renders the 'edit' template" do
        Uf.any_instance.stub(:save).and_return(false)
        put :update, id: uf.to_param, uf: FactoryGirl.attributes_for(:uf_invalid)
        flash[:notice].should eq(nil)
        response.code.should eq("302")
      end
    end
  end

  context "DELETE destroy" do
    it "destroys the requested uf" do
      expect {
        delete :destroy, id: uf.to_param 
      }.to change(Uf, :count).by(-1)
    end

    it "redirects to the uf list" do
      delete :destroy, id: uf.to_param 
      flash[:notice].should eq('Uf was successfully destroyed.')
      response.should redirect_to(ufs_url)
    end
  end

  it "Call get_uf(id)" do
    subject.send(:get_uf, uf.id).should eq(uf)
  end

end
