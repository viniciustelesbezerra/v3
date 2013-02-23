require "spec_helper"

describe ArquivosController do
  describe "routing" do

    it "routes to #index" do
      get("/arquivos").should route_to("arquivos#index")
    end

    it "routes to #new" do
      get("/arquivos/new").should route_to("arquivos#new")
    end

    it "routes to #show" do
      get("/arquivos/1").should route_to("arquivos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/arquivos/1/edit").should route_to("arquivos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/arquivos").should route_to("arquivos#create")
    end

    it "routes to #update" do
      put("/arquivos/1").should route_to("arquivos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/arquivos/1").should route_to("arquivos#destroy", :id => "1")
    end

  end
end
