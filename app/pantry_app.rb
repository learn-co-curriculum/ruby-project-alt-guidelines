class PantryApp
    attr_reader :prompt
    attr_accessor :user
    # include CliControls

    def initialize
        @prompt = TTY::Prompt.new
    end

    def run
        greet
        login_or_signup
        manage_resources
        goodbye
    end

    def greet
        puts "hello"
    end

    def login_or_signup
        prompt.ask("Do you want to log in or sign up?")
    end

    def manage_resources
        prompt.ask("Do you want to manage your resources?")
    end

    def goodbye
        puts "See you later!"
    end

end