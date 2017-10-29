user = User.create(username: 'Clera', email: 'apples@orchard.com', password: 'pear', bio: 'I love apple orchards, apple sauce, and roasted beets!')

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
    season.ingredients << Ingredient.find_by_name(name)
  end
end

while Season.all.length < 4
  driver = Selenium::WebDriver.for :chrome
  driver.navigate.to "http://www.simplesteps.org/eat-local/state/washington"
  wait = Selenium::WebDriver::Wait.new(:timeout => 20)

  produce_data = {}

  # gets all seasons online
  seasons = wait.until {
    element_1 = driver.find_element(:class, 'state-produce')
    element_1.find_elements(:class, 'season')
  }

  # sets produce_data hash
  seasons.each do |season|
    monthy = season.find_element(:tag_name, 'h3').text

    season_produce = season.find_elements(:tag_name, 'a')

    season_produce.map! { |item| item.text }

    produce_data[monthy] = season_produce
  end

  ###############################################################################
  # SEEDS seasons & ingredients
  winter = Season.create(name: 'Winter')
  spring = Season.create(name: 'Spring')
  summer = Season.create(name: 'Summer')
  fall = Season.create(name: 'Fall')

  ingredients = produce_data.values.flatten.uniq
  clean(ingredients)

  ingredients.each do |ingredient|
    Ingredient.create(name: ingredient)
  end
  ###############################################################################

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


  driver.quit
end
################################################################################################################################################################
