class Step < ApplicationRecord
    has_one :choice, dependent: :destroy

end
