class ChoicesController < ApplicationController
  def index
    @choices = Choice.all
  end

  def show
    logger.info "blah" 
    @choice=Choice.find(params[:id])
  end

  def new
    @choice = Choice.new
    @choice.answers.build
  end

  def create
    @choice = Choice.new(choice_params)

    if @choice.save
      redirect_to new_choice_answer_path(@choice)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @choice = Choice.find(params[:id])
  end

  def update
    @choice = Choice.find(params[:id])

    if @choice.update(choice_params)
      redirect_to @choice
    else
      render :edit, status: :unprocessable_entity
    end

  end

  def destroy
    @choice = Choice.find(params[:id])
    @choice.destroy

    redirect_to root_path, status: :see_other
  end





  private
    def choice_params
      params.require(:choice).permit(:description, :step)
    end
end
