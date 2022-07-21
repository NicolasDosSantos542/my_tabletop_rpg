class Game < ApplicationRecord
  belongs_to :channel,
             :class_name => "Channel",
             :foreign_key => 'channel_id'
  has_many :messages
  belongs_to :gm,
             dependent: :destroy,
             :class_name => "Gm",
             :foreign_key => 'gm_id'
end
