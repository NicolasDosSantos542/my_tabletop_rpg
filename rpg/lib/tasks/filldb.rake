namespace :filldb do

  desc 'All'
  task all: [:creatures]

  desc "genère des creatures"
  task creatures: :environment do
    @creatures=[]
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
      @creatures.push(@creature)
    end
    puts @creatures
  end

end
