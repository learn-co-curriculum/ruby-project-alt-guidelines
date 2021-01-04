class PantryApp
    attr_accessor :user
    include CliControls

    def run
        greet
        login_or_signup
        see_resources
        goodbye
    end

    def greet
    end

    def login_or_signup
    end

    def see_resources
    end

    def goodbye
    end

end