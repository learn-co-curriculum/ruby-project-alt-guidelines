class User < ActiveRecord::Base
    
    has_many :fav_resources
    has_many :resources, through: :fav_resources

    def resource_names
        resources.pluck(:name)
    end

    def show_fav_resource
        self.fav_resources.all.map{|fav|{fav.nickname => fav}}
    end 

    def show_favs?
        return no_favs if self.fav_resources.length == 0
        show_favs
    end

    def no_favs
        puts "You have no saved resources."
    end

    def show_favs
        puts "Your saved resources are: #{resources.pluck(:name)}"
    end
    
end