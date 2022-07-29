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
      return [first,others[0],others[1]]

    end
end
  
# LootAdmin.new("beau gosse").say_hello