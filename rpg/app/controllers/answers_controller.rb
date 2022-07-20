class AnswersController < ApplicationController

    # def index
        # @choice = Choice.find(params[:choice_id])
        # @answer = @choice.answers.create(answer_params)
        # redirect_to choice_path(@choice)
    # end
    def index
        @answers = Answer.all
      end


    def new
        @answer = Answer.new
      end

    private
        def answer_params
          params.require(:answer).permit(:description, :next, :step)
        end
end
