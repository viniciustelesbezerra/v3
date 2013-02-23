class ApplicationController < ActionController::Base
	protect_from_forgery
  
	before_filter :authenticate_user!

  	def index
  		@index = "Welcome to EvoraV3"
  	end

  	private

  	def have_to_be_admin
  		(redirect_to(root_path, alert: "Not allowed yet") unless current_user.admin?) if current_user
  	end

end
