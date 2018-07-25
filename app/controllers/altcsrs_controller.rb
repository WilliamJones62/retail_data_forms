class AltcsrsController < ApplicationController
  before_action :set_altcsr, only: [:show, :edit, :update, :destroy]
  before_action :build_csr_list, only: [:new, :edit]
  before_action :build_day_list, only: [:new, :edit]

  # GET /altcsrs
  def index
    @altcsrs = Altcsr.all
  end

  # GET /altcsrs/1
  def show
  end

  # GET /altcsrs/new
  def new
    @new_altcsr = true
    build_lists
    @altcsr = Altcsr.new
  end

  # GET /altcsrs/1/edit
  def edit
    @new_altcsr = false
    build_lists
  end

  # POST /altcsrs
  def create
    @altcsr = Altcsr.new(altcsr_params)

    respond_to do |format|
      if @altcsr.save
        format.html { redirect_to @altcsr, notice: 'Altcsr was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /altcsrs/1
  def update
    respond_to do |format|
      if @altcsr.update(altcsr_params)
        format.html { redirect_to @altcsr, notice: 'Altcsr was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /altcsrs/1
  def destroy
    @altcsr.destroy
    respond_to do |format|
      format.html { redirect_to altcsrs_url, notice: 'Altcsr was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_altcsr
      @altcsr = Altcsr.find(params[:id])
    end

    # Build a list of current CSRs
    def build_csr_list
      @csr = []
      tempcsr = []
      calllist = Calllist.all
      calllist.each do |c|
        if c.csr && !tempcsr.include?(c.csr)
          tempcsr.push(c.csr)
        end
      end
      @csr = tempcsr.sort
    end

    # Build a list of days
    def build_day_list
      @day = ['MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY', 'FRIDAY', 'HOLIDAY']
    end

    # Build lists of current customers, shiptos and parts
    def build_lists
      @customer = []
      @allcust = []
      @allshipto = []
      @allcsr = []
      @allday = []
      @shipto = []
      tempcust = []
      tempshipto = []

      if @new_altcsr
        csr = @csr[0]
        day = @day[0]
      else
        csr = @altcsr.usualcsr
        day = @altcsr.altcsrs_day
      end

      firsttime = true
      calllist = Calllist.all
      calllist.each do |c|
        if c.csr == csr && c.calllists_day == day && !tempcust.include?(c.custcode)
          if firsttime
            firsttime = false
            customer = c.custcode
          end
          tempcust.push(c.custcode)
        end
        if c.csr == csr && c.calllists_day == day && c.custcode == customer && !tempshipto.include?(c.shipto)
          tempshipto.push(c.shipto)
        end
        @allcsr.push(c.csr)
        @allday.push(c.calllists_day)
        @allshipto.push(c.shipto)
        @allcust.push(c.custcode)
      end
      @customer = tempcust.sort
      @shipto = tempshipto.sort
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def altcsr_params
      params.require(:altcsr).permit(:usualcsr, :altcsrs_day, :custcode, :shipto, :altcsr, :altcsrs_start, :altcsrs_end)
    end
end
