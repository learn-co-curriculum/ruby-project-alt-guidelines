class BookOrder < ActiveRecord::Base
    belongs_to :book_store
    belongs_to :book

    
end 