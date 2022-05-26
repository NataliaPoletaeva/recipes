FactoryBot.define do
  factory :recipe_food do
    quantity { 1 }
    recipe_id { 1 }
    food_id { 1 }
  end
  factory :food do
    user_id { 1}
    name { 'rice' }
    measurement_unit { 'gram' }
    price { 1 }
  end
end
