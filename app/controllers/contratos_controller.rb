class ContratosController < ApplicationController
    before_filter :have_to_be_admin

    def index
        @contratos = Contrato.all
    end

    def show
        @contrato = Contrato.find(params[:id])
    end

    def new
        @contrato = Contrato.new
    end

    def edit
        @contrato = Contrato.find(params[:id])
    end

    def create
        @contrato = Contrato.new(params[:contrato])
        if @contrato.save
            @contrato.create_ufs_relation!(params[:ufs][:id])
            flash[:notice] = 'Contrato was successfully created.'
        end

        respond_with(@contrato)
    end

    def update
        @contrato = Contrato.find(params[:id])
        if @contrato.update_attributes(params[:contrato])
            @contrato.update_ufs_relation!(params[:ufs][:id])
            flash[:notice] = 'Contrato was successfully updated.'
        end

        respond_with(@contrato)
    end

    def destroy
        @contrato = Contrato.find(params[:id])
        flash[:notice] = 'Contrato was successfully destroyed.' if @contrato.destroy
        respond_with(@contrato) 
    end

end
