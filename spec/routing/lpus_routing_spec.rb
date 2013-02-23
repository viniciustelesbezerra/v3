require "spec_helper"

describe LpusController do
  describe "routing" do

    it "routes to #index" do
      get("/lpus").should route_to("lpus#index")
    end

    it "routes to #new" do
      get("/lpus/new").should route_to("lpus#new")
    end

    it "routes to #show" do
      get("/lpus/1").should route_to("lpus#show", :id => "1")
    end

    it "routes to #edit" do
      get("/lpus/1/edit").should route_to("lpus#edit", :id => "1")
    end

    it "routes to #create" do
      post("/lpus").should route_to("lpus#create")
    end

    it "routes to #update" do
      put("/lpus/1").should route_to("lpus#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/lpus/1").should route_to("lpus#destroy", :id => "1")
    end

  end
end
