puts "deleted all instances"

Album.destroy_all
Artist.destroy_all
Song.destroy_all

#Album (title(s), creationyear(i), genre(s))
puts "seeding albums"
10.times do (
Album.create(album_title:Faker::Music.album, creation_year:1969, genre:Faker::Music.genre) 
)
end

#Artist(name(s))
puts "seeding artists"
10.times do (
Artist.create(name:Faker::Music.band))
end
#Song(title(s), artistid(i), albumid(i))
puts "seeding songs"

11.times do (
Song.create(song_title:Faker::Books::Lovecraft.deity, artist_id: 1, album_id: 1)
)
end
puts "seeding complete"