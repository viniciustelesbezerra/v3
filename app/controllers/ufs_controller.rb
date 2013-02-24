class UfsController < ApplicationController
    before_filter :have_to_be_admin

    def index
        @ufs = Uf.all
    end

    def show
        @uf = get_uf(params[:id])
    end

    def new
        @uf = Uf.new
    end

    def edit
        @uf = get_uf(params[:id])
    end

    def create
        @uf = Uf.new(params[:uf])
        flash[:notice] = 'Uf was successfully created.' if @uf.save
        repond_with(@uf)
    end

    def update
        @uf = get_uf(params[:id])
        flash[:notice] = 'Uf was successfully updated.' if @uf.update_attributes(params[:uf])
        repond_with(@uf)
    end

    def destroy
        @uf = get_uf(params[:id])
        flash[:notice] = 'Uf was successfully updated.' if @uf.destroy
        repond_with(@uf)
    end

    private
    def get_uf(id)
        Uf.find(id)
    end

end
