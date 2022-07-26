class Chapter < ApplicationRecord
    has_many :steps, dependent: :destroy

end
