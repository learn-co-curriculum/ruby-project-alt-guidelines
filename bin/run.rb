require_relative '../config/environment'

def clear!
    puts 'clear'
end

puts "Hi Artist! What's your name?"
print "Enter your name: "
artist_name = gets.chomp

current_user = Artist.find_or_create_by(name: artist_name)

puts "Welcome #{current_user.name}"
puts "What would you like to do next?"
puts "1. View your profile"
puts "2. View your songs"
puts "3. Create a song"
puts "4. Remove a song"

print "Enter your selection: "
input = gets.chomp

# clear!

case input
when "1"
    puts "Profile page"
when "2"
    puts "Here are all your songs: "
    current_user.songs.each do |song|
        puts "#{song.album.album_title} | #{song.song_title}"
    end
when "3"
    puts "Add your song"
    puts "Please see the list of available albums: "
    Album.all.each do |album|
        puts "#{album.id}. #{album.album_title}"
    end

    print "Please enter your album id: "
    album_id = gets.chomp.to_i

    print "Please enter song title: "
    song_title = gets.chomp

    Song.create(
        song_title: song_title,
        artist_id: current_user.id,
        album_id: album_id
    )

when "4"
    puts "Remove your song"
end

# binding.pry
