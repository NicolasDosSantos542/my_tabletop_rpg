class HomeController < ApplicationController
  def index

  end

  def login

    @gm = Gm.find_by(params[:gm])
    # @userGamer =
    if @gm
      @game = Game.find_by({ gm_id: @gm.id })

      if @game
        redirect_to @game
      else
        redirect_to @gm
      # redirect_to "/gms/", request.params.merge(id: @gm.id)
        end
    end
  end
end
