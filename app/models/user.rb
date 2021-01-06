class User < ActiveRecord::Base
    has_many :fav_resources
    has_many :resources, through: :fav_resources

    def resource_names
        resources.pluck(:name)
    end #gets only the name from user's fav resources 

    def show_fav_resource
        self.fav_resources.all.map{|fav|{fav.nickname => fav}}
    end #return value is a hash with fav's nicknames and fav's instances
end