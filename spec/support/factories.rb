FactoryGirl.define do
  factory :artist do
    name
    image_path "http://cdn.baeblemusic.com/images/bblog/11-10-2015/justinbieberblogpost3-580.jpg"
  end

  sequence :name do |n|
    "#{n} Artist"
  end

  sequence :title, ["A", "C", "B"].cycle do |n|
    "#{n} Title"
  end

  factory :song do
    title
    artist
  end

  sequence :playlist_name do |n|
    "Playlist #{n}"
  end

  factory :playlist do
    name { generate(:playlist_name) }

    factory :playlist_with_songs do
      songs { create_list(:song, 3) }
    end
  end
end




