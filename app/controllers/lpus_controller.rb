class LpusController < ApplicationController
  before_filter :have_to_be_admin

  # GET /lpus
  # GET /lpus.json
  def index
    @lpus = Lpu.includes(:arquivo).all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lpus }
    end
  end

  # GET /lpus/1
  # GET /lpus/1.json
  def show
    @lpu = Lpu.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lpu }
    end
  end

  # GET /lpus/new
  # GET /lpus/new.json
  def new
    @lpu = Lpu.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lpu }
    end
  end

  # GET /lpus/1/edit
  def edit
    @lpu = Lpu.find(params[:id])
  end

  # POST /lpus
  # POST /lpus.json
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

  # PUT /lpus/1
  # PUT /lpus/1.json
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

  # DELETE /lpus/1
  # DELETE /lpus/1.json
  def destroy
    @lpu = Lpu.find(params[:id])
    @lpu.destroy

    respond_to do |format|
      format.html { redirect_to lpus_url }
      format.json { head :no_content }
    end
  end
end
