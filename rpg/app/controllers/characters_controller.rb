class CharactersController < ApplicationController
  before_action :set_character, only: %i[ show edit update destroy ]
  before_action :get_role
  before_action :verify_connected
  before_action :isConnected

  # GET /characters or /characters.json
  def index
    @characters = Character.all
  end

  # GET /characters/1 or /characters/1.json
  def show
  end

  # GET /characters/new
  def new
    @gameId = params[:game_id]
    @origin = "new"
    @character = Character.new
    @player = Player.find(session[:user_id])
    @character.name = @player.login
  end

  # GET /characters/1/edit
  def edit
    @origin = "edit"
  end

  # POST /characters or /characters.json
  def create
    @character = Character.new(character_params)

    respond_to do |format|
      if @character.save
        format.html { redirect_to character_url(@character), notice: "Character was successfully created." }
        format.json { render :show, status: :created, location: @character }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /characters/1 or /characters/1.json
  def update
    respond_to do |format|
      if @character.update(character_params)
        format.html { redirect_to character_url(@character), notice: "Character was successfully updated." }
        format.json { render :show, status: :ok, location: @character }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /characters/1 or /characters/1.json
  def destroy
    @character.destroy

    respond_to do |format|
      format.html { redirect_to characters_url, notice: "Character was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def get_role
      @image_type = "player"
      if session[:role]
        @role = session[:role]
      else
        @role = "none"
      end
    end

    def isConnected
      if !session[:role] && !session[:user_id]
        @connected = false
      else
        @connected = true
      end
    end

    def verify_connected
      if !session[:role] && !session[:user_id]
        redirect_to "/"
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_character
      @character = Character.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def character_params
      params.require(:character).permit(:name, :total_life, :life, :total_strength, :strength, :experience, :gold,
                                        :avatar, :game_id, :step_id, :chapter_id)
    end
end
