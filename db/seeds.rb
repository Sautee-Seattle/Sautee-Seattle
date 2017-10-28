user = User.create(username: 'Clera', email: 'apples@orchard.com', password: 'pear', bio: 'I love apple orchards, apple sauce, and roasted beets!')

all_seasons = []
all_seasons << Season.create!(name: "Winter")
all_seasons << Season.create!(name: "Spring")
all_seasons << Season.create!(name: "Summer")
all_seasons << Season.create!(name: "Fall")

apple = Ingredient.create!(name: "Apple", description: "Things are Things are things are things")
all_seasons.each do |season|
  apple.seasons << season
  apple.posts << Post.create(post_type: "location", title: "Buy Beets Here", body: "111 Street Street", user: user)
  apple.posts << Post.create(post_type: "recipe", title: "Make Beets", body: "Beat beets until beaten. Then bring beats to bob.", user: user)
end

avocado = Ingredient.create!(name: "Avocado", description: "Things are Things are things are things")
all_seasons.each do |season|
  avocado.seasons << season
  avocado.posts << Post.create(post_type: "location", title: "Buy Beets Here", body: "111 Street Street", user: user)
  avocado.posts << Post.create(post_type: "recipe", title: "Make Beets", body: "Beat beets until beaten. Then bring beats to bob.", user: user)
end

banana = Ingredient.create!(name: "Banana", description: "Things are Things are things are things")
all_seasons.each do |season|
  banana.seasons << season
  banana.posts << Post.create(post_type: "location", title: "Buy Beets Here", body: "111 Street Street", user: user)
  banana.posts << Post.create(post_type: "recipe", title: "Make Beets", body: "Beat beets until beaten. Then bring beats to bob.", user: user)
end

beets = Ingredient.create!(name: "Beets", description: "Things are Things are things are things") # Nicks Fav!
all_seasons.each do |season|
  beets.seasons << season
  beets.posts << Post.create(post_type: "location", title: "Buy Beets Here", body: "111 Street Street", user: user)
  beets.posts << Post.create(post_type: "recipe", title: "Make Beets", body: "Beat beets until beaten. Then bring beats to bob.", user: user)
end

celery = Ingredient.create!(name: "Celery", description: "Things are Things are things are things")
all_seasons.each do |season|
  celery.seasons << season
  celery.posts << Post.create(post_type: "location", title: "Buy Beets Here", body: "111 Street Street", user: user)
  celery.posts << Post.create(post_type: "recipe", title: "Make Beets", body: "Beat beets until beaten. Then bring beats to bob.", user: user)
end

mushrooms = Ingredient.create!(name: "Mushrooms", description: "Things are Things are things are things")
all_seasons.each do |season|
  mushrooms.seasons << season
  mushrooms.posts << Post.create(post_type: "location", title: "Buy Beets Here", body: "111 Street Street", user: user)
  mushrooms.posts << Post.create(post_type: "recipe", title: "Make Beets", body: "Beat beets until beaten. Then bring beats to bob.", user: user)
end
