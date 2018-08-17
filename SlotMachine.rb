require_relative 'Wheel'

class SlotMachine #Keeps track of win line arrangement
    attr_accessor :state
    def initialize
        @positions = %w(1 2 3)
        @fruits = %w(Cherry Banana Peach)
        @state = []
        generate_slot
    end

       def generate_slot
         @fruits.size.times do |fruit|
           @positions.size.times do |i| 
            @state << Wheel.new(@fruits[i], fruit)
                end
            end
            shuffle_slots
        end

    def shuffle_slots
        @shuffle = @state.shuffle
        print_slots
    end

    def print_slots
        @shuffle.each do |wheel|
            puts "#{wheel.fruit} ,#{wheel.position}"
            end
    end
######################################################
# def pairs(array)
#     i = 0
#     while i < array.length
#       y = i + 1
#       while y < array.length
#         if array[i] + array[y] == 0
#           return true
#         end
#         y += 1
#       end
#       i += 1
#     end
#     return false
#   end
  ###################################################
    def check_win
        @state.(2).times do |check|
            equal =(@state[check] == @state[check + 1])
            if equal == true
                puts "You Win!!!"
            else
                puts "Try Again, Your Odds Are Good!!!"
            end
        end
    end


end
slot = SlotMachine.new
puts '###########################################'
slot.shuffle_slots
slot.check_win
