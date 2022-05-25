class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods
  validates :name, presence: true, length: { maximum: 250 }
  validates :preparation_time, :cooking_time, presence: true, numericality: true
  validates :description, presence: true
end
