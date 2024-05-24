require 'pry'

# Ship Model

class Ship

  attr_reader :name, :length, :health

  def initialize(name, length)
    @name = name
    @length = length
    @health = length
    @sunk = false
  end

  def sunk?
    if (@health > 0)
      return false
    elsif (@health <= 0)
      return true
    end
  end

  def hit
    # @health = @health - 1
    @health -= 1
  end
end

# binding.pry

