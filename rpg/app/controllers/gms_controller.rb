class GmsController < ApplicationController
  before_action :set_gm, only: %i[ show edit update destroy ]

  # GET /gms or /gms.json
  def index
    @gms = Gm.all
  end

  # GET /gms/1 or /gms/1.json
  def show
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
        format.html { redirect_to gm_url(@gm), notice: "Gm was successfully created." }
        format.json { render :show, status: :created, location: @gm }
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
    @gm.destroy

    respond_to do |format|
      format.html { redirect_to gms_url, notice: "Gm was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gm
      @gm = Gm.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gm_params
      params.require(:gm).permit(:login, :password)
    end
end
