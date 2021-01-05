class Resource < ActiveRecord::Base
    has_many :fav_resources
    has_many :users, through: :fav_resources

    def self.all_names
        self.all.map{|resource| {resource.name => resource.id}}
    end

    def self.fresh_resources
        fresh_arr = self.all.select{|res| res.fresh}
        fresh_arr.pluck(:name)
    end

    def self.descriptions
        self.all.map{|res| {res.name => res.description}}
    end

    def self.boroughs
    end

end