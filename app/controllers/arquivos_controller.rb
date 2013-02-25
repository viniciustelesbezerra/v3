class ArquivosController < ApplicationController
    before_filter :have_to_be_admin

    def index
        @arquivos = Arquivo.includes(:user).all
    end

    def show
        @arquivo = get_arquivo(params[:id])
    end

    def new
        @arquivo = Arquivo.new
    end

    def edit
        @arquivo = get_arquivo(params[:id])
    end

    def create
        @arquivo = Arquivo.new(params[:arquivo])
        set_flash_message('Arquivo was successfully created.','notice') if @arquivo.save
        respond_with(@arquivo)
    end

    def update
        @arquivo = get_arquivo(params[:id])
        set_flash_message('Arquivo was successfully updated.','notice') if @arquivo.update_attributes(params[:arquivo])
        respond_with(@arquivo)
    end

    def destroy
        @arquivo = get_arquivo(params[:id])
        set_flash_message('Arquivo was successfully destroyed.','notice') if @arquivo.destroy
        respond_with(@arquivo)
    end
    
    private
    def get_arquivo(id)
        Arquivo.find(id)
    end

end
