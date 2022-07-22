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
        url = '/games/gm/'
        redirect_to  url + @gm.id.to_s
      else
        puts @gm
        # rediriger a la creation de game
        redirect_to "/game/new"
      # redirect_to "/gms/", request.params.merge(id: @gm.id)
      end
    else
      #renvoyer message d erreur a la place de rediriger
      redirect_to "/gms/new"
    end
  end

  def loginplayer
    @player = Player.find_by(login: params[:login], password: params[:password])
    if @player
      @games = GamePlayer.where( player_id: @player.id )

      if @games
        url = '/games/player/'
        redirect_to  url + @player.id.to_s
      else
        # rediriger a la creation de game
        redirect_to "/games"
        # redirect_to "/gms/", request.params.merge(id: @gm.id)
      end
    else
      #renvoyer message d erreur a la place de rediriger
      redirect_to "/players/new"
    end
  end
end
