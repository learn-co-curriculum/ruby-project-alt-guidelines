class Cli
def start
greet
user = login_or_signup
menu
end

   
    def greet
puts 'Welcome to AirBnB, the most convenient way to review your next trip!'
end

def login_or_signup
    puts "Did you want to login or sign up?"
    answer = gets.chomp
    @user = User.find_or_create_by(name: answer)
    puts "Welcome back, #{@user.name.capitalize}!"

end

def menu
    puts "Select the location you want to leave or see a review for!"
    answer = gets.chomp
    @location = Location.find_or_create_by(name: answer)
    puts "Sounds good, do you want to leave or see a review for #{@location.name.capitalize}?"
end

def viewing_reviews
    Review.all.each do
        puts "name: #{review.name}"
        puts "description: #{review.description}"
    end
    self.greet
end
end
