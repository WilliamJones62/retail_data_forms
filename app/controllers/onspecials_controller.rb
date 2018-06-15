class OnspecialsController < ApplicationController
  before_action :set_onspecial, only: [:show, :edit, :update, :destroy]

  # GET /onspecials
  # GET /onspecials.json
  def index
    @onspecials = Onspecial.all
  end

  # GET /onspecials/1
  # GET /onspecials/1.json
  def show
  end

  # GET /onspecials/new
  def new
    @onspecial = Onspecial.new
  end

  # GET /onspecials/1/edit
  def edit
  end

  # POST /onspecials
  # POST /onspecials.json
  def create
    @onspecial = Onspecial.new(onspecial_params)

    respond_to do |format|
      if @onspecial.save
        format.html { redirect_to @onspecial, notice: 'Onspecial was successfully created.' }
        format.json { render :show, status: :created, location: @onspecial }
      else
        format.html { render :new }
        format.json { render json: @onspecial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /onspecials/1
  # PATCH/PUT /onspecials/1.json
  def update
    respond_to do |format|
      if @onspecial.update(onspecial_params)
        format.html { redirect_to @onspecial, notice: 'Onspecial was successfully updated.' }
        format.json { render :show, status: :ok, location: @onspecial }
      else
        format.html { render :edit }
        format.json { render json: @onspecial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /onspecials/1
  # DELETE /onspecials/1.json
  def destroy
    @onspecial.destroy
    respond_to do |format|
      format.html { redirect_to onspecials_url, notice: 'Onspecial was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_onspecial
      @onspecial = Onspecial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def onspecial_params
      params.require(:onspecial).permit(:customer, :part, :start, :end)
    end
end
