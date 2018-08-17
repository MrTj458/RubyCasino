#Written by Trevor H.
require 'colorize'

class Wallet
  attr_reader :balance

  def initialize(balance)
    @balance = balance
  end

  # Add the inputted amount to the wallet
  def add_money(amount)
    @balance += amount
    print_balance
  end

  # Take the inputted amount of money out of the wallet
  # Return true if it was able to, false if it would drop below $0
  def take_money(amount)
    if @balance - amount < 0
      puts "You do not have that much money"
      print_balance
      return false
    else
      @balance -= amount
      print_balance
      return true
    end
  end

  def has_amount(amount)
    if @balance - amount >= 0
      return true
    else
      return false
    end
  end

  # Puts the current balance to the terminal
  def print_balance
    printf("You current balance is: $%.2f\n".colorize(:cyan), @balance)
  end
end