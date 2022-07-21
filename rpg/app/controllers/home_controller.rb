class HomeController < ApplicationController
  def index

  end

  def login

    @gm = Gm.find_by(params[:gm])
    # @userGamer =
    if @gm
      @game = Game.find_by({ gm_id: @gm.id })

      if @game
        id = @game.id
        url = '/games/gm/'
        redirect_to  url + id.to_s
      else
        redirect_to @gm
      # redirect_to "/gms/", request.params.merge(id: @gm.id)
      end
    end


  end
end
