class ReportsController < ApplicationController
	before_filter :have_to_be_admin
	#load_and_authorize_resource
	
	def index
	  	@arquivos_presenter = Arquivos::IndexPresenter.new(params)
	    @lpus_presenter = Lpus::IndexPresenter.new(params)
	end

end
