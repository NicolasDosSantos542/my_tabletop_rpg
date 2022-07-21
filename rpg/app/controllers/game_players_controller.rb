class GamePlayersController < ApplicationController
  before_action :set_game_player, only: %i[ show edit update destroy ]

  # GET /game_players or /game_players.json
  def index
    @game_players = GamePlayer.all
  end

  # GET /game_players/1 or /game_players/1.json
  def show
  end

  # GET /game_players/new
  def new
    @game_player = GamePlayer.new
  end

  # GET /game_players/1/edit
  def edit
  end

  # POST /game_players or /game_players.json
  def create
    @game_player = GamePlayer.new(game_player_params)

    respond_to do |format|
      if @game_player.save
        format.html { redirect_to game_player_url(@game_player), notice: "Game player was successfully created." }
        format.json { render :show, status: :created, location: @game_player }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @game_player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /game_players/1 or /game_players/1.json
  def update
    respond_to do |format|
      if @game_player.update(game_player_params)
        format.html { redirect_to game_player_url(@game_player), notice: "Game player was successfully updated." }
        format.json { render :show, status: :ok, location: @game_player }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @game_player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /game_players/1 or /game_players/1.json
  def destroy
    @game_player.destroy

    respond_to do |format|
      format.html { redirect_to game_players_url, notice: "Game player was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_player
      @game_player = GamePlayer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def game_player_params
      params.require(:game_player).permit(:player_id, :game_id)
    end
end
