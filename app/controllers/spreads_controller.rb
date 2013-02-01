class SpreadsController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /spreads
  # GET /spreads.json
  def index
    @spreads = Spread.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @spreads }
    end
  end

  # GET /spreads/1
  # GET /spreads/1.json
  def show
    @spread = Spread.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @spread }
    end
  end

  # GET /spreads/new
  # GET /spreads/new.json
  def new
    @spread = Spread.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @spread }
    end
  end

  # GET /spreads/1/edit
  def edit
    @spread = Spread.find(params[:id])
  end

  # POST /spreads
  # POST /spreads.json
  def create
    @spread = Spread.new(spread_params)

    respond_to do |format|
      if @spread.save
        format.html { redirect_to @spread, notice: 'Spread was successfully created.' }
        format.json { render json: @spread, status: :created, location: @spread }
      else
        format.html { render action: "new" }
        format.json { render json: @spread.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /spreads/1
  # PUT /spreads/1.json
  def update
    @spread = Spread.find(params[:id])

    respond_to do |format|
      if @spread.update_attributes(spread_params)
        format.html { redirect_to @spread, notice: 'Spread was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @spread.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spreads/1
  # DELETE /spreads/1.json
  def destroy
    @spread = Spread.find(params[:id])
    @spread.destroy

    respond_to do |format|
      format.html { redirect_to spreads_url }
      format.json { head :no_content }
    end
  end

  private
  def spread_params
    params.require(:spread).permit(:title, :spread_order_position)
  end
end
