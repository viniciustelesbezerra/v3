class ContratosController < ApplicationController
    before_filter :have_to_be_admin

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
            @contrato.create_ufs_relation!(params[:ufs][:id])
            set_flash_message('Contrato was successfully created.','notice')
        end
        respond_with(@contrato)
    end

    def update
        @contrato = get_contrato(params[:id])
        if @contrato.update_attributes(params[:contrato])
            @contrato.update_ufs_relation!(params[:ufs][:id])
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
