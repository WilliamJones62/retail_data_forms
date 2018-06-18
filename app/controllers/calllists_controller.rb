class CalllistsController < ApplicationController
  before_action :set_calllist, only: [:show, :edit, :update, :destroy]

  # GET /calllists
  # GET /calllists.json
  def index
    @calllists = Calllist.all
  end

  # GET /calllists/1
  # GET /calllists/1.json
  def show
  end

  # GET /calllists/new
  def new
    @day = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Holiday']
    @calllist = Calllist.new
  end

  # GET /calllists/1/edit
  def edit
    @day = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Holiday']
  end

  # POST /calllists
  # POST /calllists.json
  def create
    @calllist = Calllist.new(calllist_params)

    respond_to do |format|
      if @calllist.save
        format.html { redirect_to @calllist, notice: 'Calllist was successfully created.' }
        format.json { render :show, status: :created, location: @calllist }
      else
        format.html { render :new }
        format.json { render json: @calllist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calllists/1
  # PATCH/PUT /calllists/1.json
  def update
    respond_to do |format|
      if @calllist.update(calllist_params)
        format.html { redirect_to @calllist, notice: 'Calllist was successfully updated.' }
        format.json { render :show, status: :ok, location: @calllist }
      else
        format.html { render :edit }
        format.json { render json: @calllist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calllists/1
  # DELETE /calllists/1.json
  def destroy
    @calllist.destroy
    respond_to do |format|
      format.html { redirect_to calllists_url, notice: 'Calllist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    Calllist.import(params[:file])
    redirect_to root_url, notice: "Call lists imported."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_calllist
      @calllist = Calllist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def calllist_params
      params.require(:calllist).permit(:day, :custname, :custcode, :shipto, :rep, :csr, :dept, :item, :phone, :manager, :totalitems, :dontcall, :reason, :startdc, :enddc, :special, :starts, :ends, :altrep, :startar, :endar)
    end
end
