class Game < ApplicationRecord
  belongs_to :channel,
             :class_name => "Channel",
             :foreign_key => 'channel_id'
end
