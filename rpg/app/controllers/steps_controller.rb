class StepsController < ApplicationController
  def index
    @steps = Step.all
  end

  def show
    @step=Step.find(params[:id])
  end

  def new
    @step = Step.new
  end

 

  def create
    @step = Step.new(step_params)

    if @step.save
      redirect_to step_path(@step.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @step = Step.find(params[:id])
  end

  def update
    @step = Step.find(params[:id])

    if @step.update(step_params)
      redirect_to @step
    else
      render :edit, status: :unprocessable_entity
    end

  end

  def destroy
    @step = Step.find(params[:id])
    @step.destroy
    puts "coucou"
    puts steps_url
    puts "tchao"

    redirect_to steps_url, status: :see_other
  end


  private
    def step_params
      params.require(:step).permit(:order, :loot_id, :creature_id)
    end
end
