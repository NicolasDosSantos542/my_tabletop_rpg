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
        @players.push(Player.select("id", "login").find(player.id))
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
    @channel = Channel.new(name: game_params["name"])
    if @channel.save
      idChannel = Channel.find_by(name: game_params["name"])
      # newIdChannel = idChannel.merge(:id_channel => idChannel)
      new_game = game_params.merge(:channel_id => idChannel.id)
      @game = Game.new(new_game)

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

    @allGames = Game.all
    logger.info "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    logger.debug "Person attributes id: #{session[:user_id]}"
    logger.debug "Person attributes role: #{session[:role]}"
    logger.info "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"

    if params[:entity] == "player"
      @gameForPlayer = GamePlayer.where(player_id: params[:id])
      respond_to do |format|
        if @gameForPlayer
          @games = @gameForPlayer
          @entity = "player"
          format.html { render :chooseGame }
          format.json { render json: @game, status: :ok, location: @game }
        end
      end
    end

    if params[:entity] == "gm"
    # TODO mettre le player ou le gm en parametre pour savoir si c'est une game player ou gm
    @gameForGm = Game.where(gm_id: params[:id])
    respond_to do |format|
      if @gameForGm
        @games = @gameForGm
        format.html { render :chooseGame }
        format.json { render json: @games, status: :ok, location: @game }
      end
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
