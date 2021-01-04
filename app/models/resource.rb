class Resource < ActiveRecord::Base
    has_many :fav_resources
    has_many :users, through: :fav_resources
end