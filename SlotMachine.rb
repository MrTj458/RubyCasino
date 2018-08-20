require_relative 'Wheel'

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
        y=0
         @fruits.size.times do |fruit|
           @positions.size.times do |i| 

            @state << Wheel.new(@fruits[rand(i+1)], fruit)
            y =+ 1
                end
            end
            shuffle_slots
            puts @state.each
        end

    def shuffle_slots
        @state = @state.shuffle
    end

    def print_slots
        @state.each do |wheel|
            puts "#{wheel.fruit} #{wheel.position}"
            store_wins
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

    # def massresults
    #     i=0
    #     while i < 100  do
    #         shuffle_slots
    #         store_wins
    #         i += 1
    #      end
    # end


end


    

