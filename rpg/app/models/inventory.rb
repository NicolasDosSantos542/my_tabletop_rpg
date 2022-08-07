class Inventory < ApplicationRecord
  belongs_to :player
  belongs_to :character
  belongs_to :game
end
