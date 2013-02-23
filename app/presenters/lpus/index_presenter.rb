class Lpus::IndexPresenter
	extend ActiveSupport::Memoizable

	#def initialize
	#end

	def report_lpus
		Lpu.includes(:arquivo).all
	end

	memoize :report_lpus
	
end
