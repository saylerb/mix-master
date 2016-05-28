require "rails_helper"

RSpec.feature "Artist creation" do
  scenario "user creates a new artist" do
    # setup example artist
    artist_name = "Bob Marley"
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"

    # user navigates to artist index page that lists all artists
    # user sees a link to invidual artist
    visit artists_path
    # user sees a link to create a new artist, and navigates to new artist view
    click_on "New Artist"

    expect(current_path).to eq(new_artist_path)

    fill_in "Artist Name", with: artist_name
    fill_in "Artist Image Path", with: artist_image_path

    find(:button, "Submit Artist").click

    expect(current_path).to eq( artist_path(Artist.last.id) )

    expect(page).to have_content("Bob Marley")
    expect(page).to has_css("img[src=\"#{artist_image_path}\"]")


  end
end

