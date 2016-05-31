require "rails_helper"

RSpec.feature "Edit a playlist" do
  scenario "User navigates to page and edits existing playlist" do
    # As a user
    # Given that a playlist and songs exist in the database
    playlist = create(:playlist_with_songs)
    playlist_original_name = playlist.name
    song_one, song_two, song_three = playlist.songs 

    new_song = create(:song, title: "NEW SONG")
    
    # When I visit that playlist's show page
    visit playlist_path(playlist)
    
    # And I click on "Edit"
    click_on "Edit Playlist"

    # The existing songs should be checked 

    expect(find_by_id("song-#{song_one.id}")).to be_checked
    expect(find_by_id("song-#{song_two.id}")).to be_checked
    expect(find_by_id("song-#{song_three.id}")).to be_checked
    expect(find_by_id("song-#{new_song.id}")).to_not be_checked

    save_and_open_page
    # And I enter a new playlist name
    fill_in "Playlist Name", with: "#{playlist_original_name} UPDATED"  

    
    # And I select an additional song
    check("song-#{new_song.id}")

    # And I uncheck an existing song
    uncheck("song-#{song_one.id}")
    
    # And I click on "Update Playlist"
    click_on "Update Playlist"
    # Then I should see the playlist's updated name
    expect(page).to have_content("#{playlist_original_name} UPDATED") 
    # And I should see the name of the newly added song
    expect(page).to have_content(new_song.title) 
    # And I should not see the name of the removed song
    expect(page).to_not have_content(song_one.title) 

    end
end
