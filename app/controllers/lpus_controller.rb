class LpusController < ApplicationController
  before_filter :have_to_be_admin

  def index
    @lpus = Lpu.includes(:arquivo).all
  end

  def show
    @lpu = Lpu.find(params[:id])
  end

  def new
    @lpu = Lpu.new
  end

  def edit
    @lpu = Lpu.find(params[:id])
  end

  def create
    @lpu = Lpu.new(params[:lpu])

    respond_to do |format|
      if @lpu.save
        format.html { redirect_to @lpu, notice: 'Lpu was successfully created.' }
        format.json { render json: @lpu, status: :created, location: @lpu }
      else
        format.html { render action: "new" }
        format.json { render json: @lpu.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @lpu = Lpu.find(params[:id])

    respond_to do |format|
      if @lpu.update_attributes(params[:lpu])
        format.html { redirect_to @lpu, notice: 'Lpu was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lpu.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @lpu = Lpu.find(params[:id])
    @lpu.destroy
  end

end
