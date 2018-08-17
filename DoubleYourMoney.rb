# Written by Trevor H.
require_relative 'Wallet.rb'
require_relative 'Coin.rb'
require 'colorize'
require 'pry'

class DoubleYourMoney
  def initialize(starting_balance)
    @wallet = Wallet.new(starting_balance)
  end

  def start
    puts 'Welcome to Double Your Money!'.colorize(:green)
    puts 'Type QUIT to stop playing'.colorize(:blue)
    @wallet.print_balance
    while true
      play_game
    end
  end

  def  play_game
    incorrect_flag = false
    user_bet = 0
    until user_bet > 0
      if incorrect_flag
        puts "Must be a number larger than 0".colorize(:yellow)
        @wallet.print_balance
      end
      puts 'How much would you like to bet?'
      user_bet = gets.chomp.downcase
      quit if user_bet == 'quit'
      user_bet = user_bet.to_f
      unless @wallet.has_amount(user_bet)
        user_bet = 0
        puts "You do not have enough money in your wallet.".colorize(:red)
        @wallet.print_balance
      end
      incorrect_flag = true
    end

    user_selection = ''
    until user_selection == 'heads' || user_selection == 'tails' || user_selection == 'quit'
      puts 'Heads or Tails?'
      user_selection = gets.chomp.downcase
    end
    quit if user_selection == 'quit'
    result = Coin.flip(user_selection)
    if result
      puts "You Win!".colorize(:green)
      @wallet.add_money(user_bet)
    else
      puts "Better luck next time!".colorize(:red)
      @wallet.take_money(user_bet)
    end
  end

  def quit
    puts "Thanks for playing!".colorize(:green)
    exit
  end
end

test = DoubleYourMoney.new(10.00)
test.start