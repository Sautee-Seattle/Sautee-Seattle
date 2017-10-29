require 'selenium-webdriver'
require 'json'

driver = Selenium::WebDriver.for :chrome
driver.navigate.to "http://www.simplesteps.org/eat-local/state/washington"
wait = Selenium::WebDriver::Wait.new(:timeout => 20)

produce_data = {}

# gets all season's data online
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

driver.quit

# exports to json file
File.open('db/produce_data.json', 'wb') do |file|
  file.write(JSON.pretty_generate(produce_data))
end
