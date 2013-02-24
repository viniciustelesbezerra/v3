class Lpus::IndexPresenter
	extend ActiveSupport::Memoizable

	def initialize(params_lpus)
		@params_lpus = params_lpus
	end

	def report_lpus
		Lpu.search(@params_lpus)
	end

	memoize :report_lpus
	
end
