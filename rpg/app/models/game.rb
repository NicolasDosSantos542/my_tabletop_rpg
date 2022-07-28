class Game < ApplicationRecord
  belongs_to :channel,
             :class_name => "Channel",
             :foreign_key => 'channel_id'
  has_many :messages, dependent: :destroy
  has_many :players
  has_many :game_players, dependent: :destroy
  has_many :characters, dependent: :destroy
  belongs_to :gm,
             dependent: :destroy,
             :class_name => "Gm",
             :foreign_key => 'gm_id'
end
