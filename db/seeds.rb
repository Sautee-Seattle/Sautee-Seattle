Season.create!(name: "Spring")
Season.create!(name: "Summer")
Season.create!(name: "Fall")
Season.create!(name: "Winter")

squash = Ingredient.create!(name: "Squash")
squash.seasons << Season.find(1)
squash.seasons << Season.find(2)
squash.seasons << Season.find(3)
