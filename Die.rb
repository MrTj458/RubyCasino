# Written by Trevor H.

# Made with module so you do not need
# to make an instance of Die.
# Just require it and call Die.roll_die(sides)
module Die
  def self.roll_die(sides)
    return 1 + rand(sides)
  end
end