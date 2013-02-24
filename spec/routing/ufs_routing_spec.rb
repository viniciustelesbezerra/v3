require "spec_helper"

describe UfsController do
  describe "routing" do

    it "routes to #index" do
      get("/ufs").should route_to("ufs#index")
    end

    it "routes to #new" do
      get("/ufs/new").should route_to("ufs#new")
    end

    it "routes to #show" do
      get("/ufs/1").should route_to("ufs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/ufs/1/edit").should route_to("ufs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/ufs").should route_to("ufs#create")
    end

    it "routes to #update" do
      put("/ufs/1").should route_to("ufs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/ufs/1").should route_to("ufs#destroy", :id => "1")
    end

  end
end
