# require_relative '../config/pantry_scraper'

User.destroy_all
Resource.destroy_all
FavResource.destroy_all
User.reset_pk_sequence
Resource.reset_pk_sequence
FavResource.reset_pk_sequence



# Users
u1 = User.create(username: "jordan123", borough: "Manhattan", password: "abc123")
u2 = User.create(username: "lauren123", borough: "The Bronx", password: "abc123")
u3 = User.create(username: "jack123", borough: "Manhattan", password: "abc123")
u4 = User.create(username: "jill123", borough: "The Bronx", password: "abc123")



# Resources
r1 = Resource.create(name: "City Harvest, Inc.", borough: "Manhattan", description: "We rescue food and deliver it to those in need.", fresh: true)
r2 = Resource.create(name: "Park Avenue Synagogue", borough: "Manhattan", description: "Our food pantry is run by teens.", fresh: false)
r3 = Resource.create(name: "Temple Shaaray Tefila", borough: "Manhattan", description: "The Temple's soup kitchen is open daily.", fresh: true)
r4 = Resource.create(name: "Crossroads Community Services Inc.", borough: "Manhattan", description: "CCS soup kitchen is offering grab-and-go and groceries.", fresh: true)
r5 = Resource.create(name: "Holy Apostle Pantry Program", borough: "Manhattan", description: "We are a food pantry filling backpacks of homeless children with food.", fresh: false)
r6 = Resource.create(name: "Ascension Outreach Inc.", borough: "Manhattan", description: "Ascension Outreach offers a food pantry.", fresh: false)
r7 = Resource.create(name: "The Salvation Army New York Temple", borough: "Manhattan", description: "The Salvation Army food pantry happens three times per week.", fresh: true)
r8 = Resource.create(name: "Unitarian Church of All Souls", borough: "Manhattan", description: "The soup kitchen serves hot meals on Monday nights.", fresh: true)
r9 = Resource.create(name: "Father's Heart Ministries", borough: "Manhattan", description: "We serve a weekly buffet.", fresh: true)
r10 = Resource.create(name: "Food Bank for New York City - West Harlem", borough: "Manhattan", description: "We are a Community Kitchen and Pantry in Harlem.", fresh: true)
r11 = Resource.create(name: "Caldwell Temple AME Zion Church Soup Kitchen", borough: "The Bronx", description: "Our soup kitchen serves meals every 2nd Saturday, 11:00am - 2:00pm.", fresh: false)
r12 = Resource.create(name: "Missionary Church of Christ", borough: "The Bronx", description: "The Missionary Church of Christ provides free food for the community on the 2nd and 4th Wednesday of the month, 9:00am - 11:00am.", fresh: true)
r13 = Resource.create(name: "St. Jerome Community Food Pantry", borough: "The Bronx", description: "St. Jerome Community Food Pantry serves the South Bronx every Wednesday.", fresh: true)
r14 = Resource.create(name: "Vineyard Food Pantry", borough: "The Bronx", description: "Vineyard Food Pantry offers free food for those in need.", fresh: true)
r15 = Resource.create(name: "Woodycrest United Methodist Church - Food Pantry", borough: "The Bronx", description: "Our food pantry feeds anyone who lives in the Highbridge borough.", fresh: false)
r16 = Resource.create(name: "St. Thomas Aquinas Church", borough: "The Bronx", description: "We open the doors of our food pantry to the community every Wednesday from 10:00am - 12:00pm.", fresh: false)
r17 = Resource.create(name: "Joshua and Caleb Ministries Inc.", borough: "The Bronx", description: "Our food pantry operates from 11:00am - 12:00pm every Saturday.", fresh: true)
r18 = Resource.create(name: "Thorpe Family Residence - Louise's Pantry", borough: "The Bronx", description: "Louise’s food pantry serves residents of all five boroughs.", fresh: true)
r19 = Resource.create(name: "Church of St. Frances of Rome", borough: "The Bronx", description: "Our food pantry offers support for the hungry in the North Bronx.", fresh: false)
r20 = Resource.create(name: "Saint Nicholas of Tolentine Parish", borough: "The Bronx", description: "Arrive early for the best chance of receiving food.", fresh: false)



# Fav Resources
fav1 = FavResource.create(user_id: u1.id, resource_id: r1.id, nickname: "C.H.I.")
fav2 = FavResource.create(user_id: u2.id, resource_id: r3.id, nickname: "Shaaray")
fav3 = FavResource.create(user_id: u3.id, resource_id: r2.id, nickname: "Park Ave. S")
fav4 = FavResource.create(user_id: u4.id, resource_id: r4.id, nickname: "C.C.S.I.")
fav5 = FavResource.create(user_id: u4.id, resource_id: r1.id, nickname: "Harvest")
fav6 = FavResource.create(user_id: u3.id, resource_id: r20.id, nickname: "Saint Nick's")
fav7 = FavResource.create(user_id: u2.id, resource_id: r18.id, nickname: "Louise's")
fav8 = FavResource.create(user_id: u1.id, resource_id: r19.id, nickname: "The Rome One")
fav9 = FavResource.create(user_id: u1.id, resource_id: r17.id, nickname: "J and C")

# $scraped_pantries = []
# PantryScraper.crawl!

# $scraped_pantries.each do |pantry|

#     Pantry.find_or_create()
# end

# binding.pry
