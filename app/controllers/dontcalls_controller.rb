class DontcallsController < ApplicationController
  before_action :set_dontcall, only: [:show, :edit, :update, :destroy]

  # GET /dontcalls
  # GET /dontcalls.json
  def index
    @dontcalls = Dontcall.all
  end

  # GET /dontcalls/1
  # GET /dontcalls/1.json
  def show
  end

  # GET /dontcalls/new
  def new
    @dontcall = Dontcall.new
  end

  # GET /dontcalls/1/edit
  def edit
  end

  # POST /dontcalls
  # POST /dontcalls.json
  def create
    @dontcall = Dontcall.new(dontcall_params)

    respond_to do |format|
      if @dontcall.save
        format.html { redirect_to @dontcall, notice: 'Dontcall was successfully created.' }
        format.json { render :show, status: :created, location: @dontcall }
      else
        format.html { render :new }
        format.json { render json: @dontcall.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dontcalls/1
  # PATCH/PUT /dontcalls/1.json
  def update
    respond_to do |format|
      if @dontcall.update(dontcall_params)
        format.html { redirect_to @dontcall, notice: 'Dontcall was successfully updated.' }
        format.json { render :show, status: :ok, location: @dontcall }
      else
        format.html { render :edit }
        format.json { render json: @dontcall.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dontcalls/1
  # DELETE /dontcalls/1.json
  def destroy
    @dontcall.destroy
    respond_to do |format|
      format.html { redirect_to dontcalls_url, notice: 'Dontcall was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dontcall
      @dontcall = Dontcall.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dontcall_params
      params.require(:dontcall).permit(:customer, :shipto, :part, :start, :end)
    end
end
