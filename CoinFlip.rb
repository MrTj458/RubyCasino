# Written by Trevor H.
require_relative 'Wallet.rb'
require_relative 'Coin.rb'
require 'colorize'
require 'pry'
require 'artii'

# Coin flip game
class CoinFlip
  def initialize(starting_balance)
    @wallet = Wallet.new(starting_balance)
  end

  # Starts the game. Run this after initialize
  def start
    system('clear')
    puts `artii \'Coin Flip!\' --font slant`.colorize(:gray)
    puts 'Type QUIT to stop playing'.colorize(:blue)
    @wallet.print_balance
    # Play the game until the user quits
    while true
      play_game
    end
  end

  def  play_game
    # Check that the user has put in valid information
    incorrect_flag = false
    user_bet = 0
    until user_bet > 0
      if incorrect_flag
        puts "Must be a number larger than 0".colorize(:yellow)
        @wallet.print_balance
      end
      # Get how much the user wants to bet
      puts 'How much would you like to bet?'
      user_bet = gets.chomp.downcase
      # Check if the user wants to quit at this point
      quit if user_bet == 'quit'
      user_bet = user_bet.to_f
      # Make sure that the user has enough money to bet the amount they entered
      unless @wallet.has_amount(user_bet)
        user_bet = 0
        puts "You do not have enough money in your wallet.".colorize(:red)
      end
      # If the loop goes around again it know that the user
      # entered something wrong. incorrect_flag never need to be reset
      # as it is thrown away as soon as a correct number is entered.
      incorrect_flag = true
    end

    user_selection = ''
    # Make sure that the user can only enter heads, tails, or quit
    until user_selection == 'heads' || user_selection == 'tails' || user_selection == 'quit'
      puts 'Heads or Tails?'
      user_selection = gets.chomp.downcase
    end
    # Quit if the user wants
    quit if user_selection == 'quit'
    # Flip the coin
    result = Coin.flip(user_selection)
    if result
      # The user picked the winning side
      system('clear')
      puts `artii \'You Win!\'`.colorize(:green)
      @wallet.add_money(user_bet)
    else
      # The user picked the loosing side
      system('clear')
      puts `artii \'You Lose!\'`.colorize(:red)
      @wallet.take_money(user_bet)
    end
  end

  # Quit the program. Made a function for less typing elsewhere
  def quit
    system('clear')
    puts `artii \'Bye!\' --font slant`.colorize(:gray)
    exit
  end
end