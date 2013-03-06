class ApplicationController < ActionController::Base
	protect_from_forgery
	before_filter :authenticate_user!
  respond_to :html, :json
	
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end

  def index
  	@index = "EvoraV3."
  end

  private
  def have_to_be_admin
    #(redirect_to(root_path, alert: "Not allowed yet.") unless current_user.admin?) if current_user
  end

  def set_flash_message(message, type)
    flash[type.to_sym] = message
  end

end
