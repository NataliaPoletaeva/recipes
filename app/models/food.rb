class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, foreign_key: 'food_id', dependent: :destroy

  validates :name, presence: true, length: { in: 1..50 }
  validates :measurement_unit, presence: true, length: { in: 1..20 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates_associated :recipe_foods
end
