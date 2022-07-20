class Choice < ApplicationRecord
    validates :step, presence: true
    validates :description, presence: true, length: { minimum: 10 }

end
