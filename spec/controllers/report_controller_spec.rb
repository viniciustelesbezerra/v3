require 'spec_helper'

describe ReportsController do
  	login_admin
  	let!(:lpu) { FactoryGirl.create(:lpu) }

  	context "GET index" do
  		it "Response code" do
  			get :index
  			response.code.should eq("200")
  		end

  		it "renders the index view" do
      		get :index
      		response.should render_template :index
    	end

  	end

end	