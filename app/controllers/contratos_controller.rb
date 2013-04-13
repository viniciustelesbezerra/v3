class ContratosController < ApplicationController
    load_and_authorize_resource
    
    def index
        @contratos = Contrato.all
    end

    def show
        @contrato = get_contrato(params[:id])
    end

    def new
        @contrato = Contrato.new
    end

    def edit
        @contrato = get_contrato(params[:id])
    end

    def create
        @contrato = Contrato.new(params[:contrato])
        if @contrato.save
            set_flash_message('Contrato was successfully created.','notice')
        end
        respond_with(@contrato)
    end

    def update
        @contrato = get_contrato(params[:id])
        if @contrato.update_attributes(params[:contrato])
            set_flash_message('Contrato was successfully updated.','notice')
        end
        respond_with(@contrato)
    end

    def destroy
        @contrato = get_contrato(params[:id])
        set_flash_message('Contrato was successfully destroyed.','notice') if @contrato.destroy
        respond_with(@contrato) 
    end

    private
    def get_contrato(id)
        Contrato.find(id)
    end

end
