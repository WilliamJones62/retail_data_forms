class AltcsrsController < ApplicationController
  before_action :set_altcsr, only: [:show, :edit, :update, :destroy]
  before_action :build_csr_list, only: [:new, :edit, :list]
  before_action :build_day_list, only: [:new, :edit, :list]

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
        # format.html { redirect_to @altcsr, notice: 'Altcsr was successfully created.' }
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

  def list
    day = ['MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY', 'FRIDAY', 'HOLIDAY']
    @day = []
    i = 1
    @selected_day = 0
    day.each do |d|
      select_item = []
      select_item.push(d)
      select_item.push(i)
      @day.push(select_item)
      if d == session[:param_day]
        @selected_day = i
      end
      i += 1
    end
    session[:altcsrs_days] = @day
    if !session[:param_start]
      session[:param_start] = Date.today
    end
    if !session[:param_end]
      session[:param_end] = Date.today
    end
    @param_start = session[:param_start]
    @param_end = session[:param_end]

  end

  def selected
    csrs = []
    csrs = session[:altcsrs_csrs]
    days = []
    days = session[:altcsrs_days]
    csrs.each do |c|
      select_item = []
      select_item = c
      if params[:param_csr] == select_item[1].to_s
        session[:param_csr] = select_item[0]
        break
      end
    end
    days.each do |c|
      select_item = []
      select_item = c
      if params[:param_day] == select_item[1].to_s
        session[:param_day] = select_item[0]
        break
      end
    end

    session[:param_start] = params[:param_start]
    session[:param_end] = params[:param_end]
    redirect_to action: "list"
  end

  def multi
    calllist = Calllist.all
    tempcsr = []
    calllist.each do |c|
      if c.csr && !tempcsr.include?(c.csr)
        tempcsr.push(c.csr)
      end
    end
    csr_single = tempcsr.sort

    @calllists = []
    tempcalllists = []
    calllist.each do |c|
      if c.csr
        if c.calllists_day == session[:param_day] && c.csr == session[:param_csr]
          # include call list records that are a direct match for csr and day
          tempcalllists.push(c)
        end
      end
    end
    @calllists = tempcalllists.sort_by{ |t| [t.custcode, t.shipto, t.dept]}
    i = 0
    csr_list = params[:altcsr_list]
    @calllists.each do |c|
      altcsr = Altcsr.find_or_create_by(usualcsr: session[:param_csr], custcode: c.custcode, shipto: c.shipto, dept: c.dept, altcsrs_day: c.calllists_day)
      altcsr.altcsrs_start = session[:param_start]
      altcsr.altcsrs_end = session[:param_end]
      altcsr.altcsr = csr_single[csr_list[i].to_i - 1]
      i += 1
      altcsr.save
    end
    redirect_to action: "index"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_altcsr
      @altcsr = Altcsr.find(params[:id])
    end

    # Build a list of current CSRs
    def build_csr_list
      @csr = []
      @calllists = []
      @csr_single = []
      tempcsr = []
      calllist = Calllist.all
      calllist.each do |c|
        if c.csr && !tempcsr.include?(c.csr)
          tempcsr.push(c.csr)
        end
      end

      @csr_single = tempcsr.sort
      if !session[:param_csr] || session[:param_csr == '']
        session[:param_csr] = @csr_single[0]
        session[:param_day] = 'MONDAY'
      end

      i = 1
      @selected_csr = 0
      @csr_single.each do |c|
        select_item = []
        select_item.push(c)
        select_item.push(i)
        @csr.push(select_item)
        if c == session[:param_csr]
          @selected_csr = i
        end
        i += 1
      end
      session[:altcsrs_csrs] = @csr
      session[:csr_single] = @csr_single

      calllist.each do |c|
        if c.csr
          if (c.calllists_day == session[:param_day] || c.callback_day == session[:param_day]) && c.csr == session[:param_csr]
          # if c.calllists_day == session[:param_day] && c.csr == session[:param_csr]
            # include call list records that are a direct match for csr
            @calllists.push(c)
          end
        end
      end
    end

    # Build a list of days
    def build_day_list
      @day = ['MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY', 'FRIDAY', 'HOLIDAY']
      session[:altcsrs_days] = @day
    end

    # Build lists of current customers, shiptos and parts
    def build_lists
      @customer = []
      @allcust = []
      @allshipto = []
      @alldept = []
      @allcsr = []
      @allday = []
      @shipto = []
      @dept = []
      tempcust = []
      tempshipto = []
      tempdept = []
      csr = ' '
      day = ' '

      if @new_altcsr
        csr = @csr_single[0]
        day = @day[0]
      else
        csr = @altcsr.usualcsr
        day = @altcsr.altcsrs_day
      end

      firsttime = true
      calllist = Calllist.all
      calllist.each do |c|
        if c.csr == csr && c.calllists_day == day
          if c.custcode && !tempcust.include?(c.custcode)
            if firsttime
              firsttime = false
              customer = c.custcode
            end
            tempcust.push(c.custcode)
          end
          if c.custcode && c.custcode == customer && c.shipto && !tempshipto.include?(c.shipto)
            tempshipto.push(c.shipto)
          end
          if c.dept && !tempdept.include?(c.dept)
            tempdept.push(c.dept)
          end
        end
        @allcsr.push(c.csr)
        @allday.push(c.calllists_day)
        @allshipto.push(c.shipto)
        @alldept.push(c.dept)
        @allcust.push(c.custcode)
      end
      @customer = tempcust.sort
      @shipto = tempshipto.sort
      @dept = tempdept.sort
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def altcsr_params
      params.require(:altcsr).permit(:usualcsr, :altcsrs_day, :custcode, :shipto, :dept, :altcsr, :altcsrs_start, :altcsrs_end, :param_csr, :param_day, :param_start, :param_end, :altcsr_list[])
    end
end
