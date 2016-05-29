# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
#
artist_name = "Bob Marley"
artist_image_path =  "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
Artist.create(name: artist_name, image_path: artist_image_path)


