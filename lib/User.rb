class User < ActiveRecord::Base
    has_many :locations
    has_many :reviews, through: :locations

end