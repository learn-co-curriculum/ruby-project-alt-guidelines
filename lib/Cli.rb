class Cli
def start
    loop do   
    greet
    user = login
    menu
    display_reviews
    options    
    end
    # viewing_reviews
    # puts display_reviews(@location)
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
    @location = Location.find_or_create_by(name: answer)
    puts "Sounds good, do you want to leave or see a review for #{@location.name.capitalize}?"
    
        loop do
            options
            choice = gets.chomp

            case choice 
            when "1"
                puts "Enter your review"
                response = gets.chomp
                system("clear")
                @review = Review.find_or_create_by(description: response, name: @location, user_id:@user.id, location_id:@location.id)
                @review.save
                puts "Thank you for your review"
            when "2"
                arr = Review.all.select {|review| review.user_id == @user.id}
                arr.each.with_index(1) do |review, index|
                    puts "#{index}. #{review.description}"
                end
                puts "Which review did you want to delete?"
                response = gets.chomp
                system("clear")
                r = response.to_i
                arr[r-1].destroy
                puts "Your review has been deleted"
            when "3"
                arr = Review.all.select {|review| review.user_id == @user.id}
                arr.each.with_index(1) do |review, index|
                    puts "#{index}. #{review.description}"
                end
                puts "Which review did you want to update?"
                response = gets.chomp
                r = response.to_i
                puts "Please enter your review here"
                response2 = gets.chomp
                review = arr[r-1]
                # puts review.inspect
                review.description = response2
                review.save
                puts "Your review has been updated"
            when "4"
                puts display_reviews(@location)
            when "5"
                break
            when "6"
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
    puts "[3] Update a review"
    puts "[4] See a review"
    puts "[5] Back to main menu"
    puts "[6] Exit app"
   
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