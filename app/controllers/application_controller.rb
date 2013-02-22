class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def index
  	@index = "Index Page"
  end

end
