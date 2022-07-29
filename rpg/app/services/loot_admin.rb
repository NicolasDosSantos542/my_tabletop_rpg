# app/services/tweet_creator.rb
class LootAdmin
    def initialize()
    end
  
    def say_hello   
        return "hello toto #{@loot}"
     
    end
    def select_loot(loot_id)
      first = Loot.find(loot_id)
      others = Loot.where("strength <= ?", [first.strength])

      return [first,others[rand(others.count())],others[rand(others.count())]]

    end

    def add_loot_in_inventory(data)
      current = Inventory.where("character_id = ?",[data[:character_id]]).order("created_at ASC")

      if current.count()>16
        current.first.delete
        
      end
      add = Inventory.new({ 
        loot_id:data[:loot_id],                                                       
        player_id:data[:player_id],                                                     
        character_id:data[:character_id],                                                  
        game_id:data[:game_id],                                                       
        wear: false, })
      
      add.save

    end
end
  
# LootAdmin.new("beau gosse").say_hello