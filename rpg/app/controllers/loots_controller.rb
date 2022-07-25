class LootsController < ApplicationController
  before_action :set_loot, only: %i[ show edit update destroy ]

  # GET /loots or /loots.json
  def index
    @loots = Loot.all
  end

  # GET /loots/1 or /loots/1.json
  def show
  end

  # GET /loots/new
  def new
    @loot = Loot.new
  end

  # GET /loots/1/edit
  def edit
  end

  # POST /loots or /loots.json
  def create
    @loot = Loot.new(loot_params)

    respond_to do |format|
      if @loot.save
        format.html { redirect_to loot_url(@loot), notice: "Loot was successfully created." }
        format.json { render :show, status: :created, location: @loot }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @loot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loots/1 or /loots/1.json
  def update
    respond_to do |format|
      if @loot.update(loot_params)
        format.html { redirect_to loot_url(@loot), notice: "Loot was successfully updated." }
        format.json { render :show, status: :ok, location: @loot }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @loot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loots/1 or /loots/1.json
  def destroy
    @loot.destroy

    respond_to do |format|
      format.html { redirect_to loots_url, notice: "Loot was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loot
      @loot = Loot.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def loot_params
      params.require(:loot).permit(:life, :strength, :exp, :image)
    end
end
