class AuthorlistsController < ApplicationController
  before_action :set_authorlist, only: [:show, :edit, :update, :destroy]
  before_action :build_customer_list, only: [:index]

  # GET /authorlists
  # GET /authorlists.json
  def index
  end

  # GET /authorlists/1
  # GET /authorlists/1.json
  def show
  end

  # GET /authorlists/new
  def new
    @authorlist = Authorlist.new
  end

  # GET /authorlists/1/edit
  def edit
  end

  # POST /authorlists
  # POST /authorlists.json
  def create
    @authorlist = Authorlist.new(authorlist_params)

    respond_to do |format|
      if @authorlist.save
        format.html { redirect_to @authorlist, notice: 'Authorlist was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /authorlists/1
  # PATCH/PUT /authorlists/1.json
  def update
    respond_to do |format|
      if @authorlist.update(authorlist_params)
        format.html { redirect_to @authorlist, notice: 'Authorlist was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /authorlists/1
  # DELETE /authorlists/1.json
  def destroy
    @authorlist.destroy
    respond_to do |format|
      format.html { redirect_to authorlists_url, notice: 'Authorlist was successfully destroyed.' }
    end
  end

  def selected
    customers = []
    customers = $author_customers
    customers.each do |c|
      select_item = []
      select_item = c
      if params[:author_custcode] == select_item[1].to_s
        session[:author_custcode] = select_item[0]
        break
      end
    end
    redirect_to action: "index"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_authorlist
      @authorlist = Authorlist.find(params[:id])
    end

    # Build a list of current customers
    def build_customer_list
      @custcode = []
      custcode = []
      tempcust = []
      authorlist = Authorlist.all
      authorlist.each do |a|
        if !tempcust.include?(a.custcode)
          tempcust.push(a.custcode)
        end
      end
      custcode = tempcust.sort

      if !session[:author_custcode] || session[:author_custcode == '']
        # not returning from update of called flag
        session[:author_custcode] = custcode[0]
      end

      i = 1
      @selected_customer = 0
      custcode.each do |c|
        select_item = []
        select_item.push(c)
        select_item.push(i)
        @custcode.push(select_item)
        if c == session[:author_custcode]
          @selected_customer = i
        end
        i += 1
      end
      $author_customers = @custcode

    # Set up the author list for the first customer or the returning customer
      @authorlists = []

      authorlist.each do |c|
        if c.custcode and c.custcode == session[:author_custcode]
          # include author list records that are a direct match for customer
          @authorlists.push(c)
        end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def authorlist_params
      params.require(:authorlist).permit(:partcode, :dept, :custcode, :turns, :seq, :priority, :author_custcode)
    end
end
