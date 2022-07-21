class Choice < ApplicationRecord
    has_many :answers, dependent: :destroy

    validates :step, presence: true
    validates :description, presence: true, length: { minimum: 10 }

end
