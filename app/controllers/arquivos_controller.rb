class ArquivosController < ApplicationController
  before_filter :have_to_be_admin

  def index
    @arquivos = Arquivo.includes(:user).all
  end

  def show
    @arquivo = Arquivo.find(params[:id])
  end

  def new
    @arquivo = Arquivo.new
  end

  def edit
    @arquivo = Arquivo.find(params[:id])
  end

  def create
    @arquivo = Arquivo.new(params[:arquivo])

    respond_to do |format|
      if @arquivo.save
        format.html { redirect_to @arquivo, notice: 'Arquivo was successfully created.' }
        format.json { render json: @arquivo, status: :created, location: @arquivo }
      else
        format.html { render action: "new" }
        format.json { render json: @arquivo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /arquivos/1
  # PUT /arquivos/1.json
  def update
    @arquivo = Arquivo.find(params[:id])

    respond_to do |format|
      if @arquivo.update_attributes(params[:arquivo])
        format.html { redirect_to @arquivo, notice: 'Arquivo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @arquivo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @arquivo = Arquivo.find(params[:id])
    @arquivo.destroy
  end

end
