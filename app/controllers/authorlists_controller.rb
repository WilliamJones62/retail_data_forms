class AuthorlistsController < ApplicationController
  before_action :set_authorlist, only: [:show, :edit, :update, :destroy]

  # GET /authorlists
  # GET /authorlists.json
  def index
    @authorlists = Authorlist.all
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
        format.json { render :show, status: :created, location: @authorlist }
      else
        format.html { render :new }
        format.json { render json: @authorlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /authorlists/1
  # PATCH/PUT /authorlists/1.json
  def update
    respond_to do |format|
      if @authorlist.update(authorlist_params)
        format.html { redirect_to @authorlist, notice: 'Authorlist was successfully updated.' }
        format.json { render :show, status: :ok, location: @authorlist }
      else
        format.html { render :edit }
        format.json { render json: @authorlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /authorlists/1
  # DELETE /authorlists/1.json
  def destroy
    @authorlist.destroy
    respond_to do |format|
      format.html { redirect_to authorlists_url, notice: 'Authorlist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_authorlist
      @authorlist = Authorlist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def authorlist_params
      params.require(:authorlist).permit(:partcode, :dept, :custcode, :turns, :seq, :priority)
    end
end
