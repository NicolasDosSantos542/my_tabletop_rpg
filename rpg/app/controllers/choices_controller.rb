class ChoicesController < ApplicationController
  def index
    @choices = Choice.all
  end

  def show
    @choice=Choice.find(params[:id])
  end

  def new
    @choice = Choice.new
  end

  def create
    @choice = Choice.new(choice_params)

    if @choice.save
      redirect_to @choice
    else
      render :new, status: :unprocessable_entity
    end
  end
  private
    def choice_params
      params.require(:choice).permit(:description, :step)
    end
end
