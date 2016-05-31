require "rails_helper"


RSpec.feature "User views all playlists" do 
  scenario "User sees a list of all playlists when visiting index page" do 
  # As a user
  # Given that playlists exist in the database
  playlists = create_list(:playlist_with_songs, 3)
  
  # When I visit the playlists index
  visit playlists_path
  
  # Then I should see each playlist's name
  playlists.each do |playlist|
    expect(page).to have_link(playlist.name), href: playlist_path(playlist)
  end
  
  # And each name should link to that playlist's individual page

  end
end

