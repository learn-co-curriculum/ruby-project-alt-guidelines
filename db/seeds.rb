Review.delete_all
User.delete_all
Location.delete_all

10.times do
    User.create(name:Faker::JapaneseMedia::DragonBall.character)
end


# 10.times do
#     Location.create(name:Faker::Nation.capital_city, description:Faker::TvShows::BojackHorseman.quote)
# end
l1 = Location.create(name: "LA", description: "The city of angels")
l2 = Location.create(name: "Seattle", description: "Hope you brought an umbrella")
l3 = Location.create(name: "Tokyo", description: "Otaku city")
l4 = Location.create(name: "Chicago", description: "Home of the bean")
l5 = Location.create(name: "New York City", description: "Times square is a sight to see")
l6 = Location.create(name: "Honolulu", description: "Enjoy a walk on the beach and fresh poke")
l7 = Location.create(name: "Nashville", description: "Try our hot chicken")
l8 = Location.create(name: "Taipei", description: "Come experience the night market in all its glory")
l9 = Location.create(name: "Salt Lake City", description: "I heard you like skiing")
l10 = Location.create(name: "Vancouver BC", description: "Poutineeeee")

10.times do
    Review.create(name:"Tokyo", description:Faker::Quote.most_interesting_man_in_the_world, user: User.all.sample, location: Location.all.sample)
end






# user_review = Review.create(user_id: u1.id, location_id: l1.id)