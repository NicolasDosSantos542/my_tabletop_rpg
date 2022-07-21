class Choice < ApplicationRecord
    has_many :answers, dependent: :destroy
    belongs_to :step

    validates :step, presence: true
    validates :description, presence: true, length: { minimum: 10 }

end
