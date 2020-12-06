Book.destroy_all
BookStore.destroy_all
BookOrder.destroy_all


    # Book.create(title: Faker::Book.title, author: Faker::Book.author, genre: Faker::Book.genre, rating: rand(1...5))
Book.create(title: "Rosemary Sutcliff", author: "Candy Bernier", genre: "Suspense/Thriller", rating: rand(1...5)) 
Book.create(title: "O Jerusalem!", author: "Jeri Shanahan", genre: "Mystery", rating: rand(1...5))
Book.create(title: "The Painted Veil", author: "Rep. Marty VonRueden", genre: "Mystery", rating: rand(1...5))
Book.create(title: "O Jerusalem!", author: "Judie Kirlin", genre: "Tall tale", rating: rand(1...5))
Book.create(title: "No Longer at Ease", author: "Rev. Nolan Mueller", genre: "Horror", rating: rand(1...5))
Book.create(title: "Some Buried Caesar", author: "Sal McKenzie", genre: "Realistic fiction", rating: rand(1...5))



    # BookStore.create(name: Faker::JapaneseMedia::SwordArtOnline.location, location: Faker::Address.community, opening_time: "8AM", closing_time: "9PM" )

BookStore.create(name: "Hill of Memories", location: "Autumn Court", opening_time: "8AM", closing_time: "9PM") 
BookStore.create(name: "Dungeon", location: "Paradise Acres", opening_time: "8AM", closing_time: "9PM")
BookStore.create(name: "Tolbana", location: "Park Gardens", opening_time: "8AM", closing_time: "9PM")
BookStore.create(name: "Legrue Corridor", location: "Pine Heights", opening_time: "8AM", closing_time: "9PM")
BookStore.create(name: "Underworld", location: "Pine Square", opening_time: "8AM", closing_time: "9PM")



BookOrder.create(book_id: Book.all.sample.id, book_store_id: BookStore.all.sample.id) 


Book.all.each do |book|
    BookOrder.create(book_id: book.id, book_store_id: BookStore.all.sample.id)
end 
puts 'done'
