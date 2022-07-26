class PlayersController < ApplicationController
  before_action :set_player, only: %i[ show edit update destroy ]
  before_action :verify_connected, only: %i[ show edit update destroy ]

  # GET /players or /players.json
  def index
    @players = Player.all
  end

  # GET /players/1 or /players/1.json
  def show
    @player = Player.select("login").find(params[:id])
  end

  # GET /players/new
  def new
    @player = Player.new
  end

  # GET /players/1/edit
  def edit
  end

  # POST /players or /players.json
  def create
    @player = Player.new(player_params)

    respond_to do |format|
      if @player.save
        format.html do
          redirect_to root_path
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /players/1 or /players/1.json
  def update
    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to player_url(@player), notice: "Player was successfully updated." }
        format.json { render :show, status: :ok, location: @player }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1 or /players/1.json
  def destroy
    if session[:user_id] == @player.id
      @player.destroy
      respond_to do |format|
        format.html { redirect_to players_url, notice: "Player was successfully destroyed." }
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
    def set_player
      @player = Player.find(params[:id])
      @allowed = false
      if @player && @player.id == session[:user_id] && session[:role] == "player"
        @allowed = true
      end
    end

    # Only allow a list of trusted parameters through.
    def player_params
      params.require(:player).permit(:login, :password)
    end
end
