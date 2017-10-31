################################################################################################################################################################
# DO NOT CHANGE THIS SECTION
def clean(produce)
  produce.reject! { |x| x == "Wreathes" }
  produce.reject! { |x| x == "Christmas Trees" }
end

def get_season_produce(data, a, b, c, d, e, f)
  season = data.values[a] | data.values[b] | data.values[c] | data.values[d] | data.values[e] | data.values[f]

  clean(season)
  season
end

def associate_produce(produce_data, season)
  produce_data.each do |name|
    season.ingredients << Ingredient.find_by!(name: name)
  end
end

# imports produce data from JSON file
file = File.read('db/produce_data.json')
produce_data = JSON.parse(file)

while Season.all.length < 4
  ############################################################################
  # SEEDS seasons & ingredients
  winter = Season.create(name: 'Winter')
  spring = Season.create(name: 'Spring')
  summer = Season.create(name: 'Summer')
  fall = Season.create(name: 'Fall')

  ingredients = produce_data.values.flatten.uniq
  clean(ingredients)

  ingredients.each do |ingredient|
    Ingredient.create!(name: ingredient)
  end
  #############################################################################

  # gets unique produce for our 4 seasons (as opposed to bi-monthly setup online)
  winter_produce_data = get_season_produce(produce_data, 0, 1, 2, 3, 22, 23)
  spring_produce_data = get_season_produce(produce_data, 4, 5, 6, 7, 8, 9)
  summer_produce_data = get_season_produce(produce_data, 10, 11, 12, 13, 14, 15)
  fall_produce_data = get_season_produce(produce_data, 16, 17, 18, 19, 20, 21)

  # associates ingredients to appropriate season
  associate_produce(winter_produce_data, winter)
  associate_produce(spring_produce_data, spring)
  associate_produce(summer_produce_data, summer)
  associate_produce(fall_produce_data, fall)
end
###############################################################################
user = User.create(username: 'Clera', email: 'apples@orchard.com', password: 'pear', bio: 'I love apple orchards, apple sauce, and roasted beets!')

User.create(username: "lovesbeets", email: Faker::Internet.unique.email, password: "pear", bio: Faker::Lorem.paragraph)

recipe = Post.create(post_type: 'recipe', title: "Apple Rhubarb Pie", body: '10 Apples,
2 Stalks Rhubarb,
2 T Cinnamon,
1 C Sugar,
2 T Lemon Juice,
Pie Crust

Directions:

1. Cut apples and rhubarb into bite-size chunks
2. Mix in all other ingredients (excluding pie crust)
3. Pour filling into pie Crust
4. Bake at 350°F for 35 minutes
5. Cool and enjoy',
user: user);

location = Post.create(post_type: 'location', title: "West Seattle Farmer's Market", body: "44th Ave SW & SW Alaska St, Seattle, WA 98116", url: "seattlefarmersmarkets.org/markets/west-seattle", user: user)

apples = Ingredient.find_by_name("Apples")

apples.recipes << recipe
apples.locations << location

10.times do
  User.create(username: Faker::Internet.unique.user_name, email: Faker::Internet.unique.email, password: Faker::Internet.password, bio: Faker::Lorem.paragraph)
end

100.times do
  Post.create!(post_type: "location", title: Faker::Company.name, body: Faker::Lorem.paragraph, user: User.all.sample)
end

100.times do
  Post.create!(post_type: "recipe", title: Faker::Food.dish, body: Faker::Lorem.paragraph, user: User.all.sample)
end

8.times do
  
end



























#
