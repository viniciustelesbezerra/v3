class ReportsController < ApplicationController
	#load_and_authorize_resource
	
	def index
	  	@arquivos_presenter = Arquivos::IndexPresenter.new(params)
	    @lpus_presenter = Lpus::IndexPresenter.new(params)
	end

end
