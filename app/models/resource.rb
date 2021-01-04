class Resource < ActiveRecord::Base
    has_many :fav_resources
    has_many :users, through: :fav_resources

    def self.all_names
        self.all.map{|resource| {resource.name => resource.id}}
    end

end