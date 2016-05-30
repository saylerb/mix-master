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

end




