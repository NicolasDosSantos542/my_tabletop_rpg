class GamesController < ApplicationController
  before_action :set_game, only: %i[ show edit update destroy ]

  # GET /games or /games.json
  def index
    @games = Game.all
  end

  # GET /games/1 or /games/1.json
  def show
       @game = Game.find(params[:id])
       @channel = Channel.find(@game.channel_id)
       @gm = Channel.find(@game.gm_id)
       @idPlayers = GamePlayer.where(:game_id => @game.id)
       @messages = Message.where(:game_id => @game.id)

       if @idPlayers
         @players = []
         @idPlayers.each {
           |player|
           @players.push(Player.select("id","login").find(player.id))
         }
       end
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games or /games.json
  def create
    @game = Game.new(game_params)
    respond_to do |format|
      if @game.save
        format.html { redirect_to game_url(@game), notice: "Game was successfully created." }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1 or /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to game_url(@game), notice: "Game was successfully updated." }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /games/user or /games.json
  def getMyGames

    @gameForGm = Game.where(gm_id: params[:id])
    respond_to do |format|
    if @gameForGm
      @games = @gameForGm
      format.html { render :chooseGame }
      format.json { render json: @games, status: :ok, location: @game }
    end
    end
  end

  # DELETE /games/1 or /games/1.json
  def destroy
    @game.destroy

    respond_to do |format|
      format.html { redirect_to games_url, notice: "Game was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def game_params
      params.require(:game).permit(:name, :description, :string, :gm_id, :channel_id)
    end
end
