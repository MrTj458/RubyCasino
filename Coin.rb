# Written by Trevor H.

# A coin that can be flipped
# I think this is more complex than
# it needs to be, but it works
# so I'm not going to mess with it.
module Coin
  def self.flip(choice)
    case choice
    when 'heads'
      if flip_coin == true
        return true
      else
        return false
      end
    when 'tails'
      if flip_coin == true
        return false
      else
        return true
      end
    else
      puts 'Unknown input'
    end
  end

  # Private helper method
  # DO NOT CALL THIS FROM OUTSIDE THE MODULE
  # It will give a 'private method' error
  private_class_method def self.flip_coin
    flip = rand(0..1)
    if flip == 0
      return true
    else
      return false
    end
  end
end