# user = User.create!(username: 'Clera', email: 'apples@orchard.com', password: 'pear', bio: 'I love apple orchards, apple sauce, and roasted beets!')

# Selenium::WebDriver::Chrome.driver_path = <path to chromedriver>

driver = Selenium::WebDriver.for :chrome
driver.navigate.to "http://www.simplesteps.org/eat-local/state/washington"
wait = Selenium::WebDriver::Wait.new(:timeout => 20)

produce = {}

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

  produce[monthy] = season_produce
end

# example = driver.find_element(:class, 'season').find_elements(:tag_name, 'a')

# example.each { |pro| puts pro.text }


puts produce


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
