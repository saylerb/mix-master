require "rails_helper"
require "./spec/support/features_helper"

include FeaturesHelper

RSpec.feature "Destroy Artist" do
  scenario "User deletes an existing artist, is redirected to the artists page and does not see the artist" do
    # As a user
    # Given that an artist exists in the database
    features_setup
    # When I visit that artist's show page
    artist = Artist.find_by(name: "Justin Beiber")

    visit artist_path(artist)
    # save_and_open_page
    # And I click on "Delete"
    click_on "Delete"
    # Then I should be back on the artist index page

    expect(current_path).to eq(artists_path)

    # Then I should not see the artist's name

    expect(page).to_not have_content("Justin Beiber")
  end
end
