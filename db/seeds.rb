u1 = User.create(name: "Johnny")
u2 = User.create(name: "Bob")
u3 = User.create(name: "Joe")

l1 = Location.create(name: "LA", description: "The city of angels")
l2 = Location.create(name: "Seattle", description: "Hope you brought an umbrella")
l3 = Location.create(name: "Tokyo", description: "Otaku city")

user_review = Review.create(user_id: u1.id, location_id: l1.id)