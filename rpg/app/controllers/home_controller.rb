class HomeController < ApplicationController
  def index

  end

  def login

    @gm = Gm.find_by(login: params[:login], password: params[:password])
    # @userGamer =
    if @gm
      @game = Game.where( gm_id: @gm.id )

      if @game
        url = '/games/gm/'
        redirect_to  url + @gm.id.to_s
      else
        # rediriger a la creation de game
        redirect_to "/game/new"
      # redirect_to "/gms/", request.params.merge(id: @gm.id)
      end
    end


  end
end
