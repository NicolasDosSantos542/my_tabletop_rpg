class CreaturesController < ApplicationController
    before_action :isConnected
    def index
      @creatures = Creature.all
      @images= Image.all
    end
  
    def show
      @creature=Creature.find(params[:id])
    end
  
    def new
      @creature = Creature.new
      @image_type = "creature"
    end

    def create
      @creature = Creature.new(creature_params)
  
      if @creature.save
        redirect_to creature_path(@creature.id)
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    def edit
      @creature = Creature.find(params[:id])
      @image_type = "creature"

    end
  
    def update
      @creature = Creature.find(params[:id])
  
      if @creature.update(creature_params)
        redirect_to @creature
      else
        render :edit, status: :unprocessable_entity
      end
  
    end
  
    def destroy
      @creature = Creature.find(params[:id])
      @creature.destroy
      puts "coucou"
      puts creatures_url
      puts "tchao"
  
      redirect_to creatures_url, status: :see_other
    end
  
  
    private

      def isConnected
        if !session[:role] && !session[:user_id]
          @connected = false
        else
          @connected = true
        end
      end

      def creature_params
        params.require(:creature).permit(:loot_id, :strength, :life, :image, :given_exp, :description, :name)
      end
  end
  