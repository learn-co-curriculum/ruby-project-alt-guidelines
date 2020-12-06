class BookStore < ActiveRecord::Base
    has_many :book_orders
    has_many :books, through: :book_orders

    
end 