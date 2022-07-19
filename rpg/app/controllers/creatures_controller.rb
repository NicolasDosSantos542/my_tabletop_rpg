class CreaturesController < ApplicationController
  before_action :set_creature, only: %i[ show edit update destroy ]

  # GET /creatures or /creatures.json
  def index
    @creatures = Creature.all
  end

  # GET /creatures/1 or /creatures/1.json
  def show
  end

  # GET /creatures/new
  def new
    @creature = Creature.new
  end

  # GET /creatures/1/edit
  def edit
  end

  # POST /creatures or /creatures.json
  def create
    @creature = Creature.new(creature_params)

    respond_to do |format|
      if @creature.save
        format.html { redirect_to creature_url(@creature), notice: "Creature was successfully created." }
        format.json { render :show, status: :created, location: @creature }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @creature.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /creatures/1 or /creatures/1.json
  def update
    respond_to do |format|
      if @creature.update(creature_params)
        format.html { redirect_to creature_url(@creature), notice: "Creature was successfully updated." }
        format.json { render :show, status: :ok, location: @creature }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @creature.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /creatures/1 or /creatures/1.json
  def destroy
    @creature.destroy

    respond_to do |format|
      format.html { redirect_to creatures_url, notice: "Creature was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_creature
      @creature = Creature.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def creature_params
      params.require(:creature).permit(:name, :description)
    end
end
