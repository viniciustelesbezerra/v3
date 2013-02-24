class  ReportsController < ApplicationController
  before_filter :have_to_be_admin

  def index
  	@arquivos_presenter = Arquivos::IndexPresenter.new(params)
    @lpus_presenter = Lpus::IndexPresenter.new(params)
  end

end
