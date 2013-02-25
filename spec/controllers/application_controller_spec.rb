require 'spec_helper'

describe ApplicationController do
  	
  	context "Admin user" do
	  	login_admin

	  	context "GET index" do
		    it "assigns welcome page" do
		      	get :index
		      	response.code.should eq("200")
		    end

		    it "renders the index view" do
		      	get :index
		      	response.should render_template :index
		    end

	  	end

	    it "Call have_to_be_admin filter" do
	      	subject.send(:have_to_be_admin).should eq(nil)
	    end

	    it "Call set_flash_message(message, type)" do
	      	subject.send(:set_flash_message,"Message","type").should eq("Message")
	    end

  	end

end
