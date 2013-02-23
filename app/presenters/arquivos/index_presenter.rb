class Arquivos::IndexPresenter
	extend ActiveSupport::Memoizable

	#def initialize
	#end

	def report_arquivos
		Arquivo.includes(:user).all
	end

	memoize :report_arquivos
	
end
