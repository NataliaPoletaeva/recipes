class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, foreign_key: 'recipe_id', dependent: :destroy
  validates :name, presence: true, length: { maximum: 250 }
  validates :preparation_time, :cooking_time, presence: true, numericality: true
  validates :description, presence: true
end
