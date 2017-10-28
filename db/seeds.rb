Season.create!(name: "Winter")
Season.create!(name: "Spring")
Season.create!(name: "Summer")
Season.create!(name: "Fall")

apple = Ingredient.create!(name: "Apple")
apple.seasons << Season.find(1)
apple.seasons << Season.find(2)
apple.seasons << Season.find(3)
apple.seasons << Season.find(4)
p Season.find(4).ingredients
p apple.seasons

avocado = Ingredient.create!(name: "Avocado")
avocado.seasons << Season.find(1)
avocado.seasons << Season.find(2)
avocado.seasons << Season.find(3)

banana = Ingredient.create!(name: "Banana")
banana.seasons << Season.find(1)
banana.seasons << Season.find(2)
banana.seasons << Season.find(3)

beets = Ingredient.create!(name: "Beets") # Nicks Fav!
beets.seasons << Season.find(1)
beets.seasons << Season.find(3)
beets.seasons << Season.find(4)

celery = Ingredient.create!(name: "Celery")
celery.seasons << Season.find(1)
celery.seasons << Season.find(2)
celery.seasons << Season.find(3)
celery.seasons << Season.find(4)

mushrooms = Ingredient.create!(name: "Mushrooms")
mushrooms.seasons << Season.find(2)
mushrooms.seasons << Season.find(4)
