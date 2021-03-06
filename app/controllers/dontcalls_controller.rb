class DontcallsController < ApplicationController
  before_action :set_dontcall, only: [:show, :edit, :update, :destroy]

  # GET /dontcalls
  def index
    @dontcalls = Dontcall.all
  end

  # GET /dontcalls/1
  def show
  end

  # GET /dontcalls/new
  def new
    @new_dontcall = true
    build_lists
    @dontcall = Dontcall.new
  end

  # GET /dontcalls/1/edit
  def edit
    @new_dontcall = false
    build_lists
  end

  # POST /dontcalls
  def create
    @dontcall = Dontcall.new(dontcall_params)

    respond_to do |format|
      if @dontcall.save
        format.html { redirect_to @dontcall, notice: 'Dontcall was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /dontcalls/1
  def update
    respond_to do |format|
      if @dontcall.update(dontcall_params)
        format.html { redirect_to @dontcall, notice: 'Dontcall was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /dontcalls/1
  def destroy
    @dontcall.destroy
    respond_to do |format|
      format.html { redirect_to dontcalls_url, notice: 'Dontcall was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dontcall
      @dontcall = Dontcall.find(params[:id])
    end

    # Build lists of current customers, shiptos and parts
    def build_lists
      @customer = []
      @customerA = []
      @allcust = []
      @allcustA = []
      @allshipto = []
      @allpart = []
      @shipto = []
      @part = []
      tempcust = []
      tempshipto = []
      temppart = []

      if @new_dontcall
        firstcalllist = Calllist.first
        cust = firstcalllist.custcode
        firstauthorlist = Authorlist.first
        custA = firstauthorlist.custcode
      else
        cust = @dontcall.customer
        custA = @dontcall.customer
      end

      authorlist = Authorlist.all
      authorlist.each do |a|
        if a.custcode == custA && !temppart.include?(a.partcode)
          temppart.push(a.partcode)
        end
        @allcustA.push(a.custcode)
        @allpart.push(a.partcode)
      end

      calllist = Calllist.all
      calllist.each do |c|
        if !tempcust.include?(c.custcode)
          tempcust.push(c.custcode)
        end
        if c.custcode == cust && !tempshipto.include?(c.shipto)
          tempshipto.push(c.shipto)
        end
        @allshipto.push(c.shipto)
        @allcust.push(c.custcode)
      end
      @customer = tempcust.sort
      @shipto = tempshipto.sort
      @part = temppart.sort
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dontcall_params
      params.require(:dontcall).permit(:customer, :shipto, :part, :dontcalls_start, :dontcalls_end)
    end
end
