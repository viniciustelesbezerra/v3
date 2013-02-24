class LpusController < ApplicationController
    before_filter :have_to_be_admin

    def index
        @lpus = Lpu.includes(:arquivo).all
    end

    def show
        @lpu = get_lpu(params[:id])
    end

    def new
        @lpu = Lpu.new
    end

    def edit
        @lpu = get_lpu(params[:id])
    end

    def create
        @lpu = Lpu.new(params[:lpu])
        flash[:notice] = 'Lpu was successfully created.' if @lpu.save
        respond_with(@lpu)
    end

    def update
        @lpu = get_lpu(params[:id])
        flash[:notice] = 'Lpu was successfully updated.' if @lpu.update_attributes(params[:lpu])
        respond_with(@lpu)
    end

    def destroy
        @lpu = get_lpu(params[:id])
        flash[:notice] = 'Lpu was successfully destroyed.' if @lpu.destroy
        respond_with(@lpu)
    end

    private
    def get_lpu(id)
        Lpu.find(id)
    end

end
