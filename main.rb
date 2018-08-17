###menu of games to select###
### Start of game program ###
###quit menu###

require_relative 'CoinFlip.rb'
require_relative  #name of next game
require_relative  #name of next game

def menu
  puts "Choose A Game"
  puts "1: Coin Flip"
  puts "2: Slot Machine"
  puts "3 Exit"
  input = gets.strip.to_i
  case 
    when input == 1
      
    when input == 2
      create_contact
    when input == 3
      "Goodbye"
      exit
    else 
      puts 'Try again. Select 1,2, or 3'
  end

