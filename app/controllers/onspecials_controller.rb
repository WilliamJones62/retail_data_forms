class OnspecialsController < ApplicationController
  before_action :set_onspecial, only: [:show, :edit, :update, :destroy]
  before_action :build_lists, only: [:new, :edit]

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
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /onspecials/1
  # PATCH/PUT /onspecials/1.json
  def update
    respond_to do |format|
      if @onspecial.update(onspecial_params)
        format.html { redirect_to @onspecial, notice: 'Onspecial was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /onspecials/1
  # DELETE /onspecials/1.json
  def destroy
    @onspecial.destroy
    respond_to do |format|
      format.html { redirect_to onspecials_url, notice: 'Onspecial was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_onspecial
      @onspecial = Onspecial.find(params[:id])
    end

    # Build lists of current customers, shiptos and parts
    def build_lists
      @customer = []
      @part = []
      tempcust = []
      temppart = []
      authorlist = Authorlist.all
      authorlist.each do |a|
        if !temppart.include?(a.partcode)
          temppart.push(a.partcode)
        end
        if !tempcust.include?(a.custcode)
          tempcust.push(a.custcode)
        end
      end

      @customer = tempcust.sort
      @part = temppart.sort
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def onspecial_params
      params.require(:onspecial).permit(:customer, :part, :onspecials_start, :onspecials_end)
    end
end
