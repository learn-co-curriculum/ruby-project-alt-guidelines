User.destroy_all
Resource.destroy_all
FavResource.destroy_all
User.reset_pk_sequence
Resource.reset_pk_sequence
FavResource.reset_pk_sequence



# Users
u1 = User.create(username: "hungry1", neighborhood: "Manhattan")
u2 = User.create(username: "bob", neighborhood: "Melrose")
u3 = User.create(username: "ilikefood", neighborhood: "Belmont")
u4 = User.create(username: "barb", neighborhood: "Manhattan")


# Resources
r1 = Resource.create(name: "City Harvest, Inc.", neighborhood: "Manhattan", description: "service that rescues food to deliver to those in need", fresh: true)
r2 = Resource.create(name: "Park Avenue Synagogue", neighborhood: "Manhattan", description: "food pantry run by teens", fresh: false)
r3 = Resource.create(name: "Temple Sharaay Tefila", neighborhood: "Manhattan", description: "soup kitchen open daily", fresh: true)
r4 = Resource.create(name: "Crossroads Community Services Inc.", neighborhood: "Manhattan", description: "soup kitchen offering grab-and-go and groceries", fresh: true)
r5 = Resource.create(name: "Holy Apostle Pantry Program", neighborhood: "Manhattan", description: "food pantry filling backpacks of homeless children with food", fresh: false)
r6 = Resource.create(name: "Ascension Outreach Inc.", neighborhood: "Manhattan", description: "food pantry", fresh: false)
r7 = Resource.create(name: "The Salvation Army New York Temple", neighborhood: "Manhattan", description: "food pantry", fresh: true)
r8 = Resource.create(name: "Unitarian Church of All Souls", neighborhood: "Manhattan", description: "soup kitchen serving hot meals on Monday nights", fresh: true)
r9 = Resource.create(name: "Father's Heart Ministries", neighborhood: "Manhattan", description: "soup kitchen serving weekly buffet", fresh: true)
r10 = Resource.create(name: "Caldwell Temple AME Zion Church Soup Kitchen", neighborhood: "Morrisania", description: "Our soup kitchen serves meals every 2nd Saturday, 11:00am - 2:00pm.", fresh: false)
r11 = Resource.create(name: "Missionary Church of Christ", neighborhood: "Melrose", description: "The Missionary Church of Christ provides free food for the community on the 2nd and 4th Wednesday of the month, 9:00am - 11:00am.", fresh: true)
r12 = Resource.create(name: "St. Jerome Community Food Pantry", neighborhood: "Mott Haven", description: "St. Jerome Community Food Pantry serves the South Bronx every Wednesday.", fresh: true)
r13 = Resource.create(name: "Vineyard Food Pantry", neighborhood: "Claremont Village", description: "Vineyard Food Pantry offers free food for those in need.", fresh: true)
r14 = Resource.create(name: "Woodycrest United Methodist Church - Food Pantry", neighborhood: "Highbridge", description: "Our food pantry feeds anyone who lives in the Highbridge neighborhood.", fresh: false)
r15 = Resource.create(name: "St. Thomas Aquinas Church", neighborhood: "West Farms", description: "We open the doors of our food pantry to the community every Wednesday from 10:00am - 12:00pm.", fresh: false)
r16 = Resource.create(name: "Joshua and Caleb Ministries Inc", neighborhood: "Belmont", description: "Our food pantry operates from 11:00am - 12:00pm every Saturday.", fresh: true)
r17 = Resource.create(name: "Thorpe Family Residence - Louise's Pantry", neighborhood: "Belmont", description: "Louise’s food pantry serves residents of all five boroughs.", fresh: true)
r18 = Resource.create(name: "Church of St. Frances of Rome", neighborhood: "Baychester", description: "The food pantry that offers support to the hungry in the North Bronx.", fresh: false)
r19 = Resource.create(name: "Saint Nicholas of Tolentine Parish", neighborhood: "Fordham", description: "Arrive early for the best chance of receiving food.", fresh: false)


# Fav Resources
fav1 = FavResource.create(user_id: u1.id, resource_id: r3.id)
fav2 = FavResource.create(user_id: u3.id, resource_id: r5.id)
fav3 = FavResource.create(user_id: u4.id, resource_id: r7.id)
fav4 = FavResource.create(user_id: u2.id, resource_id: r9.id)
fav5 = FavResource.create(user_id: u3.id, resource_id: r11.id)