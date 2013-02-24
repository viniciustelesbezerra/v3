class UfsController < ApplicationController
  before_filter :have_to_be_admin

  def index
    @ufs = Uf.all
  end

  def show
    @uf = Uf.find(params[:id])
  end

  def new
    @uf = Uf.new
  end

  def edit
    @uf = Uf.find(params[:id])
  end

  def create
    @uf = Uf.new(params[:uf])
    flash[:notice] = 'Uf was successfully created.' if @uf.save
    repond_with(@uf)
  end

  def update
    @uf = Uf.find(params[:id])
    flash[:notice] = 'Uf was successfully updated.' if @uf.update_attributes(params[:uf])
    repond_with(@uf)
  end

  def destroy
    @uf = Uf.find(params[:id])
    @uf.destroy
  end

end
