class StepsController < ApplicationController
  before_action :isConnected
  def index
    @steps = Step.all
  end

  def show
    @step=Step.find(params[:id])
    @creature = Creature.find( @step.creature_id)

  end

  def new
    @step = Step.new
    @chapter_id=params[:chapter_id]
  end

 

  def create
    @step = Step.new(step_params)

    if @step.save
      redirect_to step_path(@step.id)
    else
      render :back, status: :unprocessable_entity
    end
  end

  def edit
    @step = Step.find(params[:id])
  end

  def update
    @step = Step.find(params[:id])

    if @step.update(step_params)
      redirect_to request.referrer
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
    def isConnected
      if !session[:role] && !session[:user_id]
        @connected = false
      else
        @connected = true
      end
    end
    def step_params
      params.require(:step).permit(:step_order, :loot_id, :creature_id, :chapter_id, :fight_next_step)
    end
end
