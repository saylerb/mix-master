require "rails_helper"

RSpec.feature "Display all artists" do
  scenario "user views artist index page" do 
  # As a user
  # Given that artists exist in the database
  artist_name = "Bob Marley"
  artist_image_path =  "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
  Artist.create(name: artist_name, image_path: artist_image_path)

  # When I visit the artists index
  visit artists_path
  save_and_open_page

  # Then I should see each artist's name
  expect(page).to have_content("Bob Marley")

  # And each name should link to that artist's individual page
  click_on "Bob Marley"
  expect(current_path).to eq( artist_path(Artist.last.id) )
  end
end

