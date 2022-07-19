class GamesController < ApplicationController
  def index
    @answers = Answer.all
  end
end
