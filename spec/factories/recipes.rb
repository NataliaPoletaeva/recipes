FactoryBot.define do
  factory :user do
    name { 'johnDoe' }
    email { 'john@doe.com' }
    password { 'password' }
  end
  factory :recipe do
    user { FactoryBot.create(:user) }
    name { 'pizza' }
    preparation_time { 1 }
    cooking_time { 1 }
    description { 'this is the best pizza ever' }
    public { true }
  end

end
