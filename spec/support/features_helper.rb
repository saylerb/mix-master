module FeaturesHelper
 def features_setup 
    artist_data = [["Bob Marley","http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"],
                 ["Adele", "http://s1.evcdn.com/images/edpborder500/I0-001/024/614/320-9.jpeg_/adele-20.jpeg"],
                 ["Justin Beiber", "http://cdn.baeblemusic.com/images/bblog/11-10-2015/justinbieberblogpost3-580.jpg"]]

    artist_data.each do |artist_name, artist_image_path|
      Artist.create(name: artist_name, image_path: artist_image_path)
    end
  end
end



