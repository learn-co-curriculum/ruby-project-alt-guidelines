class User < ActiveRecord::Base
    has_many :fav_resources
    has_many :resources, through: :fav_resources
end