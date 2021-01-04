class User < ActiveRecord::Base
    has_many :fav_resources
    has_many :resources, through: :fav_resources

    def my_resources
        self.fav_resources.map{|fav_resource| fav_resource.resource.name}
    end

    def update
    end

    def self.resources
    end
end