class PantryApp
    attr_reader :prompt
    attr_accessor :user, :password, :selected_resource, :username

    def initialize
        @prompt = TTY::Prompt.new(active_color: :cyan, help_color: :cyan)
        @selected_resource = nil
    end

    def run
        greet
        login_signup
        home_page
    end

    def greet
        system 'clear'
        puts "Provision".black.on_green
        sleep(1.5)
    end

    def login_signup
        prompt.select("Would you like to login or create an account?") do |menu|
            menu.choice "Login", -> {login_helper}
            menu.choice "Create an Account", -> {ca_helper}
        end
    end

    def login_helper
        system 'clear'
        puts "Provision".black.on_green
        @username = prompt.ask("Username:", required: true)
        username_verification
    end

    def username_verification
        @user = User.find_by(username: username)
        if user
            @password = prompt.mask("Password:", required: true)
            password_verification
        else
            prompt.select("There is no account with that username. What would you like to do?") do |menu|
                menu.choice "Try to Login Again", -> {login_helper}
                menu.choice "Create an Account", -> {ca_helper}
            end
        end
    end

    def password_verification
        if @username == user.username && @password == user.password
            puts "Welcome, #{user.username}."
            home_page
        else
            prompt.select("The username and/or password you entered were incorrect. What would you like to do?") do |menu|
                menu.choice "Try to Login Again", -> {login_helper}
                menu.choice "Create an Account", -> {ca_helper}
            end
        end
    end

    def ca_helper
        system 'clear'
        puts "Provision".black.on_green
        username = prompt.ask("Enter a username:", required: true)
        while User.find_by(username: username)
            system 'clear'
            puts "Provision".black.on_green
            puts "This username is already taken."
            username = prompt.ask("Enter a different username to create an account:", required: true)
        end
        system 'clear'
        puts "Provision".black.on_green
        puts "The username #{username} is available."
        sleep(1.5)
        system 'clear'
        puts "Provision".black.on_green
        password = prompt.ask("Enter a password:")
        borough = prompt.select("What borough do you live in?", ["Brooklyn", "Manhattan", "Queens", "Staten Island", "The Bronx"])
        self.user = User.create(username: username, password: password, borough: borough)
        system 'clear'
        puts "Provision".black.on_green
        puts "Welcome, #{user.username}."
        sleep(1.5)
    end

    def home_page
        system 'clear'
        puts "Provision".black.on_green
        prompt.select("What would you like to do?") do |menu|
            menu.choice "Find Pantries", -> {find_helper}
            menu.choice "Manage Your Favorite Pantries", -> {favorites_helper}
            menu.choice "Log Out", -> {exit}
        end
    end

    def find_helper
        system 'clear'
        puts "Provision".black.on_green
        prompt.select("What would you like to do?") do |menu|
            menu.choice "Find Pantries by Borough", -> {borough_helper}
            menu.choice "View Pantry Descriptions", -> {description_helper}
            menu.choice "Find Pantries with Fresh Produce", -> {fresh_helper}
            menu.choice "Home", -> {home_page}
          end
    end

    def favorites_helper
        system 'clear'
        puts "Provision".black.on_green
        if user.fav_resources.empty?
            prompt.select("You do not have any Favorite Pantries. What would you like to do?") do |menu|
                menu.choice "Add  to Your Favorite Pantries", -> {add_helper}
                menu.choice "Return to Home Page", -> {home_page}
                end
        else #user.fav_resources.length >= 0
            prompt.select("What would you like to do?") do |menu|
                menu.choice "View your Favorite Pantries", -> {view_helper}
                menu.choice "Add to Your Favorite Pantries", -> {add_helper}
                menu.choice "Change a Favorite Pantry Nickname", -> {change_helper}
                menu.choice "Delete a Favorite Pantry", -> {delete_helper}
                menu.choice "Return to Home Page", -> {home_page}
                end
        end
    end

    def borough_helper
        system 'clear'
        puts "Provision".black.on_green
        prompt.select("Which pantries would you like to view?") do |menu|
            menu.choice "Pantries in The Bronx", -> {bronx_helper}
            menu.choice "Pantries in Manhattan", -> {manhattan_helper}
            menu.choice "Pantries in All Boroughs", -> {boroughs_helper}
            menu.choice "Back", -> {favorites_helper}
        end
    end

    def description_helper
        system 'clear'
        puts "Provision".black.on_green
        descriptions_arr = Resource.descriptions
        selected_description = prompt.select("Select a pantry to see its description:", descriptions_arr, per_page: 13)
        system 'clear'
        puts "Provision".black.on_green
        puts "#{selected_description}"
        sleep(4.0)
        find_helper
    end

    def fresh_helper
        system 'clear'
        puts "Provision".black.on_green
        fresh_pantries = prompt.select("These pantries offer fresh produce. Select a pantry for more information:", Resource.fresh_produce.sort, per_page: 13)
    end


    def add_helper
    # binding.pry
        system 'clear'
        puts "Provision".black.on_green
        resources = Resource.all_names
        selected_resource_id = prompt.select("Which pantry would you like to add to your Favorite Pantries?", resources, per_page: 20)
        if user.fav_resources.find_by(resource_id: selected_resource_id)
            puts("This pantry is already saved to your Favorite Pantries.")
            sleep(4.0)
        else
        nickname = prompt.ask("Enter a nickname for this pantry:", required: true)
        new_fav = FavResource.new(user_id: user.id, resource_id: selected_resource_id, nickname: nickname)
        new_fav.save
        puts "#{new_fav.resource.name} has been added to your Favorite Pantries."
        end
        sleep(4.0)
        home_page
    end

    def view_helper
        system 'clear'
        puts "Provision".black.on_green
        fav_resource_arr = user.show_fav_resource
        @selected_resource = prompt.select("These are your Favorite Pantries. Select one to view more information.", fav_resource_arr,per_page: 10)
        system 'clear'
        puts "Provision".black.on_green
        # prompt.say("Pantry Name: #{selected_resource.resource.name} -> Pantry Nickname: '#{selected_resource.nickname}'")
        puts "Name: #{selected_resource.resource.name}"
        puts "Pantry Nickname: #{selected_resource.nickname}"
        sleep(4.0)
        favorites_helper
    end

    def change_helper
        select_helper
        system 'clear'
        puts "Provision".black.on_green
        nickname = prompt.ask("Enter a new nickname for #{selected_resource.resource.name}:", required: true)
        @selected_resource.update(nickname: nickname)
        puts "The new nickname is #{selected_resource.nickname}."
        sleep(2.0)
        favorites_helper
    end

    def delete_helper
        select_helper
        system 'clear'
        puts "Provision".black.on_green
        answer = prompt.yes?("Would you like to delete this pantry from your Favorite Pantries?", convert: :boolean) do |q|
            q.suffix "Yes/No"
        end
        if answer
            @selected_resource.destroy
            puts "#{@selected_resource.resource.name} has been deleted from your Favorite Pantries."
        else 
            puts "#{@selected_resource.resource.name} will remain in your Favorite Pantries."
        end
        sleep(3.0)
        favorites_helper
    end

    def bronx_helper
        system 'clear'
        puts "Provision".black.on_green
        bronx_data = Resource.bronx_names
        bronx_pantry_names = bronx_data.map{|bronx| bronx.name}
        user_bronx_pantry = prompt.select("Here are all of the pantries in The Bronx:", bronx_pantry_names, per_page: 10.0)
        system 'clear'
        puts "Provision".black.on_green
        pantry = bronx_data.find{|bronx_pantry| bronx_pantry.name == user_bronx_pantry}
        puts "Name: #{pantry.name}"
        puts "Pantry Information: #{pantry.description}"
        sleep(6.0)
        borough_helper
    end

    def manhattan_helper
        system 'clear'
        puts "Provision".black.on_green
        manhattan_data = Resource.manhattan_names
        manhattan_pantry_names = manhattan_data.map{|manhattan| manhattan.name}
        user_manhattan_pantry = prompt.select("Here are all of the pantries in Manhattan:", manhattan_pantry_names, per_page: 10)
        pantry = manhattan_data.find{|manhattan_pantry| manhattan_pantry.name == user_manhattan_pantry}
        puts "Name: #{pantry.name}"
        puts "Pantry Information: #{pantry.description}"
        sleep(6.0)
        borough_helper
    end

    def boroughs_helper
        system 'clear'
        puts "Provision".black.on_green
        boroughs_data = Resource.boroughs_names
        boroughs_pantry_names = boroughs_data.map{|boroughs| boroughs.name}
        user_boroughs_pantry = prompt.select("Here are all of the pantries in New York City:", boroughs_pantry_names, per_page: 20)
        pantry = boroughs_data.find{|boroughs_pantry| boroughs_pantry.name == user_boroughs_pantry}
        puts "Name: #{pantry.name}"
        puts "Pantry Information: #{pantry.description}"
        sleep(6.0)
        borough_helper
    end

    def select_helper
        system 'clear'
        puts "Provision".black.on_green
        fav_resource_arr = user.show_fav_resource
        @selected_resource = prompt.select("Which pantry would you like to select?", fav_resource_arr, per_page: 14)
        puts "You have selected #{selected_resource.resource.name}."
    end
    
    def exit
        system 'clear'
        puts "Provision".black.on_green
        puts "Goodbye, #{user.username}."
    end

end