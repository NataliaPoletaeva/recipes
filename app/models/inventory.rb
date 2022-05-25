class Inventory < ApplicationRecord
    belongs_to :user
    has_many :inventory_foods
    validates :user_id, presence: true
    validates :description, length: { in: 1..250 }
end
