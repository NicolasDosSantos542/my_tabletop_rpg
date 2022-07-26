class GamePlayersController < ApplicationController
  before_action :set_game_player, only: %i[ show edit update destroy ]
  before_action :verify_connected
  before_action :isConnected

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

  def playerLeaveGame
    @deletePlayerGame = GamePlayer.where(:game_id => params[:game_id], :player_id => session[:user_id]).first
    @game = Game.find(params[:game_id])
    if @deletePlayerGame
      if @deletePlayerGame.destroy
        respond_to do |format|
          format.html { redirect_to "/games/viewAll/player/"+ session[:user_id].to_s, notice: "Vous avez quitter la partie: " + @game.name }
          format.json { head :no_content }
        end
      end
    end
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
    def set_game_player
      @game_player = GamePlayer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def game_player_params
      params.require(:game_player).permit(:player_id, :game_id)
    end
end
