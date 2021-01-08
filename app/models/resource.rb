class Resource < ActiveRecord::Base
    
    has_many :fav_resources
    has_many :users, through: :fav_resources

    def self.all_names
        self.all.map{|resource| {resource.name => resource.id}}
    end

    def self.bronx_names
        bronx_resources = self.all.select{|resource| resource.borough == "The Bronx"}
    end

    def self.manhattan_names
        manhattan_resources = self.all.select{|resource| resource.borough == "Manhattan"}
    end

    def self.boroughs_names
        boroughs_resources = self.all
    end

    def self.fresh_produce
        fresh_arr = self.all.select{|res| res.fresh}
        # fresh_arr.pluck(:name)
    end

    def self.descriptions
        self.all.map{|res| {res.name => res.description}}
    end

end