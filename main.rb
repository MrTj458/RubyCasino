# Written by Trevor H. and Ladd M.

require_relative 'CoinFlip.rb'
require_relative 'SlotMachine.rb'
require 'colorize'
require 'artii'
require 'lolcat'

class Main
  def initialize
    @wallet = Wallet.new(50.00)
  end

  def start
    while true
      menu  
    end
  end

  def menu
    system('clear')
    system('artii \'Ruby Casino\' | lolcat -a -s 500')
    puts "Pick A Game".colorize(:cyan)
    puts "1: Coin Flip".colorize(:blue)
    puts "2: Slot Machine".colorize(:blue)
    puts "3: Exit".colorize(:red)
    print '> '
    input = gets.chomp.to_i
    case input
    when 1
      CoinFlip.new(@wallet).start
    when 2
      SlotMachine.new
    when 3
      quit
    else 
      puts 'Select Another Game. Select 1 or 2'
    end
  end

  def quit
    system('artii \'Thanks for playing!\' --font slant | lolcat -a -s 500')
    exit
  end
end

### Start of program ###
Main.new.start