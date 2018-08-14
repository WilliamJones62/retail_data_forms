class CalllistsController < ApplicationController
  before_action :set_calllist, only: [:show, :edit, :update, :destroy]
  before_action :build_csr_list, only: [:list]
  before_action :build_route_list, only: [:routelist]
  before_action :reset_called_flag, only: [:index, :list]

  # GET /calllists
  def index
    @calllists = Calllist.all
    session[:list] = false
    session[:route_list] = false
  end

  # GET /calllists/1
  def show
  end

  # GET /calllists/new
  def new
    @day = ['MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY', 'FRIDAY', 'HOLIDAY']
    @cb_day = [' ', 'MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY', 'FRIDAY', 'HOLIDAY']
    @calllist = Calllist.new
  end

  # GET /calllists/1/edit
  def edit
    @day = ['MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY', 'FRIDAY', 'HOLIDAY']
    @cb_day = [' ', 'MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY', 'FRIDAY', 'HOLIDAY']
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
    respond_to do |format|
      cp = calllist_params
      if calllist_params[:called] && @calllist.called != calllist_params[:called]
        cp[:called_date] = Date.today
      end
      if @calllist.notes != calllist_params[:notes] && calllist_params[:notes] != '' && calllist_params[:notes] != ' '
        # if notes have changed to something other than nothing add today's date
        notes = cp[:notes]
        formatted = Date.today.strftime("%e %b %Y")
        cp[:notes] = notes + ' (' + formatted + ')'
      end
      if @calllist.instructions != calllist_params[:instructions] && calllist_params[:instructions] != '' && calllist_params[:instructions] != ' '
        # if instructions have changed to something other than nothing add today's date
        instructions = cp[:instructions]
        formatted = Date.today.strftime("%e %b %Y")
        cp[:instructions] = instructions + ' (' + formatted + ')'
      end
      # if session[:list] || session[:route_list]
      if @calllist.update(cp)
        if session[:list]
          format.html { redirect_to action: "list", notice: 'Calllist was successfully updated.'}
        elsif session[:route_list]
          format.html { redirect_to action: "routelist", notice: 'Calllist was successfully updated.'}
        else
          format.html { redirect_to @calllist, notice: 'Calllist was successfully updated.' }
        end
      else
        format.html { render :edit }
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
    day = ['MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY', 'FRIDAY', 'HOLIDAY']
    @day = []
    i = 1
    @selected_day = 0
    day.each do |d|
      select_item = []
      select_item.push(d)
      select_item.push(i)
      @day.push(select_item)
      if d == session[:called_day]
        @selected_day = i
      end
      i += 1
    end
    session[:calllist_days] = @day
    session[:list] = true
    session[:route_list] = false
  end

  def selected
    csrs = []
    csrs = session[:calllist_csrs]
    days = []
    days = session[:calllist_days]
    csrs.each do |c|
      select_item = []
      select_item = c
      if params[:called_csr] == select_item[1].to_s
        session[:called_csr] = select_item[0]
        break
      end
    end
    days.each do |c|
      select_item = []
      select_item = c
      if params[:called_day] == select_item[1].to_s
        session[:called_day] = select_item[0]
        break
      end
    end
    redirect_to action: "list"
  end

  def routelist
    session[:list] = false
    session[:route_list] = true
  end

  def routeselected
    csrs = []
    csrs = session[:calllist_csrs]
    csrs.each do |c|
      select_item = []
      select_item = c
      if params[:called_csr] == select_item[1].to_s
        session[:called_csr] = select_item[0]
        break
      end
    end
    routes = []
    routes = session[:calllist_routes]
    routes.each do |c|
      select_item = []
      select_item = c
      if params[:called_route] == select_item[1].to_s
        session[:called_route] = select_item[0]
        break
      end
    end
    redirect_to action: "routelist"
  end

  def not_called
    @report_list = Calllist.all
  end

  def not_ordered
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
      @csr = []
      csr = []
      tempcsr = []
      calllist = Calllist.all
      calllist.each do |c|
        if c.csr && !tempcsr.include?(c.csr)
          tempcsr.push(c.csr)
        end
      end

      csr = tempcsr.sort
      if !session[:called_csr] || session[:called_csr == '']
        # not returning from update of called flag
        session[:called_csr] = csr[0]
        session[:called_day] = 'MONDAY'
      end

      i = 1
      @selected_csr = 0
      csr.each do |c|
        select_item = []
        select_item.push(c)
        select_item.push(i)
        @csr.push(select_item)
        if c == session[:called_csr]
          @selected_csr = i
        end
        i += 1
      end
      session[:calllist_csrs] = @csr

    # Set up the call list for the first CSR or the returning CSR after 'called' flag update
      @calllists = []

      @altcsr = []
      @usualcsr = []
      @shipto = []
      @altcsrs_day = []
      @custcode = []
      now = Date.today
      altcsr = Altcsr.all
      altcsr.each do |a|
        if a.altcsrs_start <= now + 1 && a.altcsrs_end >= now
          @altcsr.push(a.altcsr)
          @usualcsr.push(a.usualcsr)
          @shipto.push(a.shipto)
          @altcsrs_day.push(a.altcsrs_day)
          @custcode.push(a.custcode)
        end
      end

      calllist.each do |c|
        if c.csr
          altcsr_found = false
          altcsr_length = @altcsr.length
          i = 0
          while i < altcsr_length
            if @usualcsr[i] == c.csr && session[:called_csr] == @altcsr[i] && c.custcode == @custcode[i] && c.shipto == @shipto[i] && c.calllists_day == @altcsrs_day[i]
              altcsr_found = true
              break
            end
            i += 1
          end
          if (c.calllists_day == session[:called_day] || c.callback_day == session[:called_day]) && (c.csr == session[:called_csr] || altcsr_found)
            # include call list records that are a direct match for csr and also if there is an altcsr override active for another csr
            @calllists.push(c)
          end
        end
      end
    end

    # Build a list of current routes
    def build_route_list
      @csr = []
      csr = []
      tempcsr = []
      calllist = Calllist.all
      calllist.each do |c|
        if c.csr && !tempcsr.include?(c.csr)
          tempcsr.push(c.csr)
        end
      end

      csr = tempcsr.sort
      if !session[:called_csr] || session[:called_csr == '']
        # not returning from update of called flag
        session[:called_csr] = csr[0]
      end

      i = 1
      @selected_csr = 0
      csr.each do |c|
        select_item = []
        select_item.push(c)
        select_item.push(i)
        @csr.push(select_item)
        if c == session[:called_csr]
          @selected_csr = i
        end
        i += 1
      end
      session[:calllist_csrs] = @csr

      @route = []
      route = []
      temproute = []
      routes = Shipto.all
      calllist = Calllist.all
      route_array = []
      shipto_array = []
      routes.each do |r|
        route_array.push(r.route_code)
        shipto_array.push(r.shipto_code)
      end

    # Set up the call list for the first route or the returning route
      @route_calllists = []

      if !session[:called_route] || session[:called_route == '']
      # the route has not been set so default to the first route I know is valid (this is bad code)
        session[:called_route] = 'AM'
      end

      calllist.each do |c|
        if c.csr
          i = shipto_array.index(c.shipto)
          if i && route_array[i] && !temproute.include?(route_array[i])
            # found a match on shipto so store the accompanying route
            temproute.push(route_array[i])
          end
          if c.shipto && i && route_array[i] == session[:called_route] && c.csr == session[:called_csr]
            # include call list records that are a direct match for route via shipto
            @route_calllists.push(c)
          end
        end
      end
      route = temproute.sort
      i = 1
      @selected_route = 0
      route.each do |c|
        select_item = []
        select_item.push(c)
        select_item.push(i)
        @route.push(select_item)
        if c == session[:called_route]
          @selected_route = i
        end
        i += 1
      end
      session[:calllist_routes] = @route
    end

    # After seven days reset the called flag to false.
    def reset_called_flag
      now = Date.today
      a_week_ago = now - 6
      calllists = Calllist.all
      calllists.each do |c|
        if c.called && c.called_date < a_week_ago
          c.called = false
          c.ordered = false
          c.save
        end
        if c.callback_day && c.callback_day != '' && c.callback_date && c.callback_date < a_week_ago
          c.callback_day = ''
          c.save
        end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def calllist_params
      params.require(:calllist).permit(:calllists_day, :custname, :custcode, :shipto, :rep, :csr, :dept, :item, :phone, :manager, :totalitems, :called, :called_date, :id, :ordered, :notes, :called_csr, :called_day, :called_route, :callback_day, :callback_date, :instructions)
    end
end
