class PantryApp
    attr_reader :prompt
    attr_accessor :user, :selected_resource
    # include CliControls

    def initialize
        @prompt = TTY::Prompt.new
    end

    def run
        greet
        login_signup
        home_page
        # exit
    end

    def greet
        puts "Welcome to Pantry App. Find food pantries near you!"
        sleep(2.0)
    end

    def login_signup
        prompt.select("Would you like to login or create an account?") do |menu|
            menu.choice "Login", -> {login_helper}
            menu.choice "Create an Account", -> {ca_helper}
        end
    end

    def login_helper
        username = prompt.ask("Enter your username to login:")
        self.user = User.find_by(username: username)
        puts "Welcome, #{user.username}."
        sleep (1.5)
    end

    def ca_helper
        username = prompt.ask("Enter a username to create an account:")
        while User.find_by(username: username)
            puts "This username is already taken."
            username = prompt.ask("Enter a different username to create an account:")
        end
        borough = prompt.ask("What borough do you live in?")
        self.user = User.create(username: username, borough: borough)
        puts "Welcome, #{user.username}."
        sleep(1.5)
    end

    def home_page
        system 'clear'
        user.reload
        prompt.select("What would you like to do?") do |menu|
            menu.choice "Find a Pantry", -> {find_helper}
            menu.choice "Manage Your Favorite Pantries", -> {favorites_helper}
            menu.choice "Log Out", -> {exit}
        end
    end

    def find_helper
        prompt.select("Find pantries by:") do |menu|
            menu.choice "Borough", -> {borough_helper}
            menu.choice "Fresh food offered", -> {fresh_helper}
            menu.choice "View resources descriptions", -> {description_helper}
            menu.choice "Return to Home Page", -> {home_page}
          end
    end

    def borough_helper
        prompt.select("Which pantries would you like to view?") do |menu|
            menu.choice "Pantries in The Bronx", -> {bronx_helper}
            menu.choice "Pantries in Manhattan", -> {manhattan_helper}
            menu.choice "Pantries in All Boroughs", -> {boroughs_helper}
        end
    end

    def fresh_helper
        Resource.fresh_resources.each do |resource|
            puts resource
        end
        sleep(1.5)
        find_helper
    end

    def description_helper
        descriptions_arr = Resource.descriptions
        selected_description = prompt.select("Select resource to see description.", descriptions_arr)
        puts "#{selected_description}"
        sleep(2.0)
        find_helper
    end

    def bronx_helper
        puts Resource.bronx_names
        sleep(3)
        home_page
    end

    def manhattan_helper
        puts Resource.manhattan_names
        sleep(3)
        home_page
    end

    def boroughs_helper
        puts Resource.boroughs_names
        sleep(3.0)
        home_page
    end

    def favorites_helper
        system 'clear'
        user.reload
        prompt.select("What would you like to do?") do |menu|
            menu.choice "View your Favorite Pantries", -> {view_helper}
            menu.choice "Change a Favorite Pantry Nickname", -> {change_helper}
            menu.choice "Add to Your Favorite Pantries", -> {add_helper}
            menu.choice "Delete a Favorite Pantry", -> {delete_helper}
            menu.choice "Return to Home Page", -> {home_page}
        end
    end

    def select_helper
        fav_resource_arr = user.show_fav_resource
        @selected_resource = prompt.select("Which pantry do you want to select?", fav_resource_arr)
        puts "You have selected #{selected_resource.resource.name}."
    end # return an instance of fav_resources

    def change_helper
        select_helper
        nickname = prompt.ask("Enter a new nickname:")
        @selected_resource.update(nickname: nickname)
        puts "The new nickname is #{selected_resource.nickname}."
        sleep(2.0)
        home_page
    end

    def add_helper
        resources = Resource.all_names
        selected_resource_id = prompt.select("Which pantry would you like to add to your Favorite Pantries?", resources)
        nickname = prompt.ask("Enter a nickname for this pantry:") do |q|
            q.required true
          end 
        new_fav = FavResource.create(user_id: user.id, resource_id: selected_resource_id, nickname: nickname)
        puts "#{new_fav.resource.name} has been added to your Favorite Pantries."
        sleep(2.0)
        home_page
    end

    def view_helper
        if user.fav_resources.length == 0
            answer = prompt.yes?("You have no saved resources. Add a resource?", convert: :boolean)
            answer ? add_helper : main_screen
        else 
            select_helper
        end
        prompt.say("Resource: #{selected_resource.resource.name} -> Your resource nickname: '#{selected_resource.nickname}'")
        sleep(1.5)
        home_page
    end

    def delete_helper
        select_helper
        answer = prompt.yes?("Would you like to delete this pantry from your Favorite Pantries?", convert: :boolean)
        if answer
            @selected_resource.destroy
            puts "#{@selected_resource.resource.name} has been deleted from your Favorite Pantries."
        else 
            puts "#{@selected_resource.resource.name} will remain in your Favorite Pantries."
        end
        sleep(2.0)
        home_page
    end
    
    def exit
        puts "Goodbye"
    end

end