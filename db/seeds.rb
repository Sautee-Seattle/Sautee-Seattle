# user = User.create!(username: 'Clera', email: 'apples@orchard.com', password: 'pear', bio: 'I love apple orchards, apple sauce, and roasted beets!')

# Selenium::WebDriver::Chrome.driver_path = <path to chromedriver>
def clean(produce)
  produce.reject! { |x| x == "Wreathes" }
  produce.reject! { |x| x == "Christmas Trees" }
end


driver = Selenium::WebDriver.for :chrome
driver.navigate.to "http://www.simplesteps.org/eat-local/state/washington"
wait = Selenium::WebDriver::Wait.new(:timeout => 20)

produce_data = {}

# gets all seasons online
seasons = wait.until {
  element_1 = driver.find_element(:class, 'state-produce')
  element_1.find_elements(:class, 'season')
}


#sets season names to empty arrays in produce {}
seasons.each do |season|
  monthy = season.find_element(:tag_name, 'h3').text

  season_produce = season.find_elements(:tag_name, 'a')

  season_produce.map! { |item| item.text }

  produce_data[monthy] = season_produce
end

# p produce_data.values[0]

# winter = produce_data.values[22] | produce_data.values[23] | produce_data.values[0] | produce_data.values[1] | produce_data.values[2] | produce_data.values[3]
#
# clean(winter)

def get_season_produce(data, a, b, c, d, e, f)
  season = data.values[a] | data.values[b] | data.values[c] | data.values[d] | data.values[e] | data.values[f]

  clean(season)
end

winter = get_season_produce(produce_data, 0, 1, 2, 3, 22, 23)

p winter

# spring =
#
# summer =
#
# fall =










################################################################################
# ingredients = produce_data.values.flatten.uniq
#
# clean(ingredients)

# ingredients.each do |ingredient|
#   Ingredient.create(name: ingredient)
# end
################################################################################

# all_seasons = []
# all_seasons << Season.create!(name: "Winter")
# all_seasons << Season.create!(name: "Spring")
# all_seasons << Season.create!(name: "Summer")
# all_seasons << Season.create!(name: "Fall")
#
# apple = Ingredient.create!(name: "Apple")
#   all_seasons.each do |season|
#     apple.seasons << season
#   end
#
# avocado = Ingredient.create!(name: "Avocado")
#   all_seasons.each do |season|
#     avocado.seasons << season
#   end
#
# banana = Ingredient.create!(name: "Banana")
#   all_seasons.each do |season|
#     banana.seasons << season
#   end
#
# beets = Ingredient.create!(name: "Beets") # Nicks Fav!
#   all_seasons.each do |season|
#     beets.seasons << season
#   end
#
# celery = Ingredient.create!(name: "Celery")
#   all_seasons.each do |season|
#     celery.seasons << season
#   end
#
# mushrooms = Ingredient.create!(name: "Mushrooms")
#   all_seasons.each do |season|
#     mushrooms.seasons << season
# end
