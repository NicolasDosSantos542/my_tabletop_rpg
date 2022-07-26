class GmsController < ApplicationController
  before_action :set_gm, only: %i[show edit update destroy ]
  before_action :verify_connected , only: %i[show edit update destroy ]

  # GET /gms or /gms.json
  def index
    @gms = Gm.all
  end

  # GET /gms/1 or /gms/1.json
  def show
    @gm = Gm.select("login").find(params[:id])
  end

  # GET /gms/new
  def new
    @gm = Gm.new
  end

  # GET /gms/1/edit
  def edit
  end

  # POST /gms or /gms.json
  def create
    @gm = Gm.new(gm_params)

    respond_to do |format|
      if @gm.save
        format.html do
          redirect_to root_path
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gms/1 or /gms/1.json
  def update
    respond_to do |format|
      if @gm.update(gm_params)
        format.html { redirect_to gm_url(@gm), notice: "Gm was successfully updated." }
        format.json { render :show, status: :ok, location: @gm }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gms/1 or /gms/1.json
  def destroy
    if session[:user_id] == @gm.id
      @gm.destroy

      respond_to do |format|
        format.html { redirect_to gms_url, notice: "Gm was successfully destroyed." }
        format.json { head :no_content }
      end
    end

  end

  private

  def verify_connected
    if !session[:role] && !session[:user_id]
      redirect_to "/"
    end
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_gm
      @gm = Gm.find(params[:id])
      @allowed = false
      if @gm && @gm.id == session[:user_id] && session[:role] == "gm"
        @allowed = true
      end
    end

    # Only allow a list of trusted parameters through.
    def gm_params
      params.require(:gm).permit(:login, :password)
    end
end
