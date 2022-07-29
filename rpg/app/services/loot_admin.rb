# app/services/tweet_creator.rb
class LootAdmin
    def initialize(loot)
      @loot = loot
    end
  
    def say_hello   
        return "hello toto #{@loot}"
     
    end
end
  
LootAdmin.new("beau gosse").say_hello