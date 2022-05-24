users = [
    {
        :name => 'John',
        :email => 'john@example.com',
        :password => 'password'
    }
]

users.each do |user|
    User.create(name: user[:name], email: user[:email], password: user[:password])
end
recipes = [
    {
       :name => "Pizza",
       :preparation_time => 0.3,
       :cooking_time => 1,
       :public => true,
       :description => "italian pizza is one of the best recipes which displays the italian heritage",
       :user_id => 1
    },
    {
       :name => "Rice",
       :preparation_time => 0.3,
       :cooking_time => 1.5,
       :public => true,
       :description => " This is one of the best recipes which are easy to prepare",
       :user_id => 1
    },
    {
       :name => "Rice",
       :preparation_time => 0.3,
       :cooking_time => 1.5,
       :public => true,
       :description => " This is one of the best recipes which are easy to prepare",
       :user_id => 1
    }
]

recipes.each do |recipe|
    Recipe.create(name: recipe[:name], preparation_time: recipe[:preparation_time],
         cooking_time: recipe[:cooking_time], public: recipe[:public], description: recipe[:description], user_id: recipe[:user_id])
end