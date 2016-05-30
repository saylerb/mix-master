require "rails_helper"
require "./spec/support/features_helper"

include FeaturesHelper

RSpec.feature "Song creation" do
  scenario "User adds a song to an existing Artist" do
    # As a user
    # Given that artists exist in the database

    # Using my FeaturesHelper:
    # features_setup
    # artist = Artist.all.last

    # Using a test factory:

    artist = create(:artist)
    
    # When I visit the artist songs index
    visit artist_path(artist)
    # And I click "New song"
    click_on "New Song"
    # And I fill in the title
    fill_in "Title", with: "Sorry"
    # And I click "Create Song"
    click_on "Create Song"
    # Then I should see the song name
    expect(page).to have_content("Sorry")

    # And I should see a link to the song artist's individual page
    expect(page).to have_link(artist.name), href: artist_path(artist)

  end
end
   


