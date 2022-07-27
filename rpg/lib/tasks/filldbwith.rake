namespace :filldbwith do

  places = [
    "Vous êtes dans une forêt.",
    "Vous êtes devant une falaise.",
    "Vous êtes devant un pont.",
    "Un chateau apparait devant vous.",
    "Vous arrivez dans un village.",
    "Vous arrivez devant une grande Ville.",
    "Une gigantesque Muraille vous fait face.",
    "Il y a un temple devant vous.",
    "Vous voyez une ruine ancienne recouverte de végétation.",
    "La tour d'un puissant magicien se dresse en direction du ciel.",
    "L'entrée d'une grotte se montre derrière les monceaux de lierre."

  
  ]
  answers = [
    "je vais à droite",
    "je vais à gauche",
    "je vais tout droit"
  ]

  desc 'All'
  task all: [:creatures, :loot, :choices, :steps]

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


  desc "genère des creatures"
  task creatures: :environment do
    @creature_images = Image.where("image_type = ?",["creature"])
    @creature_images.each do |image|
      @creature= {
        loot_id: rand(Loot.count),                                                   
        strength: rand(10)+1,
        life: rand(11)+5,
        image: image.path,
        given_exp: rand(11)+1,
        description: "un " + image.name + " vous fait face",
        name: image.name,

      }
      creature = Creature.new(@creature)
      creature.save
    end
  end


  desc "genere des choix avec leurs réponses"
  task choices: :environment do
    10.times {|i| 
      # puts "hello #{i}" 
      @choice = {
        description: (places[i] + "\n Que faites vous?"),                                
        step: i+1,  
      }
    
      choice=Choice.new(@choice)
      choice.save
      3.times{|n|
        @answer = {
          description: answers[n],                                
          choice_id: choice.id,                                                   
          next:rand(10)+1,                                                        
          exp: 2, 
        }
        answer = Answer.new(@answer)
        puts answer.save
      }

    }
    

  end

  desc "genere des steps"
  task steps: :environment do
    chapter = Chapter.new({name: "premier voyage", description: "C'est le grand départ! Êtes-vous prêt.e?" })
    10.times {|i| 
      # puts "hello #{i}" 
      chapter.save
      @step = {
        step_order: i + 1,                                                     
        creature_id: rand(Creature.count),                                               
        loot_id: rand(Loot.count)+1,                                                   
        chapter_id: chapter.id, 
      }
      step=Step.new(@step)
      puts step.save
      # puts @step

    }
    

  end

  desc "modifie les creatures"
  task modify: :environment do
    @creatures = Creature.all
    @creatures.each do |creature|
      creature.loot_id = rand(Loot.count)+1
      puts creature.save
    end
  end

end


