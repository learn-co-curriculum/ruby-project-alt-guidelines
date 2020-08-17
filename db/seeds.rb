puts "deleted all instances"

# Album.destroy_all
# Artist.destroy_all
# Song.destroy_all

#Album (title(s), creationyear(i), genre(s))
puts "seeding albums"
Album.create(title:Faker::Music.album, creation_year:1969, genre:Faker::Music.genre) 
Album.create(title:Faker::Music.album, creation_year:1970, genre:Faker::Music.genre) 
Album.create(title:Faker::Music.album, creation_year:1971, genre:Faker::Music.genre) 
Album.create(title:Faker::Music.album, creation_year:1972, genre:Faker::Music.genre) 
Album.create(title:Faker::Music.album, creation_year:1973, genre:Faker::Music.genre) 
Album.create(title:Faker::Music.album, creation_year:1974, genre:Faker::Music.genre) 
Album.create(title:Faker::Music.album, creation_year:1975, genre:Faker::Music.genre) 
Album.create(title:Faker::Music.album, creation_year:1976, genre:Faker::Music.genre) 
Album.create(title:Faker::Music.album, creation_year:1977, genre:Faker::Music.genre) 
Album.create(title:Faker::Music.album, creation_year:1978, genre:Faker::Music.genre) 

#Artist(name(s))
puts "seeding artists"
Artist.create(name:Faker::Music.band)
Artist.create(name:Faker::Music.band)
Artist.create(name:Faker::Music.band)
Artist.create(name:Faker::Music.band)
Artist.create(name:Faker::Music.band)
Artist.create(name:Faker::Music.band)
Artist.create(name:Faker::Music.band)
Artist.create(name:Faker::Music.band)
Artist.create(name:Faker::Music.band)
Artist.create(name:Faker::Music.band)

#Song(title(s), artistid(i), albumid(i))
puts "seeding songs"
Song.create(title:Faker::Books::Lovecraft.deity, artist_id: 1, album_id: 1)
Song.create(title:Faker::Books::Lovecraft.deity, artist_id: 2, album_id: 2)
Song.create(title:Faker::Books::Lovecraft.deity, artist_id: 3, album_id: 3)
Song.create(title:Faker::Books::Lovecraft.deity, artist_id: 4, album_id: 4)
Song.create(title:Faker::Books::Lovecraft.deity, artist_id: 5, album_id: 5)
Song.create(title:Faker::Books::Lovecraft.deity, artist_id: 6, album_id: 6)
Song.create(title:Faker::Books::Lovecraft.deity, artist_id: 7, album_id: 7)
Song.create(title:Faker::Books::Lovecraft.deity, artist_id: 8, album_id: 8)
Song.create(title:Faker::Books::Lovecraft.deity, artist_id: 9, album_id: 9)
Song.create(title:Faker::Books::Lovecraft.deity, artist_id: 10, album_id: 10)
Song.create(title:Faker::Books::Lovecraft.deity, artist_id: 11, album_id: 11)

puts "seeding complete"