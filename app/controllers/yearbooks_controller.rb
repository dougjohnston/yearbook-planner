class YearbooksController < ApplicationController
  # GET /yearbooks
  # GET /yearbooks.json
  def index
    @yearbooks = Yearbook.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @yearbooks }
    end
  end

  # GET /yearbooks/1
  # GET /yearbooks/1.json
  def show
    @yearbook = current_yearbook

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @yearbook }
    end
  end

  # GET /yearbooks/new
  # GET /yearbooks/new.json
  def new
    @yearbook = Yearbook.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @yearbook }
    end
  end

  # GET /yearbooks/1/edit
  def edit
    @yearbook = Yearbook.find(params[:id])
  end

  # POST /yearbooks
  # POST /yearbooks.json
  def create
    @yearbook = Yearbook.new(yearbook_params)

    respond_to do |format|
      if @yearbook.save
        format.html { redirect_to @yearbook, notice: 'Yearbook was successfully created.' }
        format.json { render json: @yearbook, status: :created, location: @yearbook }
      else
        format.html { render action: "new" }
        format.json { render json: @yearbook.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /yearbooks/1
  # PUT /yearbooks/1.json
  def update
    @yearbook = Yearbook.find(params[:id])

    respond_to do |format|
      if @yearbook.update_attributes(yearbook_params)
        format.html { redirect_to @yearbook, notice: 'Yearbook was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @yearbook.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /yearbooks/1
  # DELETE /yearbooks/1.json
  def destroy
    @yearbook = Yearbook.find(params[:id])
    @yearbook.destroy

    respond_to do |format|
      format.html { redirect_to yearbooks_url }
      format.json { head :no_content }
    end
  end

  private
  def yearbook_params
    params.require(:yearbook).permit(:school_id, :starting_year, :ending_year, :theme)
  end
end
