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
    end

    def print_slots
        @state.each do |wheel|
            puts "#{wheel.fruit} #{wheel.position}"
            end
    end

    
end
    
slot = SlotMachine.new
puts '###########################################'
slot.print_slots
