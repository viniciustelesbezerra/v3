class Arquivos::IndexPresenter
	extend ActiveSupport::Memoizable

	def initialize(params_arquivos)
		@params_arquivos = params_arquivos
	end

	def report_arquivos
		Arquivo.search(@params_arquivos)
	end

	memoize :report_arquivos
	
end
