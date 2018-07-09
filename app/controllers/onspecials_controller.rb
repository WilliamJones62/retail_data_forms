class OnspecialsController < ApplicationController
  before_action :set_onspecial, only: [:show, :edit, :update, :destroy]

  # GET /onspecials
  def index
    @onspecials = Onspecial.all
  end

  # GET /onspecials/1
  def show
  end

  # GET /onspecials/new
  def new
    @new_onspecial = true
    build_lists
    @onspecial = Onspecial.new
  end

  # GET /onspecials/1/edit
  def edit
    @new_onspecial = false
    build_lists
  end

  # POST /onspecials
  def create
    if onspecial_params[:customer] == 'ALL'
      authorlists = Authorlist.all
      authorlists.each do |a|
        if onspecial_params[:part] == a.partcode
          op = onspecial_params
          op[:customer] = a.custcode
          @onspecial = Onspecial.new(op)
          @onspecial.save
        end
      end
      redirect_to action: "index", notice: 'Onspecials were successfully created.'
    else
      @onspecial = Onspecial.new(onspecial_params)

      respond_to do |format|
        if @onspecial.save
          format.html { redirect_to @onspecial, notice: 'Onspecial was successfully created.' }
        else
          format.html { render :new }
        end
      end
    end
  end

  # PATCH/PUT /onspecials/1
  def update
    if onspecial_params[:customer] == 'ALL'
      authorlists = Authorlist.all
      authorlists.each do |a|
        if onspecial_params[:part] == a.partcode
          op = onspecial_params
          op[:customer] = a.custcode
          @onspecial.update(op)
        end
      end
      redirect_to action: "index", notice: 'Onspecials were successfully created.'
    else
      respond_to do |format|
        if @onspecial.update(onspecial_params)
          format.html { redirect_to @onspecial, notice: 'Onspecial was successfully updated.' }
        else
          format.html { render :edit }
        end
      end
    end
  end

  # DELETE /onspecials/1
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
      @allcust = []
      @allpart = []

      if @new_onspecial
        cust = 'ALL'
      else
        cust = @onspecial.customer
      end

      tempcust = []
      temppart = []
      authorlist = Authorlist.all
      authorlist.each do |a|
        if (cust =='ALL' || a.custcode == cust) && !temppart.include?(a.partcode)
          temppart.push(a.partcode)
        end
        if !tempcust.include?(a.custcode)
          tempcust.push(a.custcode)
        end
        @allcust.push(a.custcode)
        @allpart.push(a.partcode)
      end

      @customer = tempcust.sort
      if @new_onspecial
        @customer.insert(0,'ALL')
      end
      @part = temppart.sort
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def onspecial_params
      params.require(:onspecial).permit(:customer, :part, :onspecials_start, :onspecials_end)
    end
end
