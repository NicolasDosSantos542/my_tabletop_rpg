class AnswersController < ApplicationController


  def index
      @answers = Answer.all
  end

  def show
    @answer=Answer.find(params[:id])
  end

  def new
    @answer = Answer.new
    logger.info "\n\n\n mes couilles en ski \n\n\n"
  end

  def create
    # answer_params["choice"] = params["/choices/66/answers/"]
    # puts answer_params["choice"]
    logger.info "\n ça passe dans create \n"
 
    @choice = Choice.find(params[:choice_id])
    @comment = @choice.answers.create(comment_params)
    redirect_to choice_path(@choice)
  end



  private
    def answer_params
      params.require(:answer).permit(:description, :next, :exp, :choice)
    end
end
