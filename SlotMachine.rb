class Wheel
    attr_accessor :fruit
    attr_accessor :position

    def initialize(fruit, position)
        @fruit = fruit
        @position = position
    end
end

class SlotMachine #Keeps track of win line arrangement
    attr_accessor :status
    def initialize
        @fruits = %w(Cherry Banana Peach)
        @positions = %w(1 2 3)
        @status = []
        generate_slot
    end


    def shuffle_slots
        @status.shuffle
    end
       
       def generate_slot
         @fruits.size.times do |fruit|
           @positions.size.times do |i| 
             @status << Wheel.new( @fruits[i], fruit)
           end
         end
       end

       def print_slots
        @status.size.times do |x|
            puts status[x].fruit
        end
    end
end

d = SlotMachine.new
puts d.status
d.print_slots