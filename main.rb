###menu of games to select###
### Start of game program ###
###quit menu###

require_relative 'CoinFlip.rb'
require_relative 'SlotMachine.rb'


def menu
  puts "Choose A Game"
  puts "1: Coin Flip"
  puts "2: Slot Machine"
  puts "3 Exit"
  input = gets.chomp.to_i
  case input
    when 1
      CoinFlip.new(10.00).start
    when 2
      SlotMachine.new
    when 3
      "Goodbye"
      exit
    else 
      puts 'Select Another Game. Select 1 or 2'
  end
end

  while true
    menu  
  end