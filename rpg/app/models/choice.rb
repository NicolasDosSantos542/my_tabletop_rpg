class Choice < ApplicationRecord
    has_many :answers
    accepts_nested_attributes_for :comments
    validates :step, presence: true
    validates :description, presence: true, length: { minimum: 10 }

end
