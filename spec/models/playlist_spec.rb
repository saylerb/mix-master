require 'rails_helper'

RSpec.describe Playlist, type: :model do

  # shoulda-matchers

  it { should have_many(:playlist_songs) }
  it { should have_many(:songs).through(:playlist_songs) }

end
