class AnswersController < ApplicationController


  def index
      @answers = Answer.all
  end

  def show
    @answer=Answer.find(params[:id])
  end

 
  def create
    @choice = Choice.find(params[:choice_id])
    @answer = @choice.answers.create(answer_params)
    redirect_to  request.referrer
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    redirect_to  request.referrer

  end


  private
    def answer_params
      params.require(:answer).permit(:description, :next, :exp, :choice)
    end
end
