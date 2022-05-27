FactoryBot.define do
  factory :inventory do
    user { FactoryBot.create(:user) }
    name { 'inventory 1' }
    description { 'this is the best pizza ever' }
  end
end
