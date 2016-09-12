require 'rails_helper'

RSpec.describe "Find nearest stations" do
  scenario "get nearest stations to zipcode" do
    VCR.use_cassette("nearest_stations") do
# As a user

# When I visit "/"
    visit "/"

# And I fill in the search form with 80203
    fill_in "q", with: 80203

# And I click "Locate"
    click_on "Locate"

# Then I should be on page "/search" with parameters visible in the url
    expect(current_path).to eq("/search")

# Then I should see a list of the 10 closest stations within 6 miles sorted by distance
    expect(page).to have_selector('.station', count: 10)

# And the stations should be limited to Electric and Propane
    expect(page).not_to have_content("HY")
    expect(page).not_to have_content("LNG")

# And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
    expect(page).to have_content("Name")
    expect(page).to have_content("Address")
    expect(page).to have_content("Fuel Types")
    expect(page).to have_content("Distance")
    expect(page).to have_content("Access Times")
    end
  end
end
