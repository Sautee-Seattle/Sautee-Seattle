User.create!(username: 'Clera', email: 'apples@orchard.com', password: 'pear', bio: 'I love apple orchards, apple sauce, and roasted beets!')

ing = Ingredient.create!(name: "Beet", description: 'The beetroot is the taproot portion of the beet plant,[1] usually known in North America as the beet, also table beet, garden beet, red beet, or golden beet. It is one of several of the cultivated varieties of Beta vulgaris grown for their edible taproots and their leaves (called beet greens). These varieties have been classified as B. vulgaris subsp. vulgaris Conditiva Group.')

5.times do
  ing.posts << Post.create(post_type: "location", title: "Buy Beets Here", body: "111 Street Street")
  ing.posts << Post.create(post_type: "recipe", title: "Make Beets", body: "Beat beets until beaten. Then bring beats to bob.")
end

all_seasons = []
all_seasons << Season.create!(name: "Winter")
all_seasons << Season.create!(name: "Spring")
all_seasons << Season.create!(name: "Summer")
all_seasons << Season.create!(name: "Fall")

apple = Ingredient.create!(name: "Apple")
all_seasons.each do |season|
  apple.seasons << season
end

avocado = Ingredient.create!(name: "Avocado")
all_seasons.each do |season|
  avocado.seasons << season
end

banana = Ingredient.create!(name: "Banana")
all_seasons.each do |season|
  banana.seasons << season
end

beets = Ingredient.create!(name: "Beets") # Nicks Fav!
all_seasons.each do |season|
  beets.seasons << season
end

celery = Ingredient.create!(name: "Celery")
all_seasons.each do |season|
  celery.seasons << season
end

mushrooms = Ingredient.create!(name: "Mushrooms")
all_seasons.each do |season|
  mushrooms.seasons << season
end
