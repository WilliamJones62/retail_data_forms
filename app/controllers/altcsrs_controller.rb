class AltcsrsController < ApplicationController
  before_action :set_altcsr, only: [:show, :edit, :update, :destroy]

  # GET /altcsrs
  # GET /altcsrs.json
  def index
    @altcsrs = Altcsr.all
  end

  # GET /altcsrs/1
  # GET /altcsrs/1.json
  def show
  end

  # GET /altcsrs/new
  def new
    @altcsr = Altcsr.new
  end

  # GET /altcsrs/1/edit
  def edit
  end

  # POST /altcsrs
  # POST /altcsrs.json
  def create
    @altcsr = Altcsr.new(altcsr_params)

    respond_to do |format|
      if @altcsr.save
        format.html { redirect_to @altcsr, notice: 'Altcsr was successfully created.' }
        format.json { render :show, status: :created, location: @altcsr }
      else
        format.html { render :new }
        format.json { render json: @altcsr.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /altcsrs/1
  # PATCH/PUT /altcsrs/1.json
  def update
    respond_to do |format|
      if @altcsr.update(altcsr_params)
        format.html { redirect_to @altcsr, notice: 'Altcsr was successfully updated.' }
        format.json { render :show, status: :ok, location: @altcsr }
      else
        format.html { render :edit }
        format.json { render json: @altcsr.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /altcsrs/1
  # DELETE /altcsrs/1.json
  def destroy
    @altcsr.destroy
    respond_to do |format|
      format.html { redirect_to altcsrs_url, notice: 'Altcsr was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_altcsr
      @altcsr = Altcsr.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def altcsr_params
      params.require(:altcsr).permit(:usualcsr, :altcsr, :start, :end)
    end
end
