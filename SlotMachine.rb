require_relative 'Wheel'
require 'pry'

class SlotMachine #Keeps track of win line arrangement
    attr_accessor :state
    def initialize
        @positions = %w(1 2 3)
        @fruits = %w(Cherry Banana Peach)
        @state = []
        @zeros = []
        @ones = []
        @twos = []
        @ban = nil
        @chr = nil
        @pch = nil
        generate_slot
    end

       def generate_slot
           @positions.size.times do |i| 
             @state << Wheel.new(i, @fruits.sample)
            end
            shuffle_slots
            puts @state
        end

    def shuffle_slots
        @state.shuffle!
       
    end

    def print_slots
        @state.each do |wheel|
            puts "#{wheel.fruit} #{wheel.position}"
        end
    end
    def store_wins
        @state.each do |chk|
                case chk.fruit.to_s
                    when '0'  
                    @zeros << chk.position
                    when '1'
                    @ones << chk.position
                    when '2'
                    @twos << chk.position
                    end
                end
                puts @state
               
    end    
    def win_test(arr)
        @ban = arr.count('Banana')
        @chr = arr.count('Cherry')
        @pch = arr.count('Peach')
        if 
            @ban == 3
            puts "You Win!!"
        else 
            puts "Try Agian..."
        end

        if 
            @chr == 3
            puts "You Win!!"
        else 
            puts "Try Agian..."
        end

        if 
            @pch == 3
            puts "You Win!!"
        else 
            puts "Try Agian..."
        end
        
    end
    

    def printwin
        win_test(@zeros)
        puts @zeros.join(' ')
        win_test(@ones)
        puts @ones.join(' ')
        win_test(@twos)
        puts @twos.join(' ')
    end    

end



    

