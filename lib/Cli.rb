class Cli
def start
    loop do   
    greet
    user = login
    menu
    end
    # viewing_reviews
    # puts display_reviews($location)
    end

   
    def greet
puts 'Welcome to AirBnB, the most convenient way to review your next trip!'
end

def login
    puts "Hello, what is your name?"
    answer = gets.chomp
    @user = User.find_or_create_by(name: answer)
    puts "Welcome back, #{@user.name.capitalize}!"

end

def menu
    puts "Select the location you want to leave or see a review for!"
    puts Location.all.map{|location| location.name}
    answer = gets.chomp.capitalize
    $location = Location.find_or_create_by(name: answer)
    puts "Sounds good, do you want to leave or see a review for #{$location.name.capitalize}?"
    
        loop do
            options
            choice = gets.chomp

            case choice 
            when "1"
                puts "Enter your review"
                response = gets.chomp
                @review = Review.find_or_create_by(description: response, name: $location, user_id:@user.id, location_id:$location.id)
                @review.save
                puts "Thank you for your review"
            when "2"
                puts Review.all.select {|review| review.user_id == @user.id}
                puts "Which review did you want to delete?"
             when "3"
                puts display_reviews($location)
            when "4"
                break
            when "5"
            exit
            end
        end
    end


def display_reviews(location)
    arr = Review.all.select do |t|
            t.name == location.name
            # binding.pry
        end
    arr2 = arr.map{|review| review.description}
end

def options
    puts "[1] Leave a review"
    puts "[2] Delete a review"
    puts "[3] See a review"
    puts "[4] Back to main menu"
    puts "[5] Exit app"
end



    # if "see a review"
    #     print Review.all
    # elsif "leave a review"
    #     puts review.create

    # end


# def create_a_review
#     Review.new do
#     end


# def viewing_reviews
#     Review.all.each do
#         puts "name: #{review.name}"
#         puts "description: #{review.description}"
#     end
#     self.greet
# end

# end
end