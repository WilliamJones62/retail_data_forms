class CalllistsController < ApplicationController
  before_action :set_calllist, only: [:show, :edit, :update, :destroy]
  before_action :build_csr_list, only: [:list]

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
    @day = ['MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY', 'FRIDAY', 'Holiday']
    @calllist = Calllist.new
  end

  # GET /calllists/1/edit
  def edit
    @day = ['MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY', 'FRIDAY', 'Holiday']
  end

  # POST /calllists
  # POST /calllists.json
  def create
    @calllist = Calllist.new(calllist_params)

    respond_to do |format|
      if @calllist.save
        format.html { redirect_to @calllist, notice: 'Calllist was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /calllists/1
  # PATCH/PUT /calllists/1.json
  def update
    respond_to do |format|
      if @calllist.update(calllist_params)
        format.html { redirect_to @calllist, notice: 'Calllist was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /calllists/1
  # DELETE /calllists/1.json
  def destroy
    @calllist.destroy
    respond_to do |format|
      format.html { redirect_to calllists_url, notice: 'Calllist was successfully destroyed.' }
    end
  end

  def list
    @day = ['MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY', 'FRIDAY', 'HOLIDAY']

  end

  # def import
    # Calllist.import(params[:file])
    # redirect_to root_url, notice: "Call lists imported."
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_calllist
      @calllist = Calllist.find(params[:id])
    end

    # Build a list of current CSRs
    def build_csr_list
      @csr = []
      @csrid = []
      @dayid = []
      @customer = []
      @shipto = []
      @dept = []
      @phone = []
      @manager = []
      @called = []
      tempcsr = []
      calllist = Calllist.all
      calllist.each do |c|
        @customer.push(c.custcode)
        @shipto.push(c.shipto)
        @dept.push(c.dept)
        @phone.push(c.phone)
        @manager.push(c.manager)
        @dayid.push(c.calllists_day)
        @csrid.push(c.csr)
        @called.push(c.called)
        if c.csr && !tempcsr.include?(c.csr)
          tempcsr.push(c.csr)
        end
      end
      @csr = tempcsr.sort
    # Set up the call list for the first CSR
      @initial_customer = []
      @initial_shipto = []
      @initial_dept = []
      @initial_phone = []
      @initial_manager = []
      @initial_called = []
      calllist.each do |c|
        if c.csr && c.csr == @csr[0] && c.calllists_day == 'MONDAY'
          @initial_customer.push(c.custcode)
          @initial_shipto.push(c.shipto)
          @initial_dept.push(c.dept)
          @initial_phone.push(c.phone)
          @initial_manager.push(c.manager)
          @initial_called.push(c.called)
        end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def calllist_params
      params.require(:calllist).permit(:calllists_day, :custname, :custcode, :shipto, :rep, :csr, :dept, :item, :phone, :manager, :totalitems)
    end
end
