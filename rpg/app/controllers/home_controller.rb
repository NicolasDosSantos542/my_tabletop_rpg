class HomeController < ApplicationController
  before_action :set_form

  def set_form
  end

  # def setfalse
  #
  #   @type = false
  #   render '/home/index', type: @type
  #
  # end

  # def settrue
  #   @type = true
  # end

  def test
    @type = true
    redirect_back(fallback_location: root_path)
  end

  def index
    @beforetype = params[:type]
    if @beforetype

      # params[:type]
      @type = params[:type]
      redirect_back(fallback_location: root_path)

    end
  end

  def loggm
    render "home/logingm"
  end

  def logplayer
    render "home/loginplayer"
  end

  def logingm

    @gm = Gm.find_by(login: params[:login], password: params[:password])
    # @userGamer =
    if @gm
      @game = Game.where( gm_id: @gm.id )

      if @game
        session[:user_id] = @gm.id
        session[:role] = "gm"
        url = '/games/viewAll/gm/'
        redirect_to  url + @gm.id.to_s
      else
        puts @gm
        # rediriger a la creation de game
        redirect_to "/game/new"
      # redirect_to "/gms/", request.params.merge(id: @gm.id)
      end
    else
      respond_to do |format|
        format.html { redirect_to '/home/gm', notice: "Login ou mot de passe incorrect" }
        format.json { head :no_content }
      end
    end
  end

  def loginplayer
    @player = Player.find_by(login: params[:login], password: params[:password])
    if @player
      session[:user_id] = @player.id
      session[:role] = "player"
      @games = GamePlayer.where( player_id: @player.id )

      if @games
        url = '/games/viewAll/player/'
        redirect_to  url + @player.id.to_s
      else
        # rediriger a la creation de game
        redirect_to "/games"
        # redirect_to "/gms/", request.params.merge(id: @gm.id)
      end
    else
      respond_to do |format|
        format.html { redirect_to '/home/player', notice: "Login ou mot de passe incorrect" }
        format.json { head :no_content }
      end
    end
  end

  def disconnect
    reset_session
    redirect_to ""
  end
end
