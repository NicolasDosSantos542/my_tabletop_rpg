class AttributesController < ApplicationController

  def index
  end

  def setAttributes
    @pointToSet = 10
    @character = Character.find(params[:character_id])
    respond_to do |format|
      format.html { render :addOnStart }
      format.json { head :no_content }
    end
  end

  def editAttributes
    @character = Character.find(params[:character_id])
    respond_to do |format|
      format.html { render :edit }
      format.json { head :no_content }
    end
  end

  def saveAttributes
    if params[:character][:life].to_i + params[:character][:strength].to_i > 30
      logger.debug "Vous avez depassez"
    elsif params[:character][:life].to_i + params[:character][:strength].to_i == 30

           @currentCharacter = Character.find(params[:character_id])
           @gamePlayer = GamePlayer.where(:character_id => params[:character_id]).first

           if @gamePlayer && (@gamePlayer.player_id == session[:user_id]) &&
             (@currentCharacter.strength + @currentCharacter.life == 20)
           @currentCharacter.update({total_life: params[:character][:life],
                                       life: params[:character][:life],
                                       total_strength: params[:character][:strength],
                                       strength: params[:character][:strength]
                                      })
           url = "/games/" +@gamePlayer.game_id.to_s+ "/character/" + @currentCharacter.id.to_s + "/1"
           redirect_to url
           else
             logger.debug "Vous n'avez pas les droits pour ce personnage"
           end
    else
      logger.debug "Pas assez de points"
    end
  end

  def saveAttributesXp
    @currentCharacter = Character.find(params[:character_id])

    @equipments = Inventory.where(:wear => true, :character_id => params[:character_id])
    @equiped = []

    if @equipments
      @equipments.each do |equipment|

        @equiped.push(Loot.find(equipment.loot_id))
      end

      @equiped.each do |equipment|
        if equipment.life
          @currentCharacter.total_life += equipment.life
          @currentCharacter.life += equipment.life
        end

        if equipment.strength
          @currentCharacter.total_strength += equipment.strength
          @currentCharacter.strength += equipment.strength
        end
      end
    end



    if params[:character][:life].to_i + params[:character][:strength].to_i > @currentCharacter.total_life + @currentCharacter.total_strength + 3
      logger.debug "Vous avez depassez"
    elsif params[:character][:life].to_i + params[:character][:strength].to_i == @currentCharacter.total_life + @currentCharacter.total_strength + 3

      @gamePlayer = GamePlayer.where(:character_id => params[:character_id]).first

      lifeToSet = params[:character][:life].to_i
      strenghtToSet = params[:character][:strength].to_i
      if @gamePlayer && (@gamePlayer.player_id == session[:user_id])

        @equiped.each do |equipment|
          if equipment.life
            lifeToSet -= equipment.life.to_i
          end

          if equipment.strength
            strenghtToSet -= equipment.strength.to_i
          end
        end

        @currentCharacter.update({total_life: lifeToSet,
                                  life: lifeToSet,
                                  total_strength: strenghtToSet,
                                  strength: strenghtToSet
                                 })
        url = "/games/" +@gamePlayer.game_id.to_s+ "/character/" + @currentCharacter.id.to_s + "/" + params[:current_step]
        redirect_to url
      else
        logger.debug "Vous n'avez pas les droits pour ce personnage"
      end
    else
      logger.debug "Pas assez de points"
    end
  end

end
