class CalllistsController < ApplicationController
  before_action :set_calllist, only: [:show, :edit, :update, :destroy]
  before_action :build_csr_list, only: [:list, :route]
  before_action :reset_called_flag, only: [:index, :list]

  # GET /calllists
  def index
    @calllists = Calllist.all
  end

  # GET /calllists/1
  def show
  end

  # GET /calllists/new
  def new
    @day = ['MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY', 'FRIDAY', 'HOLIDAY']
    @calllist = Calllist.new
  end

  # GET /calllists/1/edit
  def edit
    @day = ['MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY', 'FRIDAY', 'HOLIDAY']
  end

  # POST /calllists
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
  def update
    session[:called_update] = false
    session[:called_day] = ''
    session[:called_csr] = ''
    session[:called_route] = ''
    if @calllist.called != calllist_params[:called]
      # just updated the called flag
      session[:called_csr] = calllist_params[:csr]
      session[:called_day] = calllist_params[:calllists_day]
      shipto = Shipto.where("shipto_code = ?", calllist_params[:shipto]).first
      session[:called_route] = shipto.route_code
      session[:called_update] = true
    end

    respond_to do |format|
      if session[:called_update]
        cp = calllist_params
        cp[:called_date] = Date.today
        if @calllist.update(cp)
          format.html { redirect_to action: "list", notice: 'Calllist was successfully updated.' }
        else
          format.html { render :edit }
        end
      else
        if @calllist.update(calllist_params)
          format.html { redirect_to @calllist, notice: 'Calllist was successfully updated.' }
        else
          format.html { render :edit }
        end
      end
    end
  end

  # DELETE /calllists/1
  def destroy
    @calllist.destroy
    respond_to do |format|
      format.html { redirect_to calllists_url, notice: 'Calllist was successfully destroyed.' }
    end
  end

  def list
    @day = ['MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY', 'FRIDAY', 'HOLIDAY']
  end

  def route
  end

  def report
    @report_list = Calllist.all
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
      @route = []
      temproute = []
      routes = Shipto.all
      routes.each do |r|
        if r.route_code && !temproute.include?(r.route_code)
          temproute.push(r.route_code)
        end
      end
      @route = temproute.sort
      @csr = []
      @csrid = []
      @dayid = []
      @customer = []
      @shipto = []
      @routeid = []
      @dept = []
      @phone = []
      @manager = []
      @called = []
      @call_list_id = []
      tempcsr = []
      calllist = Calllist.all
      calllist.each do |c|
        @customer.push(c.custcode)
        @shipto.push(c.shipto)
        shipto = Shipto.where("shipto_code = ?", c.shipto).first
        shipto ? @routeid.push(shipto.route_code) : @routeid.push(' ')
        @dept.push(c.dept)
        @phone.push(c.phone)
        @manager.push(c.manager)
        @dayid.push(c.calllists_day)
        @csrid.push(c.csr)
        c.called ? @called.push('Yes') : @called.push('No')
        @call_list_id.push(c.id)
        if c.csr && !tempcsr.include?(c.csr)
          tempcsr.push(c.csr)
        end
      end
      @csr = tempcsr.sort
    # Set up the call list for the first CSR or the returning CSR after 'called' flag update
      @calllists = []
      @route_calllists = []

      if !session[:called_csr] || session[:called_csr == '']
        # not returning from update of called flag
        session[:called_csr] = @csr[0]
        session[:called_day] = 'MONDAY'
        session[:called_route] = @route[0]
      end

      calllist.each do |c|
        if c.csr && c.csr == session[:called_csr]
          if c.calllists_day == session[:called_day]
            @calllists.push(c)
          end
          shipto = Shipto.where("shipto_code = ?", c.shipto).first
          if shipto.route_code == session[:called_route]
            @route_calllists.push(c)
          end
        end
      end
    end

    # After seven days reset the called flag to false.
    def reset_called_flag
      now = Date.today
      a_week_ago = now - 7
      calllists = Calllist.all
      calllists.each do |c|
        if c.called && c.called_date < a_week_ago
          c.called = false
          c.save
        end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def calllist_params
      params.require(:calllist).permit(:calllists_day, :custname, :custcode, :shipto, :rep, :csr, :dept, :item, :phone, :manager, :totalitems, :called, :called_date)
    end
end
