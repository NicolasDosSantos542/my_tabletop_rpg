namespace :filldbwithimages do
    creatures = [
        {
          path: "creatures/inquisitor.png",
          name: "inquisitor",
          image_type: "creature"
        },{
          path: "creatures/gobelin.jpg",
          name: "gobelin",
          image_type: "creature"
        },{
          path: "creatures/wizard.jpg",
          name: "wizard",
          image_type: "creature"
        },{
          path: "creatures/rapier_master.jpg",
          name: "rapier_master",
          image_type: "creature"
        },{
          path: "creatures/brawler.jpg",
          name: "brawler",
          image_type: "creature"
        },{
          path: "creatures/barbarian.jpg",
          name: "barbarian",
          image_type: "creature"
        },{
          path: "creatures/lich.jpg",
          name: "lich",
          image_type: "creature"
        },{
          path: "creatures/mutated_bear.jpg",
          name: "mutated_bear",
          image_type: "creature"
        },{
          path: "creatures/dark_knight.jpg",
          name: "dark_knight",
          image_type: "creature"
        },{
          path: "creatures/red_dragonjpg.jpg",
          name: "red_dragonjpg",
          image_type: "creature"
        },{
          path: "creatures/gobbeast.jpg",
          name: "gobbeast",
          image_type: "creature"
        },{
          path: "creatures/sorceress.jpg",
          name: "sorceress",
          image_type: "creature"
        },{
          path: "creatures/vampire.png",
          name: "vampire",
          image_type: "creature"
        },{
          path: "creatures/troll.jpg",
          name: "troll",
          image_type: "creature"
        },{
          path: "creatures/ork.png",
          name: "ork",
          image_type: "creature"
        },{
          path: "creatures/warrior.png",
          name: "warrior",
          image_type: "creature"
        },{
          path: "creatures/knight.png",
          name: "knight",
          image_type: "creature"
        },{
          path: "creatures/wolf.jpg",
          name: "wolf",
          image_type: "creature"
        },{
          path: "creatures/elf_rogue.jpg",
          name: "elf_rogue",
          image_type: "creature"
        },{
          path: "creatures/Skum.png",
          name: "Skum",
          image_type: "creature"
        },{
          path: "creatures/gob_mage.png",
          name: "gob_mage",
          image_type: "creature"
        },{
          path: "creatures/skeletton.jpg",
          name: "skeletton",
          image_type: "creature"
        },{
          path: "creatures/priest.jpg",
          name: "priest",
          image_type: "creature"
        },{
          path: "creatures/ogres.png",
          name: "ogres",
          image_type: "creature"
        },{
          path: "creatures/gnome_magister.jpg",
          name: "gnome_magister",
          image_type: "creature"
        }
      ]

    avatars = 
      [
        {
          path: "players/monk.jpg",
          name: "monk",
          image_type: "player"
          },{
          path: "players/guardian.jpg",
          name: "guardian",
          image_type: "player"
          },{
          path: "players/bard.jpg",
          name: "bard",
          image_type: "player"
          },{
          path: "players/barbarian.jpg",
          name: "barbarian",
          image_type: "player"
          },{
          path: "players/ranger.jpg",
          name: "ranger",
          image_type: "player"
          },{
          path: "players/alchemist.jpg",
          name: "alchemist",
          image_type: "player"
          },{
          path: "players/paladin.jpg",
          name: "paladin",
          image_type: "player"
          },{
          path: "players/shaman.jpg",
          name: "shaman",
          image_type: "player"
          },{
          path: "players/summoner.jpg",
          name: "summoner",
          image_type: "player"
          },{
          path: "players/necromancer.jpg",
          name: "necromancer",
          image_type: "player"
          },{
          path: "players/characters.jpg",
          name: "characters",
          image_type: "player"
          },{
          path: "players/cleric.jpg",
          name: "cleric",
          image_type: "player"
          },{
          path: "players/mage.jpg",
          name: "mage",
          image_type: "player"
          },{
          path: "players/swashbuckler.jpg",
          name: "swashbuckler",
          image_type: "player"
          },{
          path: "players/druid.jpg",
          name: "druid",
          image_type: "player"
          },{
          path: "players/ligne4.jpg",
          name: "ligne4",
          image_type: "player"
          },{
          path: "players/enchanter.jpg",
          name: "enchanter",
          image_type: "player"
          },{
          path: "players/assassin.jpg",
          name: "assassin",
          image_type: "player"
          }
      ]
      
      
      
      
      
      



    
    desc "put creatures path to images in db"
    task :creatures => :environment do

        # toto= Dir.entries("app/assets/images/creatures")
        creatures.each do |creature|
            image = Image.new(creature)
            puts image.save
        end
    end

    desc "put player images in the db"
    task :players => :environment do
        avatars.each do |avatar|
            image = Image.new(avatar)
            puts image.save
        end

    end

    desc "put loot images in the db"
    task :loot => :environment do
        # avatars.each do |avatar|
        #     image = Image.new(avatar)
        #     puts image.save
        # end
        @loot_array= Array.new
        @values = {"0": 'wood',"1": 'iron', "2": 'steel',"3": 'plate',"4": 'gold',"5": 'dark', "6": 'light'}
        Dir.entries("app/assets/images/loot").each do |entrie|
          if entrie.chars[0] != "."
            name =  entrie.split(".")[0]
            loot_type = name.split("_")[1]
            loot_material = name.split("_")[0]
            final_name = loot_material +" "+loot_type
            loot_value =@values.key(loot_material)
            element= {
              "path": "loot/"+ entrie  ,
              "name": final_name,
              "image_type": "loot",
              "loot_material":  loot_material  ,
              "loot_type": loot_type,
              "loot_value": loot_value.to_s.to_i
              }
              @loot_array.push(element)
          end
        end
        # puts @loot_array
        @loot_array.each do |loot|
          image = Image.new(loot)
          puts image.save
        end
    end
 
end


