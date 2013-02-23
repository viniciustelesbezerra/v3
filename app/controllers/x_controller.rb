class  XController < ApplicationController
    before_filter :have_to_be_admin

  	def index
        return render text: "XController Page"
    end

end
