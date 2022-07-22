class Creature < ApplicationRecord
    validates :loot_id, presence: true
    validates :strength, presence: true
    validates :life, presence: true
    validates :image, presence: false
    validates :given_exp, presence: true
    

end
