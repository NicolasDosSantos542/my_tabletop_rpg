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

           if @gamePlayer && (@gamePlayer.player_id == session[:user_id]) || session[:role] == "gm"
             @currentCharacter.update({total_life: params[:character][:life],
                                       life: params[:character][:life],
                                       total_strength: params[:character][:strength],
                                       strength: params[:character][:strength]
                                      })
           else
             logger.debug "Vous n'avez pas les droits pour ce personnage"
           end
    else
      logger.debug "Pas assez de points"
    end
  end

end
