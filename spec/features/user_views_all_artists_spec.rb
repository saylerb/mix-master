require "rails_helper"
require "./spec/support/features_helper"

include FeaturesHelper

RSpec.feature "Display all artists" do
  scenario "user views artist index page" do 
  # Add Bob Marley, Adele, and Justin Beiber to database
  features_setup

  # When I visit the artists index
  visit artists_path
  save_and_open_page

  # Then I should see each artist's name
  expect(page).to have_content("Justin Beiber")

  # And each name should link to that artist's individual page
  click_on "Justin Beiber"
  expect(current_path).to eq( artist_path(Artist.last.id) )
  end
end

