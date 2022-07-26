namespace :filldb do

  desc 'All'
  task all: [:creatures]

  desc "genère des creatures"
  task creatures: :environment do
    @creature_images = Image.where("image_type = ?",["creature"])
    @creature_images.each do |image|
      @creature= {
        loot_id: rand(60),
        strength: rand(10),
        life: rand(10),
        image: image.path,
        given_exp: rand(10),
        description: "un " + image.name + " vous fait face",
        name: image.name,

      }
      creature = Creature.new(@creature)
      creature.save
    end
  end

  desc "genere des objets de loot"
  task loot: :environment do
    @loot_images= Image.where("image_type = ?",["loot"])
    @loot_images.each do |image|
      @loot= {
        life: image.loot_value+1,                                                          
        strength: (image.loot_value * 3),                                                      
        exp:( image.loot_value * 2),                                                           
        image: image.path,                                     
        name: image.name,
      }
      puts @loot
      loot = Loot.new(@loot)
      loot.save
    
    end
  end

  desc "genere des choix avec leurs réponses"
  task choices: :environment do

  end

end
