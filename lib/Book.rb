class Book < ActiveRecord::Base
    has_many :book_orders
    has_many :book_stores, through: :book_orders
end 


