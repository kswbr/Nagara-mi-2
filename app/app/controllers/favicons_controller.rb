class FaviconsController < ApplicationController
  before_action :set_favicon, only: [:show, :edit, :update, :destroy]

  # GET /favicons
  # GET /favicons.json
  def index
    @favicons = Favicon.all
  end

  # GET /favicons/1
  # GET /favicons/1.json
  def show
  end

  # GET /favicons/new
  def new
    @favicon = Favicon.new
  end

  # GET /favicons/1/edit
  def edit
  end

  # POST /favicons
  # POST /favicons.json
  def create
    @favicon = Favicon.new(favicon_params)

    respond_to do |format|
      if @favicon.save
        format.html { redirect_to @favicon, notice: 'Favicon was successfully created.' }
        format.json { render :show, status: :created, location: @favicon }
      else
        format.html { render :new }
        format.json { render json: @favicon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /favicons/1
  # PATCH/PUT /favicons/1.json
  def update
    respond_to do |format|
      if @favicon.update(favicon_params)
        format.html { redirect_to @favicon, notice: 'Favicon was successfully updated.' }
        format.json { render :show, status: :ok, location: @favicon }
      else
        format.html { render :edit }
        format.json { render json: @favicon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favicons/1
  # DELETE /favicons/1.json
  def destroy
    @favicon.destroy
    respond_to do |format|
      format.html { redirect_to favicons_url, notice: 'Favicon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favicon
      @favicon = Favicon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def favicon_params
      params.require(:favicon).permit(:image, :image_type, :site_id)
    end
end
