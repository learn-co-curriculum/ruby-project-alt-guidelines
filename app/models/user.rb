class User < ActiveRecord::Base
    has_many :fav_resources
    has_many :resources, through: :fav_resources

    def resource_names
        resources.pluck(:name)
    end #gets only the name from users fav resources 

    def show_fav_resource
        self.fav_resources.all.map{|fav|{fav.nickname => fav}}
    end #return value is a hash with fav_nickname and fav instance


    def my_resources
        self.fav_resources.all.map{|fav_resource| fav_resource.resource}
    end

    def my_resources_id
        self.fav_resources.all.map{|fav_resource| {fav_resource.resource.name => fav_resource.id}}
    end

end