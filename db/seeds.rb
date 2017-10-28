user = User.create!(username: 'Clera', email: 'apples@orchard.com', password: 'pear', bio: 'I love apple orchards, apple sauce, and roasted beets!')

seasons = []
seasons << Season.create!(name: "Winter")
seasons << Season.create!(name: "Spring")
seasons << Season.create!(name: "Summer")
seasons << Season.create!(name: "Fall")

apple = Ingredient.create!(name: "Apple")
  seasons.each do |season|
    apple.seasons << season
  end

avocado = Ingredient.create!(name: "Avocado")
  avocado.each do |season|
    apple.seasons << season
  end

banana = Ingredient.create!(name: "Banana")
  seasons.each do |season|
    banana.seasons << season
  end

beets = Ingredient.create!(name: "Beets") # Nicks Fav!
  seasons.each do |season|
    beets.seasons << season
  end

celery = Ingredient.create!(name: "Celery")
  seasons.each do |season|
    celery.seasons << season
  end

mushrooms = Ingredient.create!(name: "Mushrooms")
  seasons.each do |season|
    mushrooms.seasons << season
  end
