require "rails_helper"
require "./spec/support/features_helper"

include FeaturesHelper

RSpec.feature "User edits an existing artist" do

  scenario "user navigates to edit page" do

    # As a user
    # Given that an artist exists in the database
    features_setup

    artist = Artist.find_by(name: "Bob Marley")
 
    # When I visit that artist's show page
    visit artist_path(artist)
    
    expect(current_path).to eq( artist_path(artist) )
    # And I click on "Edit"
    click_on "Edit"
    expect(current_path).to eq( edit_artist_path(artist) )

    # And I fill in a new name
    # save_and_open_page
    fill_in "Name", with: "Bobby Marley"
    
    # And I click on "Update Artist"
    click_on "Update Artist"
   
    # Then I should see the artist's updated name
    expect(current_path).to eq( artist_path(artist) )
    expect(page).to have_content("Bobby Marley")
   
    # Then I should see the existing image
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    expect(page).to have_css("img[src=\"#{artist_image_path}\"]")
  end
end
