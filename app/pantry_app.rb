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
        prompt.select("Do you want to manage your resources?") do |menu|
            menu.choice "Add a resource to my resources", -> {add_helper}
            menu.choice "View all of my resources", -> {view_helper}
            menu.choice "Update a resource nickname", -> {update_helper}
            menu.choice "Delete a resource", -> {delete_helper}
            menu.choice "Exit", -> {exit}
          end
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

    def view_helper
         my_resources = user.resource_names
         puts "Here are your resources:"
         my_resources.each do |res|
            puts res
         end
         sleep(2.0)
         main_screen
    end

    def select_helper
        fav_resource_arr = user.show_fav_resource
        @selected_resource = prompt.select("Which resource do you want to select?", fav_resource_arr)
        puts "You have selected #{selected_resource.nickname}."
    end # return an instance of fav_resources

    def update_helper
        select_helper
        nickname = prompt.ask("Enter a new nickname?")
        @selected_resource.update(nickname: nickname)
        puts "You updated #{selected_resource.nickname}."
        sleep(1.5)
        main_screen
    end

    def delete_helper
        select_helper
        answer = prompt.yes?("Delete this resource?", convert: :boolean)
        answer ? @selected_resource.destroy : nil
        puts "#{selected_resource.nickname} has been deleted from your fav resources."
        sleep(1.5)
        main_screen
        # my_resources = user.my_resources
        # selected_resource = prompt.select("Which resource would you like to delete?", my_resources.name)
        # a list of all of the resources
        #select a resource
        #when the user clicks enter, that resource gets deleted from fav_resource
    end

    def exit
        puts "See you later!"
    end

end