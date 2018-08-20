class Game21


limit = "21"
tries = ""
tries_count = 0
tries_limit = 3
out_of_tries = false

puts "Welcome to 21Ways"
puts "ready to have fun?"
puts "enter -yes- to play this awesome game"
user = gets.chomp()

if user == "yes"
    puts ("Let's play 21")
    puts ("enter to ask for a random card")
    puts ("if you go over 21 after 3 cards, you loose")
    puts ("if you stay under 21 after 3 cards, you win")
    puts ("here is your first number:")
else
    puts ("You will regreat this decision")
end

    stack = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13"]
    user = stack.sample
    puts user

    while user != limit and !out_of_tries
        if tries_count < tries_limit
        puts "hit me"
        user = gets.chop()
        tries_count += 1
        else
            puts "you loose"
        end

Cards.new
end
end