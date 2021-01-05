class PantryApp
    attr_reader :prompt
    attr_accessor :user, :selected_resource
    # include CliControls

    def initialize
        @prompt = TTY::Prompt.new
    end

    def run
        greet
        login_or_signup
        main_screen
        exit
    end

    def greet
        puts "Welcome to Pantry App. Find food resources near you!"
        sleep(2.0)
    end

    def login_or_signup
        username = prompt.ask("Enter your username to log in or sign up!")
        neighborhood = prompt.ask("What neighborhood do you live in?")
        self.user = User.find_or_create_by(username: username, neighborhood: neighborhood)
        puts "Thanks for signing in, #{user.username}!"
        sleep(1.75)
    end

    def main_screen
        system 'clear'
        user.reload
        prompt.select("What do you want to do?") do |menu|
            menu.choice "Find Resources in New York City", -> {find_helper}
            menu.choice "Add a resource to my resources", -> {add_helper}
            menu.choice "View all of my resources", -> {view_helper}
            menu.choice "Update a resource nickname", -> {update_helper}
            menu.choice "Delete a resource", -> {delete_helper}
            menu.choice "Exit", -> {exit}
          end
    end

    def find_helper
        prompt.select("Find resources by:") do |menu|
            menu.choice "Borough", -> {borough_helper}
            menu.choice "Fresh food offered", -> {fresh_helper}
            menu.choice "View resources descriptions", -> {description_helper}
          end
    end

    def borough_helper
    end

    def fresh_helper
    end

    def description_helper
    end

    def add_helper
        resources = Resource.all_names
        selected_resource_id = prompt.select("Which resource do you wish to add?", resources)
        nickname = prompt.ask("Enter a nickname for this resource?")
        new_fav = FavResource.create(user_id: user.id, resource_id: selected_resource_id, nickname: nickname)
        puts "Congratulations! You added #{new_fav.resource.name} to your fav resources."
        sleep(2.0)
        main_screen
    end

    def select_helper
        fav_resource_arr = @user.show_fav_resource
        @selected_resource = prompt.select("Which resource do you want to select?", fav_resource_arr)
        puts "You have selected #{selected_resource.nickname}."
        sleep(1.0)
    end # return an instance of fav_resources

    def view_helper
        if user.fav_resources.length == 0
            answer = prompt.yes?("You have no saved resources. Add a resource?", convert: :boolean)
            answer ? add_helper : main_screen
        else 
            select_helper
        end
        prompt.say("Resource: #{selected_resource.resource.name} -> Your resource nickname: '#{selected_resource.nickname}'")
        sleep(1.5)
        main_screen
    end

    def update_helper
        select_helper
        new_nickname = prompt.ask("Enter a new nickname?", default: "none")
        @selected_resource.update(nickname: new_nickname)
        puts "You updated #{selected_resource.resource.name} to #{selected_resource.nickname}."
        sleep(1.5)
        main_screen
    end

    def delete_helper
        select_helper
        answer = prompt.yes?("Delete this resource?", convert: :boolean)
        if answer
             @selected_resource.destroy
        puts "#{selected_resource.resource.name} has been deleted from your fav resources."
        end
        sleep(1.5)
        main_screen
    end

    def exit
        puts "See you later!"
    end

end