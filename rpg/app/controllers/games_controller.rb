class GamesController < ApplicationController
  before_action :set_game, only: %i[ show edit update destroy ]
  before_action :get_attributes, only: %i[ playGame, fightMonster ]
  before_action :verify_connected
  before_action :isConnected

  # GET /games or /games.json
  def index
    @games = Game.all
  end

  # GET /games/1 or /games/1.json
  def show

    @game = Game.find(params[:id])
    @channel = Channel.find(@game.channel_id)
    @gm = Gm.find(@game.gm_id)
    @idPlayers = GamePlayer.where(:game_id => @game.id)
    @currentPlayer = GamePlayer.where(game_id:@game.id, player_id: session[:user_id]).first
    @messages = Message.where(:game_id => @game.id)

    @canModify = false
    @role = session[:role]

    if session[:role] == "gm"
      if session[:user_id] == @game.gm_id
        @canModify = true
      end
    end

    if @idPlayers
      @players = []
      @idPlayers.each {
        |player|
        @players.push(Player.select("id", "login").find(player.player_id))
      }
    end
  end

  # GET /games/new
  def new
    @game = Game.new
    @chapter = Chapter.new
  end

  # GET /games/1/edit
  def edit
    puts params
    @game = Game.find(params[:id])
    if session[:role] != "gm"
      redirect_to root_path
    end
    if @game.chapter_id
      @chapter=Chapter.find(@game.chapter_id)
      @steps = Step.where("chapter_id = ?",[@game.chapter_id]).order("step_order ASC")
    end
  end

  # POST /games or /games.json
  def create
    @channel = Channel.new(name: game_params["name"])
    if @channel.save
      idChannel = Channel.find_by(name: game_params["name"])
      # newIdChannel = idChannel.merge(:id_channel => idChannel)
      new_game = game_params.merge(:channel_id => idChannel.id, :gm_id => session[:user_id])

      @game = Game.new(new_game)

      respond_to do |format|
        if @game.save
          format.html { redirect_to game_url(@game), notice: "Game was successfully created." }
          format.json { render :show, status: :created, location: @game }
        else
          puts "ca n'a pas marché"
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @game.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /games/1 or /games/1.json
  def update
    # FAIRE EN SORTE QUE L On PUISSE EDITER LA GAME AVEC L ID DU GM ACTUEL
    #
    @game = Game.find(params[:id])
    logger.debug "Person attributes id: #{@game.channel_id}"
    @channel = Channel.find_by(id: @game.channel_id)
    if @channel
      @channel.update(name: game_params["name"])
    end

    updatedGame = game_params.merge(:channel_id => @channel.id, :gm_id => session[:user_id])
    @game = @game.update(updatedGame)
    respond_to do |format|

      if @game
        @game = Game.find(params[:id])
        format.html { redirect_to request.referer, notice: "Game was successfully updated." }
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
    @games = []
    @notInGames = []
    logger.info "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    logger.debug "Person attributes id: #{session[:user_id]}"
    logger.debug "Person attributes role: #{session[:role]}"
    logger.info "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"

    if params[:entity] == "player"
      @gameForPlayer = GamePlayer.where(player_id: session[:user_id])
      respond_to do |format|
        if @gameForPlayer
          @gameForPlayer.each {
            |game|
            @games.push(Game.find(game.game_id))
          }
          @notInGames = @allGames-@games
          @entity = "player"
          format.html { render :chooseGame }
          format.json { render json: @game, status: :ok, location: @game }
        end
      end
    end

    if params[:entity] == "gm"
      @gameForGm = Game.where(gm_id: session[:user_id])
      respond_to do |format|
        if @gameForGm
          @games = @gameForGm
          format.html { render :chooseGame }
          format.json { render json: @games, status: :ok, location: @game }
        end
      end
    end
  end

  def playerJoinGame
    @game = Game.find(params[:game_id])
    if @game
      @join = GamePlayer.new(:game_id => @game.id, :player_id => session[:user_id])
      if @join.save
        respond_to do |format|
          format.html { redirect_to "/games/character/new/" + @game.id.to_s, notice: "Vous avez rejoint la partie: " + @game.name }
          format.json { head :no_content }
        end
      end
    end
  end

  def playerLeaveGame

  end

  # DELETE /games/1 or /games/1.json
  def destroy
    @game.destroy

    respond_to do |format|
      format.html { redirect_to games_url, notice: "Game was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def playGame
    @character = Character.find(params[:character_id])

    @game = Game.find(params[:game_id])
    @equipments = Inventory.where(:wear => true, :character_id => params[:character_id])
    @inventory = Inventory.where(:wear => false, :character_id => params[:character_id])
    @equiped = []
    @playerInventory = []
    @addPoint = false
    @pointToSet = 3

    if @character.experience > @game.exp_point * @character.level
      @character.level += 1
      @character.save
      @addPoint = true
    else
      @addPoint = false
    end


    if @equipments
      @equipments.each do |equipment|

        @equiped.push(Loot.find(equipment.loot_id))
      end

      @equiped.each do |equipment|
        if equipment.life && @character
          @character.total_life += equipment.life
          @character.life += equipment.life
        end

        if equipment.strength && @character
          @character.total_strength += equipment.strength
          @character.strength += equipment.strength
        end
      end
    end

    if @inventory
      @inventory.each do |equipment|
        @playerInventory.push(Loot.find(equipment.loot_id))
      end
    end

    @chapter = Chapter.find(@game.chapter_id) 
    @step = Step.where("step_order =?",[params[:current_step]]).where("chapter_id =?",[@game.chapter_id])
  end

  def fight

    @turn = params[:turn]
    logger.debug "Person attributes id: #{@turn}"
    @result = ""

    @character = Character.find(params[:character_id])
    @game = Game.find(params[:game_id])
    @equipments = Inventory.where(:wear => true, :character_id => params[:character_id])
    @inventory = Inventory.where(:wear => false, :character_id => params[:character_id])
    @equiped = []
    @playerInventory = []
    @step = Step.where("step_order =?",[params[:current_step]]).where("chapter_id =?",[@game.chapter_id]).first
    @creature = Creature.find(@step.creature_id)
    @creatureOldLife = @creature.life;

    lifeAddedByLoot = 0
    strengthAddedByLoot = 0

    if @equipments
      @equipments.each do |equipment|

        @equiped.push(Loot.find(equipment.loot_id))
      end

      @equiped.each do |equipment|
        if equipment.life
          lifeAddedByLoot += equipment.life
          @character.total_life += equipment.life
          @character.life += equipment.life
        end

        if equipment.strength
          strengthAddedByLoot += equipment.strength
          @character.total_strength += equipment.strength
          @character.strength += equipment.strength
        end
      end
    end

    if @inventory
      @inventory.each do |equipment|
        @playerInventory.push(Loot.find(equipment.loot_id))
      end
    end


    #COMBAT PAR TOUR
    if @turn.to_i % 2 == 0 && @turn.to_i != 0
      #MONSTRE
      nbrAttack = @turn.to_i / 2
      logger.info "oups le monstre m'attaque nbr fois:" + nbrAttack.to_s

      @character.life -= @creature.strength * nbrAttack

      @creature.life -= @character.strength * nbrAttack+1

      if @character.life <= 0 && @creature.life > 0
        @result = "LOOSE"
      end

    else
      if @turn.to_i != 0
        nbrAttack = (@turn.to_i+1)/2
      #PLAYER
        logger.info "je combat le monstre " + nbrAttack.to_s
        @creature.life -= @character.strength * nbrAttack
        @character.life -= @creature.strength * (nbrAttack-1)
        if @creature.life <= 0 && @character.life > 0
          @character.experience = @creature.given_xp
          @result = "WIN"
        end
      end
    end
    @turn = @turn.next()

    respond_to do |format|
      format.html { render :fightMonsterBegin }
      format.json { head :no_content }
    end

  end

  def goToNextStep
    puts "hello world"
  end

  private

  def get_attributes
    @character = Character.find(params[:character_id])
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
  def set_game
    @game = Game.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def game_params
    params.require(:game).permit(:name, :description, :string, :gm_id, :begin_level, :exp_point, :exp_coef, :channel_id, :chapter_id)
  end
end
