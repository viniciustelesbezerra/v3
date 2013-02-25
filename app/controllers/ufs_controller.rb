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
        set_flash_message('Uf was successfully created.','notice') if @uf.save
        repond_with(@uf)
    end

    def update
        @uf = get_uf(params[:id])
        set_flash_message('Uf was successfully updated.','notice') if @uf.update_attributes(params[:uf])
        repond_with(@uf)
    end

    def destroy
        @uf = get_uf(params[:id])
        set_flash_message('Uf was successfully destroyed.','notice') if @uf.destroy
        repond_with(@uf)
    end

    private
    def get_uf(id)
        Uf.find(id)
    end

end
